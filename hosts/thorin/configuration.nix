{ pkgs, ... }:
{
  imports = [
    ../common.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "thorin"; # Define your hostname.

  modules = {
    users.brianaung = {
      enable = true;
      email = "brianaung16@gmail.com";
      # extraGroups = [ "docker" ];
      packages = with pkgs; [
        obs-studio
        steam
      ];
    };
    networking.iwd.enable = true;
    displayServer.wayland = {
      enable = true;
      session = "hyprland";
    };
  };

  environment.sessionVariables = {
    QT_SCALE_FACTOR_ROUNDING_POLICY = "RoundPreferFloor";
  };

  # virtualisation.docker.enable = true;
  # virtualisation.oci-containers.backend = "docker";
  # virtualisation.oci-containers.containers = {
  #   keycloak = {
  #     image = "keycloak/keycloak";
  #     cmd = [ "start-dev" ];
  #     environment = {
  #       KEYCLOAK_ADMIN = "admin";
  #       KEYCLOAK_ADMIN_PASSWORD= "admin";
  #     };
  #     ports = [ "127.0.0.1:8080:8080" ];
  #   };
  # };
}
