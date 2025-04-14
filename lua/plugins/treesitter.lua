return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate", -- Pastikan Tree-sitter parser selalu terbarui
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Pastikan Tree-sitter menginstal parser untuk semua bahasa yang didukung
      ensure_installed = {
        "php",
        "javascript",
        "typescript",
        "html",
        "tsx",
        "css",
        "lua",
        "json",
        "astro",
        "scss",
        "lua",
        "markdown",
      },                                           -- Menambahkan json
      highlight = {
        enable = true,                             -- Aktifkan highlighting untuk semua bahasa
        additional_vim_regex_highlighting = false, -- Nonaktifkan highlighting Vim regex untuk meningkatkan performa
      },
      indent = {
        enable = true, -- Aktifkan indentasi otomatis menggunakan Tree-sitter
      },
    })
  end,
}
