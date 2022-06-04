{
  home-manager,
  secrets,
  comp58,
  ...
}: username: system:
home-manager.lib.homeManagerConfiguration {
  configuration = {
    nixpkgs.config.allowUnfreePredicate = pkg: true;
    home.username = username;
    home.homeDirectory = "/home/${username}";
    imports = [
      ../../modules/services
      ../../modules/symlinks
      ../../modules/shells
      ../../modules/applications
    ];
  };
  inherit system username;
  homeDirectory = "/home/${username}";
  stateVersion = "21.03";
  extraSpecialArgs = {
    inherit secrets comp58;
  };
}
