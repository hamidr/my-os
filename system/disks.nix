{...}:
{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/2048c342-8863-40b8-ab14-68a8395945c5";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/8AF8-F90C";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  fileSystems."/backup" = {
    device = "/dev/disk/by-uuid/39fcdb96-f9a2-417d-ba8d-551ac2742d1a";
    fsType = "ext4";
  };

  swapDevices =[
    { device = "/dev/disk/by-uuid/e1738bbc-8f48-488a-be14-a40474996ebe"; }
  ];
}
