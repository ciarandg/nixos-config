{
  config,
  pkgs,
  ...
}: let
  colour-valgrind = with pkgs.python3Packages;
    buildPythonPackage rec {
      pname = "colour-valgrind";
      version = "0.3.9";
      src = fetchPypi {
        inherit pname version;
        sha256 = "34a7d92e3c82a63d80644a571d3df8e4d29dd7b14b263dee90307d5d6432619d";
      };
      propagatedBuildInputs = [regex six colorama];
    };
in {
  home.packages = [pkgs.valgrind colour-valgrind];
}
