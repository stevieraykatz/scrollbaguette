// Env handling:
import {config as dotenvConfig} from "dotenv";
import {HardhatNetworkAccountsUserConfig, HardhatNetworkAccountUserConfig} from "hardhat/types";
import {resolve} from "path";
import {EnvConfig} from "./types";

dotenvConfig({path: resolve(__dirname, "../.env")});

const DEPLOYER_KEY = extractString("DEPLOYER_KEY");
const SCROLLSCAN_API_KEY = extractString("SCROLLSCAN_API_KEY");

function extractString(name: string): string {
  const envVar = process.env[name];
  if (!envVar) {
    throw new Error(`Please add the ${name} key to your .env file`);
  }
  return envVar;
}

export function getHardhatAccounts(accountList: string[]): HardhatNetworkAccountsUserConfig {
  const hardhatAccounts: HardhatNetworkAccountUserConfig[] = accountList.map((element) => ({
    privateKey: element,
    balance: "1000000000000000000000",
  }));
  return hardhatAccounts;
}

export const envConfig: EnvConfig = {
  SCROLLSCAN_API_KEY,
  ACCOUNTS: [DEPLOYER_KEY],
};
