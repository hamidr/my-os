{...}:
let
  user = (import ../cfg.nix {}).user.username;
in
{
  # List services that you want to enable:
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ user ];
    };
  };
}
