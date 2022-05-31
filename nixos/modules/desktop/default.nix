{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.ciaran.desktop;
in {
  imports = [./environment.nix];

  options.ciaran.desktop = {
    enable = mkOption {
      description = "Whether to enable desktop settings";
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    services.greenclip.enable = true;

    hardware.opengl.driSupport32Bit = true; # needed to prevent Steam glXChooseVisual error

    virtualisation.libvirtd.enable = true;
    programs.dconf.enable = true;

    environment.variables = {
      TERMINAL = "st";
      BROWSER = "chromium";
      READER = "mupdf";
    };

    fonts.fonts = with pkgs; [
      emacs-all-the-icons-fonts
      (nerdfonts.override {fonts = ["Inconsolata" "Noto" "Monoid" "JetBrainsMono"];})
    ];

    environment.systemPackages = with pkgs; [
      st
      gparted
      virt-manager
      wineWowPackages.stable
      winetricks
    ];

    nixpkgs.overlays = [
      (self: super: {
        st = with pkgs;
          super.st.overrideAttrs (oa: {
            src = builtins.fetchGit {
              url = "https://github.com/LukeSmithxyz/st.git";
              ref = "master";
              rev = "7e6e779130327e065fcf587afa80f13150d0de31";
            };
            patches = oa.patches ++ [./st.diff];

            # Fixes to make Luke's build compatible
            nativeBuildInputs = oa.nativeBuildInputs ++ [git];
            buildInputs = oa.buildInputs ++ [harfbuzz];
            buildPhase = "git init; make all";
          });
        virt-manager = with pkgs;
          super.virt-manager.overrideAttrs (oa: {
            buildInputs = oa.buildInputs ++ [gnome3.adwaita-icon-theme];
          });
      })
    ];
  };
}
