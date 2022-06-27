inputs: let
  username = "ciaran";
  systems = {
    x86 = "x86_64-linux";
    arm64 = "aarch64-linux";
  };
  configs = [
    {
      inherit username;
      host = "ivy";
      system = systems.x86;
    }
    {
      inherit username;
      host = "onyx";
      system = systems.x86;
    }
    {
      inherit username;
      host = "slate";
      system = systems.arm64;
    }
    {
      inherit username;
      host = "sparrow";
      system = systems.x86;
    }
  ];
  entries =
    builtins.map (cfg: {
      name = "${cfg.username}@${cfg.host}";
      value = import (./. + "/${cfg.host}/${cfg.username}.nix") inputs cfg.username cfg.system;
    })
    configs;
in
  builtins.listToAttrs entries
