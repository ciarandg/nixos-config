inputs: let
  username = "ciaran";
  host = "ivy";
  system = "x86_64-linux";
in {
  "${username}@${host}" = import (./. + "/${host}/${username}.nix") inputs username system;
}
