# Token Marketplace

Installation of following libraries is important for running the contracts error-free.

```shell
mkdir Token
cd Token
npm init --yes
npm install --save-dev hardhat @nomicfoundation/hardhat-toolbox
npx hardhat
npm install @openzeppelin/contracts
npm install dotenv
```

The test network used for it is Goerli testnet, by adding a Quicknode url and private key in the .env file.

```shell
npx hardhat run scripts/deploy.js --network goerli
```
