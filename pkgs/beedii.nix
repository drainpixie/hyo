{
  stdenvNoCC,
  fetchzip,
}:
stdenvNoCC.mkDerivation rec {
  pname = "beedii";
  version = "1.0.0";

  src = fetchzip {
    url = "https://github.com/webkul/beedii/releases/download/v${version}/beedii.zip";
    hash = "sha256-MefkmWl7LdhQiePpixKcatoIeOTlrRaO3QA9xWAxJ4Q=";
    stripRoot = false;
  };

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    find . -name "*.ttf" -exec cp {} $out/share/fonts/truetype \;
  '';
}
