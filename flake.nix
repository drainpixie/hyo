{
  description = "pixie's nixos flakes";

  inputs = {
    hooks.url = "github:cachix/git-hooks.nix";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    hooks,
  }: let
    systems = [
      "x86_64-linux"
      "i686-linux"
      "aarch64-linux"
      "armv7l-linux"
      "armv6l-linux"
      "x86_64-darwin"
      "x86_64-windows"
    ];

    forAllSystems = f: nixpkgs.lib.genAttrs systems f;
  in {
    packages = forAllSystems (system: self.overlays.default null (import nixpkgs {inherit system;}));
    overlays.default = final: prev: (import ./pkgs) final prev;

    checks = forAllSystems (system: let
      lib = hooks.lib.${system};
    in {
      pre-commit-check = lib.run {
        src = ./.;
        hooks = {
          alejandra.enable = true;
          statix = {
            enable = true;
            settings.ignore = ["/.direnv"];
          };
        };
      };
    });

    devShells = forAllSystems (system: let
      check = self.checks.${system}.pre-commit-check;
    in {
      default = nixpkgs.legacyPackages.${system}.mkShell {
        inherit (check) shellHook;
        buildInputs = check.enabledPackages;
      };
    });
  };
}
