{
  config,
  pkgs,
  ...
}: {
  # Enable CLI
  programs._1password = {
    enable = true;
  };

  # Enable GUI with authorized user
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [config.user.name];
  };

  # Add Zen to trusted browsers
  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        zen
      '';
      mode = "0644";
    };
  };

  # Symlink for 1Password SDK IPC client library
  # The SDK hardcodes /opt/1Password/libop_sdk_ipc_client.so
  system.activationScripts.onepassword-sdk = ''
    mkdir -p /opt
    ln -sfn ${pkgs._1password-gui}/share/1password /opt/1Password
  '';
}
