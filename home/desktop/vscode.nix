{ pkgs, sys-cnf, ... }:
{
#  home.sessionVariables.NIXOS_OZONE_WL = "1";

  home-manager.users.${sys-cnf.username}.programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      vscodevim.vim
      yzhang.markdown-all-in-one
      rust-lang.rust-analyzer
      golang.go
      ziglang.vscode-zig
      llvm-vs-code-extensions.vscode-clangd
    ];
  };
}
