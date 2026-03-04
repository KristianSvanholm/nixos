{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixos-wsl.nixosModules.default
    ../configuration.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = config.user.name;

  home-manager.users.${config.user.name} = import ./home.nix;

  environment.systemPackages = with pkgs; [
    binutils
    gcc
    maven
    jdk11_headless
    bun
    webpack-cli
    azure-cli
    kubelogin
    kubectl
    freetds
    unixODBC
    sqlcmd
    adoptopenjdk-icedtea-web
    jboss
    _1password-cli
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "jboss-as-7.1.1.Final"
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    openFirewall = true; # 22
    settings.PasswordAuthentication = false;
  };

  users.users.${config.user.name}.openssh.authorizedKeys.keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC2Mwaw5KJdPAgqC0Nus59Oyu0dGWCInBYko2/l1vfndbds9cid506bHEuC9vopvIy4EvgQ8hjDZstgNs+w+Bz+FJUnQbNrpE0mQcEMrhJMia8Zd6WWRCuajvlUWQfneNimH7zBho78KLxelseuvyzDyqHoinkdPKnoDhNP08s2jbRr7AkhUuGJLNqmFYTlOv+gdD0ECQKRNhfhtEJ4NvEsxfyQ6eC8mamjVeUCTGiRorTJI0R03OmRQRyC3mOfMBH6Q0uSkNMok3QnfpHAD5Mv3ms2j6ML1bnqiQzOySQ1kzpxeOvIsUASNLEP3CHPHidJRymDs2nnijazuRINmr0c2SU3Zqnr9E33Mifh02/3A/7E/a5dVAfrLxTiL+jaSisrODUvC3VHvQLQYWa0edAdBPdEb4e49alvsqPMAHDaRBfRYtm1F4voSngzh/q50cmySMHdvmJIac3nsmSP3MOE090aigTf+4pRWQzCttf1YnpGEQlp8+mgX1/ReS+Up7s= Kristian.Svanholm@EUARD3-GPF-155"];

  environment.etc."java/deployment/security/exception.sites".text = ''
    https://devportal.idit-europe.com
    https://idit-artifactory.sapiens.com
  '';

  services.tailscale.enable = true;
}
