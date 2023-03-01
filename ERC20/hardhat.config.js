require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-ethers");

require("dotenv").config({ path: __dirname + '/client/.env' });

const { SIGNER_PRIVATE_KEY, INFURA_API_KEY } = process.env;
const etherscanKey = process.env.ETHERSCAN_KEY;

module.exports = {
  defaultNetwork: "hardhat",
  solidity: {
    version: "0.8.8",
  },
  networks: {
    goerli: {
      url: `https://mainnet.infura.io/v3/${INFURA_API_KEY}`,
      accounts: [SIGNER_PRIVATE_KEY],
    }
  },
  etherscan: {
    apiKey: etherscanKey
  }
}