{
  home-manager,
  secrets,
  ...
}: username: system:
home-manager.lib.homeManagerConfiguration {
  configuration = {
    nixpkgs.config.allowUnfreePredicate = pkg: true;
    home.username = username;
    home.homeDirectory = "/home/${username}";
    imports = [
      ../../modules/shells
      ../../modules/applications/cli
    ];
  };
  inherit system username;
  homeDirectory = "/home/${username}";
  stateVersion = "21.03";
  extraSpecialArgs = {
    inherit secrets;
    isLaptop = false;
  };
}
