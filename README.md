# Ethereum NFT Marketplace 

This project is a decentralized NFT Marketplace built on the Ethereum Blockchain. It allows users to create, buy, and sell non-fungible tokens (NFTs) securely and transparently using Ethereum's robust and widely adopted infrastructure.

## 🛠️ Built With

![Solidity](https://img.shields.io/badge/Solidity-363636?style=flat&logo=solidity&logoColor=white)
![Ethereum](https://img.shields.io/badge/Ethereum-3C3C3D?style=flat&logo=ethereum&logoColor=white)
![NFT](https://img.shields.io/badge/NFT-FF5733?style=flat&logo=ethereum&logoColor=white)
![Hardhat](https://img.shields.io/badge/Hardhat-ff6c37?style=flat&logo=hardhat&logoColor=white)
![Infura](https://img.shields.io/badge/Infura-FF533B?style=flat&logo=infura&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-339933?style=flat&logo=node.js&logoColor=white)

## Key Features ✨

- **Mint NFTs**: Users can mint their own NFTs, with metadata stored on decentralized storage.
- **Buy & Sell NFTs**: A user-friendly interface for trading NFTs using Ethereum's native cryptocurrency, ETH. 
- **Smart Contract Integration**: Fully functional smart contracts written in Solidity and deployed on the Ethereum network. 
- **Secure Wallet Integration**: MetaMask integration for wallet connection and transaction signing.
- **Scalability**: Built with efficient contract design to minimize gas costs..

- ### Installation

1. **Clone the repository**:

   ```bash
   https://github.com/PaiGoManh/NFT_Marketplace--spericon-.git
   
2. Install dependencies

```
npm install
```
```
npm install --save-dev hardhat
```
```
npx hardhat compile
```
Add a main network to hardhat.config.
- here im using sepolia and infura 
- add your api key for your sen kpolia from infura
- add your metamask private key and your ether sca
eg.
```
module.exports = {
  solidity: "0.8.22",
  networks: {
    sepolia: {
      url: `https://sepolia.infura.io/v3/${process.env.INFURA_URL}`,
      accounts: [process.env.PRIVATE_KEY],
    },
  },
  etherscan: {
    apiKey: {
      sepolia: process.env.ETHERSCAN_API_KEY,
    },
  },
};
```
```
npx hardhat node
```
open another terminal in vscode(ctrl+shift+`)

```
npx hardhat ignition deploy ignition/modules/NFT.js --network sepoliadeploy 
```

after that deploy the next contract
```
npx hardhat ignition deploy ignition/modules/NFTUUPS.js --network sepolia
```

## Contract Deployment 1 - Sepolia 
```
https://sepolia.etherscan.io/address/0x4afE4821ccFB11e098508f300B888bC236b99F46
```

## Contract Deployment 2 Upgradable - Sepolia 

```
https://sepolia.etherscan.io/address/0x0C5FE6E294cE3EAdA6CF78166680D8a5621F4D87
```

This project is licensed under the MIT license - see the [LICENSE](LICENSE) file for details.

