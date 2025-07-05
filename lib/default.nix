# Utility functions for the configuration
{ lib, ... }:

rec {
  # Create a user configuration
  mkUser = { username, fullName, email, extraGroups ? [] }: {
    ${username} = {
      isNormalUser = true;
      description = fullName;
      extraGroups = [ "networkmanager" "wheel" ] ++ extraGroups;
      packages = [ ];
    };
  };

  # Create categorized package lists
  mkPackageCategories = packages: {
    inherit (packages) 
      audio 
      browsers 
      development 
      games 
      media 
      office 
      system 
      utilities 
      wayland;
  };

  # Helper to conditionally include packages
  optionalPackages = condition: packages: 
    if condition then packages else [];
}
