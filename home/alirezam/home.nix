{
  inputs,
  username,
  ...
}: {
  imports = [
    ../../modules/home-manager/default.nix
    inputs.niri.homeModules.niri
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
  ];

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";

  dconf.enable = false;

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };

  programs.git = {
    enable = true;
    userName = "lorem10";
    userEmail = "momenei.alireza1382.15@gmail.com";
  };
}
