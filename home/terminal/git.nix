{ sys-cnf, ... }:
{
  home-manager.users.${sys-cnf.username}.programs.git = {
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
