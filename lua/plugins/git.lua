return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      attach_to_untracked = true,
    },
    keys = {
      { "]h", function() require("gitsigns").nav_hunk("next") end, desc = "Next git hunk" },
      { "[h", function() require("gitsigns").nav_hunk("prev") end, desc = "Previous git hunk" },
      { "<leader>gp", function() require("gitsigns").preview_hunk() end, desc = "Preview git hunk" },
      { "<leader>gd", function() require("gitsigns").diffthis() end, desc = "Diff current file" },
      { "<leader>gD", "<cmd>windo diffoff<CR>", desc = "Close git diff mode" },
    },
  },
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewFileHistory",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
    },
    keys = {
      { "<leader>go", "<cmd>DiffviewOpen<CR>", desc = "Open git diff view" },
      { "<leader>gc", "<cmd>DiffviewClose<CR>", desc = "Close git diff view" },
      { "<leader>gr", "<cmd>DiffviewRefresh<CR>", desc = "Refresh git diff view" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "Git file history" },
    },
  },
}
