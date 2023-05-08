# Bitmap Demo by Ben Weinberg

This repo is a quick follow up to the blog I wrote about bitmaps and how they can be used to save gas.

## Setup

To get our tests up and running we first need to make sure our dependencies are installed. Specifically we will install Open Zeppelin and forge dependencies. To do so run:
```
forge install OpenZeppelin/openzeppelin-contracts
forge install foundry-rs/forge-std
```

Next make sure our remappings file is as follows

```
ds-test/=lib/forge-std/lib/ds-test/src/
forge-std/=lib/forge-std/src/
@openzeppelin/=lib/openzeppelin-contracts/
```

This is to make sure that we can import our OZ contracts and forge-std files. 


## Test
Simply run to execute our tests with the gas report being loggede in the console
```
forge test --gas-report
```

The tests are purely designed to compare the gas costs between the three different contracts implemented in this repo.
They each take in 500k randomly generated eth addresses and call their contract's respective claimTokens() function.


NOTE: If you run into an out of gas error when testing simply comment out one (or both) of the other testing files and run each test file individually. 500k addreses is quite a few addresses after all! This bug however has only hapened to me once and should not be a problem. 
