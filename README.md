# Ethereum based twitter

Twitter ("twitter like") app based on ethereum blockchain network.

## Getting started (development)

```
$ testrpc
```

```
$ truffle compile
```

```
$ truffle migrate
```

### Interactions via console

```
$ truffle console
```

```
> TweetAccount.deployed().then(acc => acc.tweet('Hi'))
> TweetAccount.deployed().then(acc => acc.getLatestTweet())
> TweetAccount.deployed().then(acc => acc.getTweet(0))
```

## Credits

Project is inspired by [Decentralized Twitter](https://github.com/yep/eth-tweet).