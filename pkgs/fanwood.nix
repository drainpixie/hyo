{stdenvNoCC}:
stdenvNoCC.mkDerivation {
  name = "fanwood";

  src = builtins.fetchGit {
    url = "https://github.com/theleagueof/fanwood";
    ref = "master";
    rev = "cbaaed9704e7d37d3dcdbdf0b472e9efd0e39432";
  };

  installPhase = ''
    mkdir -p $out/share/fonts/opentype
    mkdir -p $out/share/fonts/truetype

    find -name \*.otf -exec mv {} $out/share/fonts/opentype/ \;
    find -name \*.ttf -exec mv {} $out/share/fonts/truetype/ \;
  '';
}
