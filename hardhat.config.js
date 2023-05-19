require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config({ path: ".env" });

const QUICKNODE_HTTP_URL = process.env.GoerliRpcUrl;
// const PRIVATE_KEY = process.env.GoerliKey;
const SEPOLIA_HTTP_URL = process.env.sepoliaHttpUrl;  
const ACCOUNT_KEY = process.env.accountKey;

module.exports = {
  solidity: "0.8.4",
  networks: {
    goerli: {
      url: QUICKNODE_HTTP_URL,
      accounts: [ACCOUNT_KEY],
    },
      sepolia: {
        url: SEPOLIA_HTTP_URL,
        accounts: [ACCOUNT_KEY]
      }
  },
};