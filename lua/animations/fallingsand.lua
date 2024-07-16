local bit = require("bit")

local M = {
    fps = 30,
    side_noise = true,
    disperse_rate = 2,
    name = "falling_sand",
}

local frame
local ELEMENTS = {
    EMPTY = 0,
    SAND = 1,
    BRICK = 2,
    WATER = 3,
    WATER_SPOUT = 4,
    GRASS = 5,
    FIRE = 6,
    FIREWALL = 7,
}

local function hash_string(str)
    local hash = 5381
    for i = 1, #str do
        hash = bit.band(((hash * 33) + string.byte(str, i)), 0xFFFFFFFF)
    end
    return hash
end

local function get_element_type(cell)
    local hl_group = cell.hl_group or ""
    local hash = hash_string(hl_group)
    return (hash % 7) + 1 -- +1 to avoid EMPTY, which is 0
end

local function is_empty(grid, x, y)
    return x > 0 and x <= #grid and y > 0 and y <= #grid[1] and get_element_type(grid[x][y]) == ELEMENTS.EMPTY
end

local function swap_cells(grid, x1, y1, x2, y2)
    grid[x1][y1], grid[x2][y2] = grid[x2][y2], grid[x1][y1]
end

local function update_sand(grid, x, y)
    if is_empty(grid, x, y + 1) then
        swap_cells(grid, x, y, x, y + 1)
        return true
    elseif is_empty(grid, x - 1, y + 1) then
        swap_cells(grid, x, y, x - 1, y + 1)
        return true
    elseif is_empty(grid, x + 1, y + 1) then
        swap_cells(grid, x, y, x + 1, y + 1)
        return true
    end
    return false
end

local function update_water(grid, x, y)
    if is_empty(grid, x, y + 1) then
        swap_cells(grid, x, y, x, y + 1)
        return true
    elseif is_empty(grid, x - 1, y + 1) then
        swap_cells(grid, x, y, x - 1, y + 1)
        return true
    elseif is_empty(grid, x + 1, y + 1) then
        swap_cells(grid, x, y, x + 1, y + 1)
        return true
    elseif is_empty(grid, x - 1, y) then
        swap_cells(grid, x, y, x - 1, y)
        return true
    elseif is_empty(grid, x + 1, y) then
        swap_cells(grid, x, y, x + 1, y)
        return true
    end
    return false
end

local function update_fire(grid, x, y)
    if is_empty(grid, x, y - 1) then
        swap_cells(grid, x, y, x, y - 1)
        return true
    elseif is_empty(grid, x - 1, y - 1) then
        swap_cells(grid, x, y, x - 1, y - 1)
        return true
    elseif is_empty(grid, x + 1, y - 1) then
        swap_cells(grid, x, y, x + 1, y - 1)
        return true
    end
    return false
end

local function grow_grass(grid, x, y)
    for dx = -1, 1 do
        for dy = -1, 1 do
            if is_empty(grid, x + dx, y + dy) then
                grid[x + dx][y + dy] = { char = "*", hl_group = "Grass" }
                return true
            end
        end
    end
    return false
end

M.init = function(grid)
    frame = 1
end

M.update = function(grid)
    frame = frame + 1
    local was_state_updated = false

    -- Reset 'processed' flag
    for x = 1, #grid do
        for y = 1, #grid[1] do
            grid[x][y].processed = false
        end
    end

    for x = #grid, 1, -1 do
        for y = #grid[1], 1, -1 do
            local cell = grid[x][y]
            if cell.processed then
                goto continue
            end

            local element_type = get_element_type(cell)
            cell.processed = true

            if element_type == ELEMENTS.SAND then
                was_state_updated = update_sand(grid, x, y) or was_state_updated
            elseif element_type == ELEMENTS.WATER then
                was_state_updated = update_water(grid, x, y) or was_state_updated
            elseif element_type == ELEMENTS.WATER_SPOUT then
                if is_empty(grid, x, y + 1) then
                    grid[x][y + 1] = { char = "~", hl_group = "Water" }
                    was_state_updated = true
                end
            elseif element_type == ELEMENTS.GRASS then
                for dx = -1, 1 do
                    for dy = -1, 1 do
                        local nx, ny = x + dx, y + dy
                        if nx > 0 and nx <= #grid and ny > 0 and ny <= #grid[1] then
                            local neighbor = grid[nx][ny]
                            if get_element_type(neighbor) == ELEMENTS.WATER then
                                was_state_updated = grow_grass(grid, x, y) or was_state_updated
                            elseif get_element_type(neighbor) == ELEMENTS.FIRE then
                                grid[x][y] = { char = " ", hl_group = "" }
                                was_state_updated = true
                            end
                        end
                    end
                end
            elseif element_type == ELEMENTS.FIRE then
                was_state_updated = update_fire(grid, x, y) or was_state_updated
                for dx = -1, 1 do
                    for dy = -1, 1 do
                        local nx, ny = x + dx, y + dy
                        if nx > 0 and nx <= #grid and ny > 0 and ny <= #grid[1] then
                            local neighbor = grid[nx][ny]
                            if get_element_type(neighbor) == ELEMENTS.GRASS then
                                grid[nx][ny] = { char = "^", hl_group = "Fire" }
                                was_state_updated = true
                            elseif get_element_type(neighbor) == ELEMENTS.WATER then
                                grid[x][y] = { char = " ", hl_group = "" }
                                was_state_updated = true
                            end
                        end
                    end
                end
            elseif element_type == ELEMENTS.FIREWALL then
                if is_empty(grid, x, y - 1) then
                    grid[x][y - 1] = { char = "^", hl_group = "Fire" }
                    was_state_updated = true
                end
            end

            ::continue::
        end
    end

    return was_state_updated
end

return M
