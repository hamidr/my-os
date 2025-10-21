{ pkgs, lazyvim, ... }:
let 
  user = (import ../cfg.nix {}).user.username;
in
{
  home-manager.users.${user}.programs.neovim = {
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
        start = [ ctrlp ];
      };
    };
  };

  imports = [ lazyvim.homeManagerModules.default ];

  home-manager.users.${user}.programs.lazyvim = {
    enable = true;
  };

}
