{
  description = "My OS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, home-manager, nvf, ... }@inputs:
  let
    sys-cnf = import ./sys-cnf.nix {};
    updated-inputs = inputs // { inherit sys-cnf; };
  in 
  {
    nixosConfigurations.${sys-cnf.system.hostname} = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = updated-inputs;
      modules = [ ./init.nix ];
    };


   # nvf.homeManagerModules.default
  };
}
