{
  description = "My OS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    sys-cnf = import ./sys-cnf.nix {};
    args = inputs // { inherit sys-cnf; };
  in 
  {
    nixosConfigurations.${sys-cnf.system.hostname} = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = args;
      modules = [ ./init.nix ];
    };
  };
}
