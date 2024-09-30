{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "kc";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "aslilac";
    repo = pname;
    rev = "v0.10.2";
    hash = "sha256-E9QnktyOE22FlWXRXpYcKYeW7hrqOndSJOBztevbUok=";
  };

  # Since the `target-directory` is modified, use custom installPhase
  installPhase = ''
    install -Dm755 build/release/kc $out/bin/kc
  '';

  meta = {
    description = "Kayla's (line) counter (of code) :)";
    homepage = "https://github.com/aslilac/kc";
    license = lib.licenses.mpl20;
  };

  cargoHash = "sha256-LndOHxOSxmE07XTnFUlU6c7orB1SAzVY9Z27O5p22b0=";
}
