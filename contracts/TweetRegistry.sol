pragma solidity ^0.4.11;

/**
 * Registry of all accounts
 */
contract TweetRegistry {
    
    // mappings to look up account names, account ids and addresses
	mapping (address => string) addressToAccountName;
	mapping (uint => address) accountIdToAccountAddress;
	mapping (string => address) accountNameToAddress;

    // might be interesting to see how many people use the system
	uint numberOfAccounts;
	
	// owner
	address registryAdmin;

    function TweetRegistry() {
		registryAdmin = msg.sender;
		numberOfAccounts = 0;
	}

    function register(string name, address accountAddress) returns (int) {
        int result;

		if (accountNameToAddress[name] != address(0)) {
			// name already taken
			result = -1;
		} else if (bytes(addressToAccountName[accountAddress]).length != 0) {
			// account address is already registered
			result = -2;
		} else if (bytes(name).length >= 64) {
			// name is too long
			result = -3;
		} else if (_registrationDisabled){
			// registry is disabled because a newer version is available
			result = -4;
		} else {
			addressToAccountName[accountAddress] = name;
			accountNameToAddress[name] = accountAddress;
			accountIdToAccountAddress[numberOfAccounts] = accountAddress;
			numberOfAccounts++;
			result = 0; // success
		}

	}

    function getNumberOfAccounts() constant returns (uint) {
        return numberOfAccounts
	}
}