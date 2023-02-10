require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-ethers");

require("dotenv").config();

const { GOERLI_PRIVATE_KEY, ALCHEMY_API_KEY } = process.env;
const etherscanKey = process.env.ETHERSCAN_KEY;

module.exports = {
  solidity: {
    version: "0.8.8",
  },
  networks: {
    goerli: {
      url: `https://eth-goerli.alchemyapi.io/v2/${ALCHEMY_API_KEY}`,
      accounts: [GOERLI_PRIVATE_KEY],
    }
  },
  etherscan: {
    apiKey: etherscanKey
  }
}