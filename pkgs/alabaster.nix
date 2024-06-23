{vimUtils}:
vimUtils.buildVimPlugin {
  name = "alabaster";
  src = builtins.fetchGit {
    url = "https://github.com/p00f/alabaster.nvim";
    ref = "main";
    rev = "ff1a9e07718506e45b94b2088366c5a8ab1ee1ea";
  };
}
