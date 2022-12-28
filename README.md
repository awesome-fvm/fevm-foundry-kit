# Foundry Starter Kit
This is a repository aimed towards building exclusively on FEVM.
This repository comes with Mock APIs which can be used to interact with FVM natively, enabling rich features on the Filecoin Blockchain.

`fevm-foundry-kit` is a repo that shows developers how to quickly build, test, and deploy smart contracts with one of the fastest frameworks out there, [foundry](https://github.com/gakonst/foundry)!


- [Foundry Starter Kit](#foundry-starter-kit)
- [Getting Started](#getting-started)
  - [Requirements](#requirements)
  - [Quickstart](#quickstart)
  - [Testing](#testing)
- [Deploying to a network](#deploying-to-a-network)
  - [Setup](#setup)
  - [Deploying](#deploying)
    - [Working with a local network](#working-with-a-local-network)
- [Contributing](#contributing)
  - [Resources](#resources)

# Getting Started

## Requirements

Please install the following:

-   [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)  
    -   You'll know you've done it right if you can run `git --version`
-   [Foundry / Foundryup](https://github.com/gakonst/foundry)
    -   This will install `forge`, `cast`, and `anvil`
    -   You can test you've installed them right by running `forge --version` and get an output like: `forge 0.2.0 (f016135 2022-07-04T00:15:02.930499Z)`
    -   To get the latest of each, just run `foundryup`

And you probably already have `make` installed... but if not [try looking here.](https://askubuntu.com/questions/161104/how-do-i-install-make)

## Quickstart

```sh
git clone https://github.com/awesome-fvm/fevm-foundry-kit  FEVM-foundry
cd FEVM-foundry
make # This installs the project's dependencies.
make test
```

## Testing

```
make test
```

or

```
forge test
```

# Deploying to a network

Deploying to a network uses the [foundry scripting system](https://book.getfoundry.sh/tutorials/solidity-scripting.html), where you write your deploy scripts in solidity!

## Setup

We'll demo using the Wallaby testnet. (Go here for [testnet wallaby tFIL](https://wallaby.network/#faucet).)

You'll need to add the following variables to a `.env` file:

-   `WALLABY_RPC_URL`: A URL to connect to the filecion blockchain. 
-   `PRIVATE_KEY`: A private key from your wallet. You can get a private key from a new [Metamask](https://metamask.io/) account

## Deploying

```
make deploy-wallaby contract=<CONTRACT_NAME>
```

For example:

```
make deploy-wallaby contract=Counter
```

This will run the forge script, the script it's running is:

```
@forge script script/${contract}.s.sol:Deploy${contract} --rpc-url ${WALLABY_RPC_URL}  --private-key ${PRIVATE_KEY} --broadcast 
```

These pull from the files in the `script` folder. 

### Working with a local network

Foundry comes with local network [anvil](https://book.getfoundry.sh/anvil/index.html) baked in, and allows us to deploy to our local network for quick testing locally. 

To start a local network run:

```
make anvil
```

This will spin up a local blockchain with a determined private key, so you can use the same private key each time. 

Then, you can deploy to it with:

```
make deploy-anvil contract=<CONTRACT_NAME>
```

# Contributing

Contributions are always welcome! Open a PR or an issue!

# Thank You!

## Resources

-   [Foundry Documentation](https://book.getfoundry.sh/)

### TODO

[ ] Add bash scripts to interact with contracts using `cast`

[ ] Make deploying contracts to `anvil` simpler
