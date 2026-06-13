local keymap = vim.keymap.set

local opts = { silent = true }

-- Escでnoh
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- :なしで保存・終了
keymap("n", "<leader>w", "<cmd>write<CR>", { desc = "Write file", silent = true })
keymap("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit window", silent = true })

-- Cntrl + hjkl 移動
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window", silent = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to lower window", silent = true })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to upper window", silent = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window", silent = true })

-- split & delete window
keymap("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split window vertically", silent = true })
keymap("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split window horizontally", silent = true })
keymap("n", "<leader>wd", "<C-w>c", { desc = "Delete window", silent = true })

-- バッファ操作
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer", silent = true })
keymap("n", "H", "<cmd>bprevious<CR>", { desc = "Previous buffer", silent = true })
keymap("n", "L", "<cmd>bnext<CR>", { desc = "Next buffer", silent = true })

-- インデント
keymap("v", "<", "<gv", { desc = "Indent left and reselect", silent = true })
keymap("v", ">", ">gv", { desc = "Indent right and reselect", silent = true })

-- 設定読み込み
keymap("n", "<leader>x", "<cmd>source %<CR>", { desc = "Source current file", silent = true })
