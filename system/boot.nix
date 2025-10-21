{ ... }:
let
  mdadmConf = ''
  MAILADDR root
  ARRAY /dev/md127 metadata=1.2 UUID=17413d45:e6047ad7:da901ac9:864c06a6
  '';
in
{
  boot = {
    kernelModules = [ "kvm-intel" "amdgpu" ];
    extraModulePackages = [ ];
    initrd = { 
      availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
    };

    #Raid device
    swraid = {
      enable = true;
      inherit mdadmConf;
    };

    # Bootloader.
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        devices = ["nodev"];
        useOSProber = true;
      };

      systemd-boot = {
        enable = true;
        edk2-uefi-shell.enable = false;
        
        windows."windows" = {
          title = "Windows";
          efiDeviceHandle = "FS0"; # shell: map -c ; ls $filesystem and whichever has EFI
          sortKey = "y_windows";
        };
      };
    };
  };
  
}
