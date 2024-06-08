-- https://gist.github.com/ianchesal/93ba7897f81618ca79af01bc413d0713
local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    

    -- config = function()
    --   local cmp = require "cmp"
    --
    --   cmp.setup {
    --     sources = {
    --       { name = "nvim_lsp", group_index = 2 },
    --       { name = "copilot",  group_index = 2 },
    --       { name = "luasnip",  group_index = 2 },
    --       { name = "buffer",   group_index = 2 },
    --       { name = "nvim_lua", group_index = 2 },
    --       { name = "path",     group_index = 2 },
    --     },
    --     -- mapping = {
    --     --   ["<Tab>"] = vim.schedule_wrap(function(fallback)
    --     --     if cmp.visible() and has_words_before() then
    --     --       cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
    --     --     else
    --     --       fallback()
    --     --     end
    --     --   end),
    --     -- },
    --   }
    -- end,

    opts = {
      sources = {
        { name = "nvim_lsp", group_index = 2 },
        { name = "copilot",  group_index = 2 },
        { name = "luasnip",  group_index = 2 },
        { name = "buffer",   group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path",     group_index = 2 },
      },
    },
  },
}
      -- sorting = {
      --     priority_weight = 2,
      --     comparators = {
      --       require("copilot_cmp.comparators").prioritize,
      --
      --       -- Below is the default comparitor list and order for nvim-cmp
      --       cmp.config.compare.offset,
      --       -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
      --       cmp.config.compare.exact,
      --       cmp.config.compare.score,
      --       cmp.config.compare.recently_used,
      --       cmp.config.compare.locality,
      --       cmp.config.compare.kind,
      --       cmp.config.compare.sort_text,
      --       cmp.config.compare.length,
      --       cmp.config.compare.order,
      --     },
      -- },
