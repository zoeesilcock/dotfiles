vim.keymap.set("n", "<S-F5>", "<cmd>call zig#fmt#Format()<CR>")
vim.keymap.set("i", "<S-F5>", "<c-c><cmd>call zig#fmt#Format()<CR>")
vim.keymap.set("n", "<F5>", "<cmd>wa<CR><cmd>TermExec cmd=\"clear ; zig build\"<CR>")
vim.keymap.set("i", "<F5>", "<c-c><cmd>wa<CR><cmd>TermExec cmd=\"clear ; zig build\"<CR>")

if string.match(vim.fn.getcwd(), "handmade%-zig") then
    if (vim.loop.os_uname().sysname == "Windows_NT") then
        vim.keymap.set("n", "<F6>", "<cmd>TermExec cmd=\"clear ; zig build ; Start-Process -NoNewWindow -FilePath ./zig-out/bin/handmade-zig.exe -WorkingDirectory ./data\"<CR>")
        vim.keymap.set("i", "<F6>", "<c-c><cmd>TermExec cmd=\"clear ; zig build ; Start-Process -NoNewWindow -FilePath ./zig-out/bin/handmade-zig.exe -WorkingDirectory ./data\"<CR>")
    else
        vim.keymap.set("n", "<F6>", "<cmd>TermExec cmd=\"clear && zig build && ./zig-out/bin/handmade-zig -WorkingDirectory ./data\"<CR>")
        vim.keymap.set("i", "<F6>", "<c-c><cmd>TermExec cmd=\"clear && zig build && ./zig-out/bin/handmade-zig -WorkingDirectory ./data\"<CR>")
    end
end