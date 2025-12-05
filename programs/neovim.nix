{ pkgs, ... }:
{
  environment.variables = { EDITOR = "vim"; };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    configure = {
      customRC = ''
        set nocompatible
        set backspace=indent,eol,start
        syntax on
        set number
        set expandtab
        set tabstop=2
        set shiftwidth=2
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [ ctrlp lazy-nvim ];
      };
    };
  };
}
