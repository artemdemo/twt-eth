pragma solidity ^0.4.11;

/**
 * Contract for creating single account for new user
 */
contract TweetAccount {

    // data structure of a single tweet
	struct Tweet {
		uint timestamp;
		string tweetString;
	}
	
	// "array" of all tweets of this account: maps the tweet id to the actual tweet
	mapping (uint => Tweet) tweets;

    // total number of tweets in the above tweets mapping
	uint totalTweets;
	
	// "owner" of this account: only admin is allowed to tweet
	address adminAddress;
	
	// constructor
	function TweetAccount() {
		totalTweets = 0;
		adminAddress = msg.sender;
    }

    modifier isOwner() {
        if (adminAddress != msg.sender) {
            revert();
        }
        _;
    }

    // create new tweet
	function tweet(string tweetString) isOwner returns (int errorStatus, uint tweetId) {
		if (bytes(tweetString).length > 160) {
			// tweet contains more than 160 bytes
			errorStatus = -2;
			tweetId = 0;
		} else {
			tweets[totalTweets].timestamp = block.timestamp;
			tweets[totalTweets].tweetString = tweetString;
            errorStatus = 0;
			tweetId = totalTweets;
			totalTweets++;
		}
	}

    function getTweet(uint tweetId) constant returns (string tweetString, uint timestamp) {
		// returns two values
		tweetString = tweets[tweetId].tweetString;
		timestamp = tweets[tweetId].timestamp;
	}
	
	function getLatestTweet() constant returns (string tweetString, uint timestamp) {
		// returns two values
		tweetString = tweets[totalTweets - 1].tweetString;
		timestamp = tweets[totalTweets - 1].timestamp;
	}
}