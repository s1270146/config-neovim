return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    cmd = {
      "NvimTreeOpen",
      "NvimTreeToggle",
    },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
    },
    init = function()
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.argc() ~= 1 then
            return
          end

          local arg = vim.fn.argv(0)

          if arg == "." or arg == "./" or vim.fn.isdirectory(arg) == 0 then
            return
          end

          vim.schedule(function()
            vim.cmd("NvimTreeOpen " .. vim.fn.fnameescape(arg))
          end)
        end,
      })
    end,
    config = function()
      vim.api.nvim_set_hl(0, "NvimTreeGitFileNewHL", { fg = "#89d185" })
      vim.api.nvim_set_hl(0, "NvimTreeGitFileDirtyHL", { fg = "#89d185" })
      vim.api.nvim_set_hl(0, "NvimTreeGitFileStagedHL", { fg = "#e2c08d" })

      local function on_attach(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set("n", ".", api.tree.change_root_to_node, opts("Enter directory"))
        vim.keymap.set("n", "<BS>", api.tree.change_root_to_parent, opts("Up directory"))
        vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close directory"))
      end

      require("nvim-tree").setup({
        on_attach = on_attach,
        renderer = {
          group_empty = true,
          highlight_git = "name",
          icons = {
            glyphs = {
              git = {
                untracked = "U",
                unstaged = "M",
                staged = "A",
                renamed = "R",
                deleted = "D",
                unmerged = "!",
                ignored = "-",
              },
            },
          },
        },
        filters = {
          dotfiles = true,
        },
        git = {
          enable = true,
        },
      })
    end,
  },
}
