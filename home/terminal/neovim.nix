{ ... }:
{
  programs.nvf = {
    enable = true;

    theme = {
      enable = true;
      name = "gruvbox";
      sytle = "dark";
    };

    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;
      vim.lsp = {
        enable = true;
      };
    };

    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;

    languages = {
      enableLSP = true;
      enableTreesitter = true;

      nix.enable = true;
      rust.enable = true;
      go.enable = true;
      bash.enable = true;
      clojure.enable = true;
      clang.enable = true;
    };
  };
}
