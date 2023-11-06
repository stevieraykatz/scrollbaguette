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
    scroll: {
      url: "https://rpc.scroll.io",
      chainId: 534352,
      accounts: envConfig.ACCOUNTS,
    },
    scrollSepolia: {
      url: "https://sepolia-rpc.scroll.io/",
      chainId: 534351,
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
      scroll: envConfig.SCROLLSCAN_API_KEY
    },
    customChains: [
      {
        network: "scroll",
        chainId: 534352,
        urls: {
          apiURL: "https://api.scrollscan.com/api",
          browserURL: "https://scrollscan.com/"
        }
      },
      {
        network: "scrollSepolia",
        chainId: 534351,
        urls: {
          apiURL: "https://api-sepolia.scrollscan.com/api",
          browserURL: "https://sepolia.scrollscan.com/"
        }
      },
    ]
  },
};

export default config;
