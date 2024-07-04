{stdenvNoCC}:
stdenvNoCC.mkDerivation {
  name = "azuki";

  src = builtins.fetchGit {
    url = "https://github.com/mushchlo/azukipatch";
    ref = "master";
    rev = "352431ffd126986f5a6156832845287beed3e874";
  };

  installPhase = ''
    mkdir -p $out/share/fonts
    mkdir -p $out/share/fonts/opentype

    find -name \*.otf -exec mv {} $out/share/fonts/opentype/ \;
  '';
}
