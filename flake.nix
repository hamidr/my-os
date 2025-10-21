{
  description = "My flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    #nixpkgs.url      = github:NixOS/nixpkgs/nixos-25.05;
    home-manager.url = github:nix-community/home-manager;
    lazyvim.url      = github:pfassina/lazyvim-nix;
  };

  outputs = { self, nixpkgs, ... }@attrs: {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [ ./init.nix ];
    };

  };
}
