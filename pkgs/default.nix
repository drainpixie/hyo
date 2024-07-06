self: super:
with super; {
  # Vim Plugins/Themes
  alabaster = callPackage ./alabaster.nix {};

  # Fonts
  prociono = callPackage ./prociono.nix {};
  fanwood = callPackage ./fanwood.nix {};
  beedii = callPackage ./beedii.nix {};
  azuki = callPackage ./azuki.nix {};
}
