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
	uint numberOfTweets;
	
	// "owner" of this account: only admin is allowed to tweet
	address adminAddress;
	
	// constructor
	function TweetAccount() {
		numberOfTweets = 0;
		adminAddress = msg.sender;
    }

    modifier isOwner() {
        if (adminAddress != msg.sender) {
            revert();
        }
    }

    // create new tweet
	function tweet(string tweetString) isOwner returns (int) {
		if (bytes(tweetString).length > 160) {
			// tweet contains more than 160 bytes
			return -2;
		} else {
			tweets[numberOfTweets].timestamp = now;
			tweets[numberOfTweets].tweetString = tweetString;
			numberOfTweets++;
            return 0;
		}
	}

    function getTweet(uint tweetId) constant returns (string tweetString, uint timestamp) {
		// returns two values
		tweetString = tweets[tweetId].tweetString;
		timestamp = tweets[tweetId].timestamp;
	}
	
	function getLatestTweet() constant returns (string tweetString, uint timestamp, uint numberOfTweets) {
		// returns three values
		tweetString = tweets[numberOfTweets - 1].tweetString;
		timestamp = tweets[numberOfTweets - 1].timestamp;
		numberOfTweets = numberOfTweets;
	}
}