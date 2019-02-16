let
  # TODO: pin this:
  pkgsUrl = "https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz";
  pkgs = import (builtins.fetchTarball pkgsUrl) {};
in
  pkgs.mkShell {
    name = "portier-env";
    GOPATH = "/tmp/gopath";
    buildInputs = with pkgs; [
      go
      gcc
      sqlite
      pkg-config
      openssl
      gettext

      cargo
    ];
  }

