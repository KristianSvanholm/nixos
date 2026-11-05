{
  config,
  pkgs,
  ...
}: let
  discord =pkgs.writeShellApplication {
    name = "smartd-discord";
    runtimeInputs = with pkgs; [coreutils curl jq];
    text = ''
      body=$(head -c 1800)
      jq -n --arg host "${config.networking.hostName}" --arg body "$body" \
        '{content: ("**smartd on " + $host + "**\n```\n" + $body + "\n```")}' |
        curl -fsS -H 'Content-Type: application/json' --data-binary @- \
          "$(cat /var/lib/secrets/discord-webhook)"
    '';
  };
in {
  services.smartd = {
    enable = true;
    notifications.mail = {
      enable = true;
      mailer = "${discord}/bin/smartd-discord";
    };
  };
}
