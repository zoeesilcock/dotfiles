vim.keymap.set("n", "<F5>", "<cmd>wa<CR><cmd>TermExec cmd=\"clear ; zig build\"<CR>")
vim.keymap.set("i", "<F5>", "<c-c><cmd>wa<CR><cmd>TermExec cmd=\"clear ; zig build\"<CR>")

vim.keymap.set("n", "<F6>", "<cmd>TermExec cmd=\"clear && zig build run\"<CR>")
vim.keymap.set("i", "<F6>", "<c-c><cmd>TermExec cmd=\"clear && zig build run\"<CR>")

if string.match(vim.fn.getcwd(), "handmade%-zig") then
    if (vim.loop.os_uname().sysname == "Windows_NT") then
        vim.keymap.set("n", "<F6>", "<cmd>TermExec cmd=\"clear ; zig build ; Start-Process -NoNewWindow -FilePath ./zig-out/bin/handmade-zig.exe -WorkingDirectory ./data\"<CR>")
        vim.keymap.set("i", "<F6>", "<c-c><cmd>TermExec cmd=\"clear ; zig build ; Start-Process -NoNewWindow -FilePath ./zig-out/bin/handmade-zig.exe -WorkingDirectory ./data\"<CR>")
    end
    if (vim.loop.os_uname().sysname == "Linux") then
      vim.keymap.set("n", "<F5>", "<cmd>wa<CR><cmd>TermExec cmd=\"clear ; zig build -Dtarget=x86_64-windows\"<CR>")
      vim.keymap.set("i", "<F5>", "<c-c><cmd>wa<CR><cmd>TermExec cmd=\"clear ; zig build -Dtarget=x86_64-windows\"<CR>")

      vim.keymap.set("n", "<F6>", "<cmd>TermExec cmd=\"(clear && zig build -fwine -Dtarget=x86_64-windows && cd data && ../zig-out/bin/handmade-zig.exe) \"<CR>")
      vim.keymap.set("i", "<F6>", "<c-c><cmd>TermExec cmd=\"(clear && zig build -fwine -Dtarget=x86_64-windows && cd data && ../zig-out/bin/handmade-zig.exe) \"<CR>")
    end
end
