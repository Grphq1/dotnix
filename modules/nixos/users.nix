# User management
{username, ...}: {
  # Basic user configuration
  users.users.${username} = {
    isNormalUser = true;
    description = "Alireza Momeni";
    extraGroups = [
      "audio"
      "video"
      "input"
      # "docker"
      # "libvirtd"
      "networkmanager"
      "wheel"
    ];
    packages = [];
  };

  # Additional group memberships
  users.groups = {
    # Create custom groups if needed
    media = {};
  };
}
