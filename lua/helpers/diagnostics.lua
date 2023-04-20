---@type "lines" | "inline" | "off"
local current = "lines"

local cycle_diagnostics = function()
    if current == "lines" then
        vim.diagnostic.config({ virtual_lines = false, virtual_text = true })
        current = "inline"
    elseif current == "inline" then
        vim.diagnostic.config({ virtual_lines = false, virtual_text = false })
        current = "off"
    elseif current == "off" then
        vim.diagnostic.config({ virtual_lines = true, virtual_text = false })
        current = "lines"
    end
end

return cycle_diagnostics
