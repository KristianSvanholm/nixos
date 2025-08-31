{...}: {
  services.paperless = {
    enable = true;
    dataDir = "/mnt/hdd/paperless";
    address = "0.0.0.0";
    settings = {
      PAPERLESS_OCR_LANGUAGE = "eng+nor";
      PAPERLESS_CONSUMER_IGNORE_PATTERN = [
        ".DS_STORE/*"
        "desktop.ini"
      ];
      PAPERLESS_OCR_USER_ARGS = {
        optimize = 1;
        pdfa_image_compression = "lossless";
      };
      PAPERLESS_URL = "https://paperless.kristian.rs";
    };
    openMPThreadingWorkaround = true;
  };

  networking.firewall.allowedTCPPorts = [28981];
}
