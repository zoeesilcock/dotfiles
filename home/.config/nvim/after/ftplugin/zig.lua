vim.keymap.set("n", "<S-F5>", "<cmd>call zig#fmt#Format()<CR>")
vim.keymap.set("n", "<F5>", "<cmd>wa<CR><cmd>TermExec cmd=\"clear ; zig build\"<CR>")

if string.match(vim.fn.getcwd(), "handmade%-zig") then
    if (vim.loop.os_uname().sysname == "Windows_NT") then
        vim.keymap.set("n", "<F6>", "<cmd>TermExec cmd=\"zig build ; Start-Process -NoNewWindow -FilePath ./zig-out/bin/handmade-zig.exe -WorkingDirectory ./data\"<CR>")
    else
        vim.keymap.set("n", "<F6>", "<cmd>TermExec cmd=\"zig build && ./zig-out/bin/handmade-zig -WorkingDirectory ./data\"<CR>")
    end
end