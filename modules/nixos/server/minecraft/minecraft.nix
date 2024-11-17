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
			AnotherFurniture = fetchurl { url = "https://cdn.modrinth.com/data/ulloLmqG/versions/YKKY0UDo/another_furniture-fabric-1.20.1-3.0.1.jar"; sha512 = "eb3f7d7eed6dae4bf90794cb3d7688a2b366304fe0027198428b154a827a17b817a1a75ba7d3a581ec5ea9436c487effac5edc938791a4211ad546ff65257437"; };
			FerriteCore = fetchurl { url = "https://cdn.modrinth.com/data/uXXizFIs/versions/unerR5MN/ferritecore-6.0.1-fabric.jar"; sha512 = "9b7dc686bfa7937815d88c7bbc6908857cd6646b05e7a96ddbdcada328a385bd4ba056532cd1d7df9d2d7f4265fd48bd49ff683f217f6d4e817177b87f6bc457"; };
			MemoryLeakFix = fetchurl { url = "https://cdn.modrinth.com/data/NRjRiSSD/versions/5xvCCRjJ/memoryleakfix-fabric-1.17%2B-1.1.5.jar"; sha512 = "a7bf7429340d076f4b30602bc714280c3f5cb8e814e76e89296c8155e3355b33304a148e9218378a3383127e95b7ba47402506c687f1d58609704fe8cc60ab93"; };
			YungsApi = fetchurl { url = "https://cdn.modrinth.com/data/Ua7DFN59/versions/lscV1N5k/YungsApi-1.20-Fabric-4.0.6.jar"; sha512 = "90fea70f21cd09bdeefe9cb6bd23677595b32156b1b8053611449504ba84a21ee1e13e5a620851299090ce989f41b97b9b4bdc98def1ccecb33115e19553c64e"; };
			TravelersBackpack = fetchurl { url = "https://cdn.modrinth.com/data/rlloIFEV/versions/ZHltcaKk/travelersbackpack-fabric-1.20.1-9.1.18.jar"; sha512 = "b7e380237142b94f9feef712f2c519896efc2f63ffb6d7f90caa279fafbe404d87e080988568a4e70850d4e0953eb866501583b56383d13d6f44969a08d9c59d"; };
			Supplementaries = fetchurl { url = "https://cdn.modrinth.com/data/fFEIiSDQ/versions/rNgF2xoZ/supplementaries-1.20-2.8.17-fabric.jar"; sha512 = "e9bfbe7f6428c720b69b756209a879d0da0ebca117136e9f3defe62970d026aa25fed109357c8759a0cadc1d262ce663901bdf12999d0229d8ab60b6982108ad"; };
			VisualWorkbench = fetchurl { url = "https://cdn.modrinth.com/data/kfqD1JRw/versions/vhuwOiNO/VisualWorkbench-v8.0.0-1.20.1-Fabric.jar"; sha512 = "4f72d41398adeff00ae6228088fe2540668711b432b36e8f7e24c0dcdbca9a233974e194feab29154cd3fcd941aa977b10b82d8dfb7205f42e3d7d209a224485"; };
			NetherPortalFix = fetchurl { url = "https://cdn.modrinth.com/data/nPZr02ET/versions/NANcEzKA/netherportalfix-fabric-1.20-13.0.1.jar"; sha512 = "14c672b56c9ec7a057711be28b53d974a502941f0a6a2a5ab6f5d8e8d7fa26481d7ab23b518eb36838bf59da78cc92f7840f983d15576194866a4afe94f9f39b"; };
			JEI = fetchurl { url = "https://cdn.modrinth.com/data/u6dRKJwZ/versions/qwxr1sek/jei-1.20.1-fabric-15.20.0.104.jar"; sha512 = "af903861843afd2e168f1dc5a2b0c215425b5234a4e649fd2f65680eb4d739d4301726f0593c3610fb95f7267607379bafbd68ca01b8a55578c69429652f1e31"; };
			YungsBetterDungeons = fetchurl { url = "https://cdn.modrinth.com/data/o1C1Dkj5/versions/nidyvq2m/YungsBetterDungeons-1.20-Fabric-4.0.4.jar"; sha512 = "02ee00641aea2e80806923c1d97a366b82eb6d6e1d749fc8fb4eeddeddea718c08f5a87ba5189427f747801b899abe5a6138a260c7e7f949e5e69b4065ac5464"; };
			YungsBetterNetherFortresses = fetchurl { url = "https://cdn.modrinth.com/data/Z2mXHnxP/versions/FL88RLRu/YungsBetterNetherFortresses-1.20-Fabric-2.0.6.jar"; sha512 = "a752f0dea20fa86e6d3a4f87d180af706b2ad5e3d434185aaa624692fc55329a2e2e410e67f843ec982e7b90ae63565b4aed43adbee6c50ded403ef50d91d7fd"; };
			YungsBetterMineshafts = fetchurl { url = "https://cdn.modrinth.com/data/HjmxVlSr/versions/qLnQnqXS/YungsBetterMineshafts-1.20-Fabric-4.0.4.jar"; sha512 = "82d6e361ef403471beaaf2fa86964af541df167da56f53b820e5abfac693f63dd5d6c0aafbc9e9baa947b42a57c79f069ed6ede55e680a2523d2ca7f2e538b13"; };
			YungsBetterOceanMonuments = fetchurl { url = "https://cdn.modrinth.com/data/3dT9sgt4/versions/4c00pjbt/YungsBetterOceanMonuments-1.20-Fabric-3.0.4.jar"; sha512 = "b050f94b70628f9cb64afe1d184b3fd5eee4a7d556ff81b05dd90e954484c415b24b235a8471085cbba2e28a1123e49de9a16e6e7bc52da585db81762562f186"; };
			YungsBetterStrongholds = fetchurl { url = "https://cdn.modrinth.com/data/kidLKymU/versions/yV6hn0bB/YungsBetterStrongholds-1.20-Fabric-4.0.3.jar"; sha512 = "e70c8daa91e88d8af97e99201264c9646c82a8cf1966b87ca1e53b591e7f1ed3cee2f8875dbe88f9b58e2a7d151fded34896bb4bd23f33f2bfef4c590fbba850"; };
			YungsBetterWitchHuts = fetchurl { url = "https://cdn.modrinth.com/data/t5FRdP87/versions/lYpHN3iF/YungsBetterWitchHuts-1.20-Fabric-3.0.3.jar"; sha512 = "4182c4b580ac0446968d28561088807a5fc96c4ad792401bf918b2e693f7eb343237f2887d63121469af8a120c4ccc8c84d7add731ea1a45cb429f49092bd6ac"; }; 
			YungsBetterJungleTemples = fetchurl { url = "https://cdn.modrinth.com/data/z9Ve58Ih/versions/6LPrzuB0/YungsBetterJungleTemples-1.20-Fabric-2.0.5.jar"; sha512 = "ea08ade714376f48cabdddd2e4b7376fc5cc5947e3911583ba4e182ab22c1335c884043441725cde21fb6e84402d17c43f509ade339d46a1a1db40f0e77ee81a"; };
			YungsBetterEndIsland = fetchurl { url = "https://cdn.modrinth.com/data/2BwBOmBQ/versions/qJTsmyiE/YungsBetterEndIsland-1.20-Fabric-2.0.6.jar"; sha512 = "cb63d9cdd69f955ed8044aec6f03aedbf76fdb53fd97826b254b68e3559941df301b714260505d165c58c276aa7ea7c11c2fada7509cb731f10b1815d5633b87"; }; 
			YungsBetterDesertTemples = fetchurl { url = "https://cdn.modrinth.com/data/XNlO7sBv/versions/1Z9HNWpj/YungsBetterDesertTemples-1.20-Fabric-3.0.3.jar"; sha512 = "29839615e042435b0fdacab2b97524a6689190692a289c25e305dbaec34764f38e70c65cfd77b49ac0dcc549281b61cfe244edc62809082e39db54990ef84cbf"; };
			YungsBridges = fetchurl { url = "https://cdn.modrinth.com/data/Ht4BfYp6/versions/hvfjXu8d/YungsBridges-1.20-Fabric-4.0.3.jar"; sha512 = "3cdd923781fe6446466670bce8132bbc0a1ee27ae9a76bb25bf0010c0e79c821ce1dc606405e3ffa00f22d92629aa1cd7cc680a17c98dfcf338166372b85dab1"; };
			YungsExtras = fetchurl { url = "https://cdn.modrinth.com/data/ZYgyPyfq/versions/pfVTUz1L/YungsExtras-1.20-Fabric-4.0.3.jar"; sha512 = "9fb06e136b12548ca9cb82d5d1035d760b74c7acded4b0d01ea29fb1e47c4666e1f289e6ce3e0c77510bc4bd10a64946e17633f99f60b5424a535d8d88025412"; };
			FromTheFog = fetchurl { url = "https://cdn.modrinth.com/data/p1WH6sHr/versions/JTd3TFcc/From-The-Fog-1.20-v1.9.2-Forge-Fabric.jar"; sha512 = "918386274b05335b4fcb0f8f42e8a2b5bdff699853fe39cc41709adff1aedbec151e1ab90ec2158db8e4aba89e4130bc9f6a4f0fe956fe155c8c970c1f8e341d"; };
			Balm = fetchurl { url = "https://cdn.modrinth.com/data/MBAkmtvl/versions/5sowswPx/balm-fabric-1.20.1-7.3.9.jar"; sha512 = "7b19c6b603027f715bb7630bc1da7015a92e6323730f425334e4a449a64d2e5bf292732e96f2153a77cd3581e9b24847ab5205bc6daf26da8d57c1f8b29aaed8"; };
			MoonlightLib = fetchurl { url = "https://cdn.modrinth.com/data/twkfQtEc/versions/6YJrhqDR/moonlight-1.20-2.13.13-fabric.jar"; sha512 = "435e5aa2fdaf5c32b425ff15cc150faaea828e9f88ae609e1fe33159edc0e93e268676b15f926402ba5bfd6fa5971bd9994420fca9d9d86a0026a5d1dd9a18c9"; };
			CardinalComponents = fetchurl { url = "https://cdn.modrinth.com/data/K01OU20C/versions/qW85eawp/cardinal-components-api-5.2.2.jar"; sha512 = "edb9319211501170deaa29c7752e34910bd578d20ec3724547e6eab84c2bf2a974e3443d759aa24a7db718b1bda673071e8c2c71dbda0ce2f9584f97f09838bc"; };
			PuzzlesLib = fetchurl { url = "https://cdn.modrinth.com/data/QAGBst4M/versions/wfZ1WUlB/PuzzlesLib-v8.0.15-1.20.1-Fabric.jar"; sha512 = "cad899693205f24f03aff92357aedc1560c1dd83f7ae421ab1b2a5bd53193f5b8f7b895547197e2187c930773811ae15d86cd2753f51fed53fa9cbc9a9a92c23"; };
			TerraBlender = fetchurl { url = "https://cdn.modrinth.com/data/kkmrDlKT/versions/FZV63yhg/TerraBlender-fabric-1.20.1-3.0.1.7.jar"; sha512 = "9ce4ae5f64661b2ab52e2a62636bc0fcd023bb304e84b8e1dbef9461a1c6ea1fee187d8afc54618743c9e6155fb64e926a326e3fcf33a566f31c82214810e69e"; };
			Amendments = fetchurl { url = "https://cdn.modrinth.com/data/6iTJugQR/versions/jJplEQRv/amendments-1.20-1.2.12-fabric.jar"; sha512 = "cd1e4dbd5148b454566a4dc48f1d6f29280c5b8147c3768cabf24e909c2676c8a9826bcd330fc3cb61d08d0b7da6492a379c1026ffd6b88f64b794ced717324c"; };
			ForgeConfigApiPort = fetchurl { url = "https://cdn.modrinth.com/data/ohNO6lps/versions/CtENDTlF/ForgeConfigAPIPort-v8.0.0-1.20.1-Fabric.jar"; sha512 = "257cd85263ab5119ce78cf16f2e7fdaf8b350e526c758d00f0af8393b9fabd581a2a974096fc7c7af45d793660e2e7b84391e11d10522036759ec66220a4b616"; };
			CreateFabric = fetchurl { url = "https://cdn.modrinth.com/data/Xbc0uyRg/versions/A8R3Be5A/create-fabric-0.5.1-f-build.1335%2Bmc1.20.1.jar"; sha512 = "64530e5f139952599c374fb0ca3c6befd0bfb202e69c8292a69d2991099ff109cf2d239ff1538030f47baa5905c4774569e32d62f9cbee0858857e1118ce6874"; };
			DungeonsNTaverns = fetchurl { url = "https://cdn.modrinth.com/data/tpehi7ww/versions/d1sY0JqV/dungeons-and-taverns-3.0.3.f.jar"; sha512 = "73d56095b131f37c01ffde9ff5b495534e2ae0896eeec737e325dbea43644bb440fff5e48088cbf8809b226f1157125658bb68172cd7d4ab0aaf2afa72848146"; };
			Waystones = fetchurl { url = "https://cdn.modrinth.com/data/LOpKHB2A/versions/gazaC8Cz/waystones-fabric-1.20-14.1.5.jar"; sha512 = "006b4cf3cb234d0c1007fe3e6d29918672e777f915a1a969e4bc67631c762a27e74014652380995f6246989a85f167cd414ec5876cc83d9822c14c1f63e42b4a"; };
			FabricSeasons = fetchurl { url = "https://cdn.modrinth.com/data/KJe6y9Eu/versions/sdV8aBn8/fabric-seasons-2.4.2-BETA%2B1.20.jar"; sha512 = "7de3208e455046e6c0ea6f41bcd17242498b1db942ee58ff93ff44b1368e65146a5d49bbe9d50874e47c19f8a75129dd3df56e10f218eeb13ae9847e32c99a8e"; };
			FabricSeasonsExtra = fetchurl { url = "https://cdn.modrinth.com/data/64FYdx5z/versions/RJ4U7Kz1/fabric-seasons-extras-1.3.2-BETA%2B1.20.jar"; sha512 = "1301e77dd4c35306f4527dc1db9940045b733c0429b9be614e685c61d9fb4c005c3ee49fdbc198b79a05d9fb4af7099dd0de6d950f8097bfb1c1594d0438f5a0"; };
			DeeperAndDarker = fetchurl { url = "https://cdn.modrinth.com/data/fnAffV0n/versions/JcDkzJzw/deeperdarker-fabric-1.20-1.3.2.1.jar"; sha512 = "42a061178d2028e20658807d4b5cc664f4ba624a3027cba45c6aa62549213b09a714203f34bd1594539f4ed4a47d6ed9af7a3508f4d7cd6f796607ee0f566541"; };
			VillagerNames = fetchurl { url = "https://cdn.modrinth.com/data/gqRXDo8B/versions/rzXhJ2pH/villagernames-1.20.1-8.1.jar"; sha512 = "f47f03044093fe9ba4d4c376c29542d6f2e11e32d99055635fad690741580c4e812a2e71616614f1260825628ecf97fb89c5bfd337853a4e442be156e1c203bc"; };
			CreeperOverhaul = fetchurl { url = "https://cdn.modrinth.com/data/MI1LWe93/versions/Mw0Hq1SZ/creeperoverhaul-3.0.2-fabric.jar"; sha512 = "b1bfccc651b4caa95de045aa41d871b2f9da05e9a7a76211a3c9d462673fbf6e359b23a14c99ba27285a31498a77d7620584a7d50cd21bf3e3d4940f06b5e118"; };
			EndermenOverhaul = fetchurl { url = "https://cdn.modrinth.com/data/Lq6ojcWv/versions/4oiJql9P/endermanoverhaul-fabric-1.20.1-1.0.4.jar"; sha512 = "89b0941d84406a838e6bc9a1c567519d3bad027aa4db7ff80429a4505bd431cd7c37b12d851f1200bceb8357438d5a1a106f5e76a747f30dd288657bd768628b"; };
			EasyMagic = fetchurl { url = "https://cdn.modrinth.com/data/9hx3AbJM/versions/9Jw4urvo/EasyMagic-v8.0.1-1.20.1-Fabric.jar"; sha512 = "359783536d189f2ea9b79828890483858eae1c286aafd50a3b674888d99372d11c945c4648e35eb65e16af0e6f605485585dfaa48ab040f73aa916c47ac6689d"; };
			ResourcefulConfig = fetchurl { url = "https://cdn.modrinth.com/data/M1953qlQ/versions/PlEObkl9/resourcefulconfig-fabric-1.20.1-2.1.2.jar"; sha512 = "53a6ca7dd4c83963d56b7dc5fbeb9b71090461049931a45b912fda5e09b8aa716d9504f2e97c023995062482df27946d81bbf771252baaca0d6f46333c3947bf"; };
			Collective = fetchurl { url = "https://cdn.modrinth.com/data/e0M1UDsY/versions/jo7YkyNS/collective-1.20.1-7.84.jar"; sha512 = "022a6d1a5fd66bb422651052e1f8c26efa0a371c120be1360ea27290220ebe261ac94cb958b600940d15427bf562ecc962d11553a2465f5f5e929314a3d01306"; };
			OwoLib = fetchurl { url = "https://cdn.modrinth.com/data/ccKDOlHs/versions/zyOBB7J4/owo-lib-0.11.2%2B1.20.jar"; sha512 = "807e4a3daf493e92c5ff0d5657efbba2a4e0cd2a9b753f2d6f153422629415f189345842a6dd258c87d4c02ebf38950a517bcd8a7ed929af6ed6485ae46cf77e"; };
			MoreMobVariants = fetchurl { url = "https://cdn.modrinth.com/data/JiEhJ3WG/versions/o6yyhzgj/moremobvariants-fabric%2B1.20.1-1.3.1.jar"; sha512 = "af6b709620be9aee7aa2fca8b85b923a4ad283928dbc5f0287d702e08a6aaa84935844fe5c4f3661c340f411d2ede0889bdb5cf2b095cbb3c3251469c5b77c8c"; };
			ElytraSlot = fetchurl { url = "https://cdn.modrinth.com/data/mSQF1NpT/versions/7w60aZYA/elytraslot-fabric-6.4.4%2B1.20.1.jar"; sha512 = "4ffb63737c7cf209443d9026b60467136b437ea207986f32e2caef1305fa4b3aaa907844a3e647f4d3c54b683b22e0cf26ddd3c83a6da01b5a3e8a2cf8afcec5"; };
			Trinkes = fetchurl { url = "https://cdn.modrinth.com/data/5aaWibi9/versions/AHxQGtuC/trinkets-3.7.2.jar"; sha512 = "bedf97c87c5e556416410267108ad358b32806448be24ef8ae1a79ac63b78b48b9c851c00c845b8aedfc7805601385420716b9e65326fdab21340e8ba3cc4274"; };
			BetterEnd = fetchurl { url = "https://cdn.modrinth.com/data/gc8OEnCC/versions/7QwyTILr/better-end-4.0.11.jar"; sha512 = "5faae5cb3d8759837ec341c605dd9c8b6b32a908e7e1f1248b3b2567c5f9969079df33694cdfb6c743a732bfc9d5824843a93edec07f09e68f8b408e355d15e7"; };
			BetterNether = fetchurl { url = "https://cdn.modrinth.com/data/MpzVLzy5/versions/IG7kgtJH/better-nether-9.0.10.jar"; sha512 = "0ef96b8409904c0ce1b9a875260f252615d7b46704082cfd10ffee88d2d506984ad0c31a91e5cb3392f454bc646b7676c392ac94d78474f156aa519f9501f3d0"; };
			BCLib = fetchurl { url = "https://cdn.modrinth.com/data/BgNRHReB/versions/TPC86Pyz/bclib-3.0.14.jar"; sha512 = "bc35cc37a221fbc6f7fca293e72aad0877d8c9d07067ff0b4c8f51dcddbb82ac7cbbb86d1550eef7690bcd1ecf09625f0389f39ae9a252eec5d8511ba7deec4a"; };
			WTHIT = fetchurl { url = "https://cdn.modrinth.com/data/6AQIaxuO/versions/BSZMYd4G/wthit-fabric-8.15.2.jar"; sha512 = "9636327d041d6fee42f93160db08a753f7a1d323aaa8b36556644e4896284ded5b7da52d809a0752024c17eedd76ee11afe9d3b6a0be32956a5d90dd0e38c520"; };
			BadPackets = fetchurl { url = "https://cdn.modrinth.com/data/ftdbN0KK/versions/JjLWLyDz/badpackets-fabric-0.4.3.jar"; sha512 = "2375bf680a6bc716808735e4258408212609480c1088c6249c8a6dbb450429e81de02891a4b412fcafe588d3b521e68f33918b8f99bb425e7dc79f212c924b9c"; };
			CCTweaked = fetchurl { url = "https://cdn.modrinth.com/data/gu7yAYhd/versions/Zoo9N9Dv/cc-tweaked-1.20.1-fabric-1.113.1.jar"; sha512 = "a5024ac6da3004396c8aaa275ee6096802ac0fc8fb2fbf8aa6b6287e45820b8f6c1bd1f922340b8750010b1051739547c1abf1b003f437a223624fe4f1a88891"; };
			Camerapture = fetchurl { url = "https://cdn.modrinth.com/data/9dzLWnmZ/versions/H54gG8cJ/Camerapture-1.6.4%2Bmc1.20.1.jar"; sha512 = "e6e2cb033b428d8506bf4d51b41c1892100fe7a550b41484aca5efec20b8a3b9c1173a603ca833bdca68b45410b9e35cce9cc44383b2cd9efdb5db9bb3e666a8"; };
			AutocrafterEarly = fetchurl { url = "https://cdn.modrinth.com/data/pAONjoSH/versions/213IPd8u/crafter-1.0.2-1.20.1.jar"; sha512 = "57af47847f15746521084759e02a3888da137511652793507fc7b70d41e05ac72d6cc7cbdf6f88d934649e37cee31f139c76219d6786fc2df449fce842ebf917"; };
			Ribbits = fetchurl { url = "https://cdn.modrinth.com/data/8YcE8y4T/versions/RLSQKSBU/Ribbits-1.20.1-Fabric-3.0.0.jar"; sha512 = "850cc9a05bfde077b9f94a3050d5f61b7b19da9613310459eeba564f542ebe67f739a790630e333fc3e3093b1079c3a7dbce6876a054853f12ad3065f450236e"; };
		    });
		};
	    };
	};

    };
}
