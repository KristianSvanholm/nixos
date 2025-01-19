{ username, ... }: {
    
    # Enable CLI
    programs._1password = {
	enable = true;
    };

    # Enable GUI with authorized user
    programs._1password-gui = {
	enable = true;
	polkitPolicyOwners = [ username ];
    };
}
