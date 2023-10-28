import {HardhatUserConfig} from "hardhat/config";
import {HardhatNetworkAccountsUserConfig} from "hardhat/types";
import {envConfig, getHardhatAccounts} from "./config";
import "@nomiclabs/hardhat-etherscan";
import "@nomicfoundation/hardhat-chai-matchers";
import "@openzeppelin/hardhat-upgrades";
import "@nomiclabs/hardhat-ethers";
import "@typechain/hardhat";
require("tsconfig-paths/register"); // must use `require`, otherwise TS complains about missing declaration files
require("hardhat-contract-sizer");
import "./tasks";

var hardhatAccounts: HardhatNetworkAccountsUserConfig = getHardhatAccounts(envConfig.ACCOUNTS);

const config: HardhatUserConfig = {
  defaultNetwork: "hardhat",
  solidity: {
    version: "0.8.19",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
      viaIR: true,
      outputSelection: {
        "*": {
          "*": ["storageLayout"],
        },
      },
    },
  },
  networks: {
    mumbai: {
      url: envConfig.MUMBAI_RPC_URL,
      accounts: envConfig.ACCOUNTS,
    },
    polygon: {
      url: envConfig.POLYGON_RPC_URL,
      accounts: envConfig.ACCOUNTS,
    },
    hardhat: {
      accounts: hardhatAccounts,
      allowUnlimitedContractSize: true,
    },
  },
  mocha: {
    timeout: 400000,
  },
  etherscan: {
    apiKey: {
      polygon: envConfig.POLYSCAN_API_KEY,
      polygonMumbai: envConfig.POLYSCAN_API_KEY,
    },
  },
};

export default config;
