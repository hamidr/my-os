{ ... }:
let 
  user = (import ../cfg.nix {}).user.username;
in
{
  home-manager.users.${user}.programs.git = {
    enable = true;
    settings = {
      user.name  = "hamidr";
      user.email = "hamidr.dev@gmail.com";
      aliases = {
        ci = "commit";
        co = "checkout";
        s = "status";
      };


      push = { autoSetupRemote = true; };
    };
  };
}
