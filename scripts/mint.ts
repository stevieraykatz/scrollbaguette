import {ethers} from "hardhat";
import {logger} from "utils";
import {
  BaguetteNFT__factory,
} from "typechain-types";

async function main(): Promise<void> {
    const address = "0xB9509140344056923888Dc78843b625ADE59589A"
    const [deployer] = await ethers.getSigners();
    const b = BaguetteNFT__factory.connect(address, deployer)
    await b.bake(1)
    await b.tokenURI(1)
}

main()
  .then(() => process.exit(0))
  .catch((error: Error) => {
    console.error(error);
    process.exit(1);
  });
