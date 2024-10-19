{ pkgs, lib, inputs, ... }:
{
    imports = [ 
	inputs.nix-minecraft.nixosModules.minecraft-servers
	#./winter.nix
    ];
    nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

    services.minecraft-servers = {
	enable = true;
	eula = true;

	servers = {
	    winter-gaming = {
		enable = true;
	    
		package = pkgs.fabricServers.fabric-1_20_1;
		
		enableReload = true;

		serverProperties = {
		    gamemode = "survival";
		    difficulty = "hard";
		    pvp = true;
		    motd = "winter gaming <3";
		    spawn-protection = 0;
		    white-list = true;
		};

		whitelist = {
		    sovjetdog = "6411a25b-f2a7-4a47-b9f7-92475f325905";
		    andy9889 = "5ba851f8-0461-40f4-a5f6-5dbeb03eabba";
		    lauramerveille = "719c834b-f058-4029-9135-28c995bfdb0b";
		    puncherofcow = "6411a25b-f2a7-4a47-b9f7-92475f325905";
		};
		
		jvmOpts = "-Xms10G -Xmx12G";

		symlinks = 
		{
		    #"mods" = "${modpack}/mods";
		    mods = with pkgs; linkFarmFromDrvs "mods" (builtins.attrValues {
			FabricAPI = fetchurl { url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/P7uGFii0/fabric-api-0.92.2%2B1.20.1.jar"; sha512 = "a9b461e9e28871002072337adc69e829f5a59c05a39ffe1f6a27df7daff392ac25c8e5a6c01ff340b3eef99cecc42b21c012766a7c87446ca442f9ea1b04aca6"; };
			ConvenientDecor = fetchurl { url = "https://cdn.modrinth.com/data/gMWAhU1n/versions/JrcEJiEH/convenientdecor-0.4.3.jar"; sha512 = "42fbbfdad25d97734f57bea773d90a072758d46f804aeb8ff2ad4d4a56496640e707fd4d1f693a7e9a76c54a0add70755318081255cdcf9cc6447d7374eb22e6"; };
			CreativeCore = fetchurl { url = "https://cdn.modrinth.com/data/OsZiaDHq/versions/yyR73fAR/CreativeCore_FABRIC_v2.12.14_mc1.20.1.jar"; sha512 = "c256de4a761b01d4a11fcb8913ad246f54327ad8ea2991991465badfd8829a5e4e54a86267050e3d087ae89940f24fc2db76c3e604f5ece41548c327c898fe37"; };
			ClothConfigApi = fetchurl { url = "https://cdn.modrinth.com/data/9s6osm5g/versions/2xQdCMyG/cloth-config-11.1.136-fabric.jar"; sha512 = "2da85c071c854223cc30c8e46794391b77e53f28ecdbbde59dc83b3dbbdfc74be9e68da9ed464e7f98b4361033899ba4f681ebff1f35edc2c60e599a59796f1c"; };
			EurekaShips = fetchurl { url = "https://cdn.modrinth.com/data/EO8aSHxh/versions/sXx5EPib/eureka-1201-1.5.1-beta.3.jar"; sha512 = "614b47e312cf7a8d2aaa6f005e805a3ca35347123552d442d3b4d36ac3304bda2a85ef3823300eae0d6b66e35a10f0345ac44654bea6bd24a0e1be78196f2869"; };
			FabricLanguageKotlin = fetchurl { url = "https://cdn.modrinth.com/data/Ha28R6CL/versions/s10JMAtS/fabric-language-kotlin-1.10.8%2Bkotlin.1.9.0.jar"; sha512 = "8f20eb2f1c9ad30781e599df265476e38bc549466d7f8acd5bdd27d664d15f9da93b3d543a6f0ccc7ff19d11d808dc2c03273cb0a5d4e942074d4823981d23b3"; };
			Geckolib = fetchurl { url = "https://cdn.modrinth.com/data/8BmcQJ2H/versions/9VG3hx3F/geckolib-fabric-1.20.1-4.4.9.jar"; sha512 = "9031c075b1935b6235a5184f376463d36c4090ff50c5f1ca4edd1521777a4bb321a379c12dc0033453a60c36bae054d0e07d56f652dff2b8525ee7756979ff11"; };
			Indium = fetchurl { url = "https://cdn.modrinth.com/data/Orvt0mRa/versions/gofbpynL/indium-1.0.34%2Bmc1.20.1.jar"; sha512 = "15bb1be71ee8c0455804d38b0e735ce1cd72b6a65ce78199b227dd4806a7726fd5fcf44ea60b382b5d97546c693d289c64f7ef872701ee1ddf1ddab14f2cee74"; };
			KnightLib = fetchurl { url = "https://cdn.modrinth.com/data/hAnl9nbm/versions/YVT7MSxL/knightlib-fabric-1.20.1-1.0.2.jar"; sha512 = "15dd1c81c4619b4f286923e7e0542a3ced4d5bb8ebab4bc651db857fdcdd89990dc3f1fa86b9467987acbd6a781a1cc6ac24fc8dec23267ab7b0d8b73b7d9f8e"; };
			KnightQuest = fetchurl { url = "https://cdn.modrinth.com/data/VEOQ4Jz4/versions/UlwORISx/knightquest-1.7.0-fabric.jar"; sha512 = "983b25cd5a6508450fbe0a4c2633c223f3c122c340b114f1f20fc2d077fdb3e1faa5fb500e7323b34419181ef55094356d6871db10fb8e5dd8c8f53060650851"; };	
			Lithium = fetchurl { url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/ZSNsJrPI/lithium-fabric-mc1.20.1-0.11.2.jar"; sha512 = "d1b5c90ba8b4879814df7fbf6e67412febbb2870e8131858c211130e9b5546e86b213b768b912fc7a2efa37831ad91caf28d6d71ba972274618ffd59937e5d0d"; };
			Patchouli = fetchurl { url = "https://cdn.modrinth.com/data/nU0bVIaL/versions/Y6tuH1cn/Patchouli-1.20.1-84-FABRIC.jar"; sha512 = "b20cebaab0972443ccc7f3b10b2038d32cfa7baa953a1cc8de6333fa711f63fd51b1b5933e0f2757445385b98e132ef295bd7c17f67ebb44bc8481295329d8bf"; };
			SimpleVoiceChat = fetchurl { url = "https://cdn.modrinth.com/data/9eGKb6K1/versions/frmZMucM/voicechat-fabric-1.20.1-2.5.24.jar"; sha512 = "06e880ddc417e1e8df565bf6e978c299947f0b5ba2d62690fa062fd82ced9c7fde9d6efbe25cfb1384b8c60b91268bc83bdbda066089d4265d5f187c0d877db0"; };
			Sodium = fetchurl { url = "https://cdn.modrinth.com/data/AANobbMI/versions/ygf8cVZg/sodium-fabric-0.5.11%2Bmc1.20.1.jar"; sha512 = "628129702e830fe88d79f0b87ef0591b708fb39045ce3d985703d6a3a78c30c9beb518df8e70151e55ca6c82d9274fea904c016f60085d889a4f7ac431cccd9e"; };
			TomsStorage = fetchurl { url = "https://cdn.modrinth.com/data/XZNI4Cpy/versions/9YQrQcI9/toms_storage_fabric-1.20-1.6.8.jar"; sha512 = "5890a47b763cdd6f1ade3290b643337e9f5768b89ab83cd21b2bea6321b58dadb331276525111d369caf01ab129cefca2cce608b294a602dd92a789b1bceb94e"; };
			ValkyrienSkies = fetchurl { url = "https://cdn.modrinth.com/data/V5ujR2yw/versions/wDYLclLS/valkyrienskies-120-2.3.0-beta.5.jar"; sha512 = "acc6a13e788768d54c9fdeb4da6f5112acbe6a11cb5f9f08f6792400e350af3c55eb18347f1f99b1c6a8ae1a1085856ebc23c51c1f1c5f60fb5b693255be20ad"; };
			Wildlife = fetchurl { url = "https://cdn.modrinth.com/data/gkVIACVj/versions/QmXRyhus/wildlife-1.20.1-2.2.jar"; sha512 = "db230ea21422a72fccf7e6cf260b01fed170004f6aeab36db7d0cf4cd00ad2f86bb7b484fcb1813758a45a9ea77febcd2a6802d59682f029d53293f07efce62c"; };
		    });
		};
	    };
	};

    };
}
