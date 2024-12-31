local on_attach = require("helpers.lsp").global_on_attach

local port = os.getenv("GDScript_Port") or "6005"
local cmd = vim.lsp.rpc.connect("127.0.0.1", port)
local pipe = "/tmp/godot.pipe"

vim.lsp.start({
    name = "Godot",
    cmd = cmd,
    root_dir = vim.fs.dirname(vim.fs.find({ "project.godot", ".git" }, { upward = true })[1]),
    on_attach = on_attach,
})
