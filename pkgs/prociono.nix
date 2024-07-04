{stdenvNoCC}:
stdenvNoCC.mkDerivation {
  name = "prociono";

  src = builtins.fetchGit {
    url = "https://github.com/theleagueof/prociono";
    ref = "master";
    rev = "f9d9680de6d6f0c13939f23c9dd14cd7853cf844";
  };

  installPhase = ''
    mkdir -p $out/share/fonts/opentype
    mkdir -p $out/share/fonts/truetype

    find -name \*.otf -exec mv {} $out/share/fonts/opentype/ \;
    find -name \*.ttf -exec mv {} $out/share/fonts/truetype/ \;
  '';
}
