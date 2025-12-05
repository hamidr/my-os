{ sys-cnf, ...}:
{
  # List services that you want to enable:
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ sys-cnf.username ];
    };
  };
}
