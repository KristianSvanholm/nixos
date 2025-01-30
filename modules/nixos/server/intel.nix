{ pkgs, ... }:
{

    nixpkgs.config.packageOverrides = pkgs: {
	vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
    };

    environment.systemPackages = with pkgs; [ intel-gpu-tools ];
    hardware.graphics = {
	enable = true;
	extraPackages = with pkgs; [
	    intel-media-driver
	    intel-vaapi-driver
	    vaapiVdpau
	    intel-compute-runtime # OpenCL filter support (hardware tonemapping and subtitle burn-in)
	    vpl-gpu-rt # QSV on 11th gen or newer
	    intel-media-sdk # QSV up to 11th gen
	];
    };

}
