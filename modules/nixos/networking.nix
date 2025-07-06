# Networking configuration
{
  config,
  pkgs,
  ...
}: {
  networking = {
    networkmanager = {
      enable = true;
    };
    nameservers = ["8.8.8.8" "8.8.4.4"];
    enableIPv6 = true;

    firewall = {
      enable = true;
      allowedTCPPorts = [3000];
      allowedUDPPorts = [3000];
      # Reject rather than drop packets
      rejectPackets = true;
      # Ping response but with rate limiting
      allowPing = true;
      logRefusedConnections = true;
    };
  };

  services.timesyncd.enable = true;

  #   services.stubby = {
  #   enable = true;
  #   settings = pkgs.stubby.passthru.settingsExample // {
  #     upstream_recursive_servers = [{
  #       address_data = "1.1.1.1";
  #       tls_auth_name = "cloudflare-dns.com";
  #     } {
  #       address_data = "1.0.0.1";
  #       tls_auth_name = "cloudflare-dns.com";
  #     }];
  #   };
  # };

  environment.systemPackages = with pkgs; [
    curl
    wget
    dnsutils # Contains dig
    traceroute
    nmap
    netcat
    tcpdump
    iperf3
  ];
}
