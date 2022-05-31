inputs: system: let
  username = "ciaran";
  host = "ivy";
in {
  "${username}@${host}" = import (./. + "/${host}/${username}.nix") inputs username system;
}
