{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "gign";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "metafates";
    repo = pname;
    rev = "HEAD";
    hash = "sha256-YsGq1Dsy1gj9EMBxG42DkgYlfjuRyR8ohCkohQiq5QU=";
  };

  meta = {
    description = "A cute .gitignore generator";
    homepage = "https://github.com/metafates/${pname}";
    license = lib.licenses.mit;
  };

  cargoPatches = [./000.gign.patch];
  cargoHash = "sha256-biqHGbzkNWyy2aQmB7iaLmOAdrrXyP3IhrGA8Fn8AvQ=";
}
