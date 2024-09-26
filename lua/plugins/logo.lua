return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      --     local logo = [[
      --     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡴⠶⢤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀
      -- ⠀⠀⠀⠀⠀⣠⡴⠞⠳⠶⠦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠾⠋⠀⠀⠀⠀⠹⣧⠀⠀⠀⠀⠀⠀⠀⠀
      -- ⠀⠀⠀⠀⣰⠏⠀⠀⠀⠀⠀⠀⠉⠳⣦⡀⠀⠀⠀⠀⠀⠀⣤⡾⠿⣷⠀⠀⠀⢠⡞⠁⠀⠀⠀⠀⠀⠀⠀⢹⡆⠀⠀⠀⠀⠀⠀⠀
      -- ⠀⠀⠀⠀⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⠀⣤⠤⠼⢤⡿⠃⠀⠼⠟⠻⠿⡤⠛⠀⠀⠀⠀⣠⣼⣤⣀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀
      -- ⠀⠀⠀⢸⡇⠀⠀⣴⠖⠒⢶⡦⠀⠀⠀⠁⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠁⠀⠠⠀⠀⠻⣦⣄⣹⡄⠀⢹⡄⠀⠀⠀⠀⠀⠀
      -- ⠀⠀⠀⢸⡄⠀⠀⡏⣠⡾⢻⠇⠠⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠙⢿⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀
      -- ⠀⠀⠀⢸⡄⠀⠘⢷⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀
      -- ⠀⠀⠀⣾⠄⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠠⠜⢧⡀⠀⠀⠀⠀⠀
      -- ⠀⠀⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⣄⠀⠀⠀
      -- ⢀⡾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⡆⠀⠀⠀⢀⣀⠀⠀⠀⠀⣿⣿⣿⡆⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⢀⠙⣧⠀⠀
      -- ⣼⡍⠀⣀⡀⠀⠀⠀⠀⠀⠐⠀⠀⠀⠐⠄⠛⠿⠛⠁⠀⠀⠰⠏⠙⠷⠀⠀⠀⠈⠉⠉⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⠶⣼⡇⠀
      -- ⣿⣷⠞⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⠀⠁⠀⠀⠀⢰⣀⠘⣇⠀
      -- ⣿⠀⢀⡴⠲⠀⠀⠀⠀⠀⠒⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣷⡟⠀
      -- ⠹⣞⠋⢀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠇⣰⠇⠀⠀
      -- ⠀⠻⣄⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡼⠋⠀⠀⠀
      -- ⠀⠀⠙⠷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡴⠋⠀⠀⠀⠀⠀
      -- ⠀⠀⠀⠀⠈⠙⣷⠶⡤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠋⢹⡆⠀⠀⠀⠀⠀⠀
      -- ⠀⠀⠀⠀⠀⢀⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣇⠀⠀⠀⠀⠀⠀
      -- ⠀⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣤⡴⠖⠶⣄⠀
      -- ⠀⠀⠀⠀⠀⣿⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⢸⡆
      -- ⠀⠀⠀⣴⠞⢻⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠇⠀⠀⣠⡿⠀
      -- ⠀⠀⠀⢿⡀⠀⢿⡀⠀⠀⠀⠀⠀⢸⡆⠀⠀⠀⠀⠀⣄⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⣠⡟⣀⣴⡾⠛⢈⠀
      -- ⠀⠀⠀⠐⠛⠶⣤⣽⣶⣄⠀⠀⠀⠸⣇⡀⠀⠀⠤⠴⣿⠀⠀⠀⠀⠀⢸⡶⠶⠀⠀⢀⣿⠐⠀⣀⣀⣠⣤⠾⠛⠛⠋⡁⠀⠀⠀⠀
      -- ⠀⠀⠀⠐⠀⠀⠤⠄⠈⠉⠛⠛⠶⠶⢿⣄⠀⠄⠀⣠⣧⣤⣤⣤⡤⠶⠾⣇⠀⠀⢐⣽⠟⠛⢛⠉⠍⠁⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀
      -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⠙⡷⠖⣟⣋⣀⣀⣀⣀⠀⠀⠀⠈⠛⠛⠋⠥⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
      --     ]]

      local ganbatte = [[
          ┌───────────────┐
          │   がんばって。│
          └───────────────┘
    ]]
      local ganbattene = [[
          ┌───────────────┐
          │  がんばったね。│
          └───────────────┘
    ]]
      local logo = string.rep("\n", 10) .. ganbattene .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
      local lualine = require("lualine")
      -- Define global variables for animation state
      local position = 1 -- starting position of the animation
      local visible_chars = 40 -- Only show 7 characters at a time
      local selected_quote = nil -- to store the selected quote per section
      -- The quote to animate
      local function quote()
        local quotes = {
          "Kesedihan menyiapkanmu untuk kegembiraan. Dia menyapu bersih semuanya dari rumahmu, sehingga kegembiraan baru dapat memasuki ruang.",
          "Effort never betrays you",
          "The best way to predict the future is to invent it.",
          "Persistence pays off",
          "Continuance is power.",
          "Stumbling seven times but standing up eight.",
          "Don’t look back, don’t look back, there is no dream in the back.",
          "Believe in people, but believe in yourself a hundred times more.",
          "You can’t change the direction of the wind, but you can adjust your sails. ",
          "There’s luck in the leftovers.",
          "If you have no failure in life, you will fail in life.",
          "Your task is not to seek for love, but merely to seek and find all the barriers within yourself that you have built against it.",
          "The wound is the place where the Light enters you.",
        }
        if not selected_quote then
          selected_quote = quotes[math.random(0, #quotes)]
        end

        return selected_quote
      end

      -- Function to return the visible part of the quote for lualine, scrolling from right to left
      local function sliding_text()
        local full_text = quote()
        local text_len = #full_text

        -- If the text length is shorter than or equal to the visible characters, no need to scroll
        if text_len <= visible_chars then
          return full_text -- No scrolling, return the full text
        end

        -- Handle wrapping when the position exceeds the length of the text
        if position > text_len then
          position = 1
        end

        -- Create a sliding effect by taking a substring starting from `position`
        local visible_text = full_text:sub(position, position + visible_chars - 1)

        -- If the substring is shorter than `visible_chars`, wrap around the start of the string
        if #visible_text < visible_chars then
          visible_text = visible_text .. full_text:sub(1, visible_chars - #visible_text)
        end

        -- Move the position for the next animation frame only if the text is long enough to scroll
        if text_len > visible_chars then
          position = position + 1
        end

        return visible_text -- return the current visible part of the string
      end
      -- Set a timer to refresh the lualine every 100ms
      vim.defer_fn(function()
        vim.defer_fn(function()
          sliding_text()
        end, 100) -- Recursive call to continue the animation
      end, 100)
      -- ganbatte
      local function ganbatte()
        return "がんばって。"
      end
      -- ganbattene
      local function ganbattene()
        return "がんばったね。|" .. sliding_text() .. "|"
      end
      --- lualine
      lualine.setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = { "alpha", "NvimTree", "Outline" },
          ignore_focus = { "NvimTree", "Outline" },
          always_divide_middle = false,
          globalstatus = true,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = {
            "location",
            {
              "datetime",
              style = "| %H:%M |",
            },
            ganbattene, -- ganbatte,
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        inactive_winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        extensions = {},
      })
    end,
  },
}
