# Networking configuration
{ config, pkgs, ... }: {
  networking = {
    networkmanager = {
      enable = true;
      dns = "default";
    };
    
    # DNS servers in priority order (Cloudflare primary, Google as fallback)
    nameservers = [ 
      # Cloudflare DNS
      "1.1.1.1" 
      "1.0.0.1" 
      # Google DNS (fallback)
      "8.8.8.8" 
      "8.8.4.4" 
    ];
    
    enableIPv6 = true;
    
    firewall = {
      enable = true;
      allowedTCPPorts = [ 3000 ];
      allowedUDPPorts = [ 3000 ];
      # Reject rather than drop packets
      rejectPackets = true;
      # Ping response but with rate limiting
      allowPing = true;
      logRefusedConnections = true;
    };
  };
  
  services.timesyncd.enable = true;
  
  environment.systemPackages = with pkgs; [
    curl
    wget
    dnsutils  # Contains dig
    traceroute
    nmap
    netcat
    tcpdump
    iperf3
  ];
}
