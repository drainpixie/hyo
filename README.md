# ❄️ hyo 氷

personal nixos package[s]

## 🖥️ dev

```sh
$ nix flake check
$ nix flake show
```

## 📝 usage

```nix
{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        hyo = {
            url = "sourcehut:~pixie/hyo"
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    # Add `hyo.packages.${super.system}` to your overlays
}
```
