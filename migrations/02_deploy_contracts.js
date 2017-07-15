const TweetRegistry = artifacts.require("./TweetRegistry.sol");
const TweetAccount = artifacts.require("./MetaCoin.sol");

module.exports = function(deployer) {
    deployer.deploy(TweetRegistry);
    deployer.deploy(TweetAccount);
};