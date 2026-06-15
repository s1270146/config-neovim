return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗██╗   ██╗██╗███╗   ███╗                  ",
        "  ████╗  ██║██║   ██║██║████╗ ████║                  ",
        "  ██╔██╗ ██║██║   ██║██║██╔████╔██║                  ",
        "  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║                  ",
        "  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║                  ",
        "  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝                  ",
        "                                                     ",
      }

      dashboard.section.buttons.val = {
        dashboard.button("f", "Open File", "<cmd>NvimTreeOpen<CR>"),
        dashboard.button("d", "Open Folder", "<cmd>NvimTreeOpen .<CR>"),
        dashboard.button("q", "Quit", ":qa<CR>"),
      }

      alpha.setup(dashboard.opts)

      if vim.fn.argc() == 1 then
        local arg = vim.fn.argv(0)

        if arg == "." or arg == "./" then
          vim.schedule(function()
            vim.cmd("Alpha")
          end)
        end
      end
    end,
  },
}
