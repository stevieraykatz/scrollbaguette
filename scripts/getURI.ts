import {ethers} from "hardhat";
import * as fs from 'fs';
import {
  BaguetteNFT__factory,
  BaguetteNFT
} from "typechain-types";
import {base64ToJson, converttoSVG} from "utils";
import { setFlagsFromString } from 'v8';
import { runInNewContext } from 'vm';

setFlagsFromString('--expose_gc');
const gc = runInNewContext('gc'); // nocommit
gc();

async function main(): Promise<void> {
    const address = "0xA0f6dcB1A9BA591494a5e4E870bDC11704B04CbA"
    const [deployer] = await ethers.getSigners();
    const b = BaguetteNFT__factory.connect(address, deployer)
    for(let i=1; i<101; i++) {
        await createSVGFromToken(b, i)
    }
}

async function createSVGFromToken(b: BaguetteNFT, id: number) {
    let r = await b.tokenURI(id)
    r = r.replace("data:application/json;base64,", "")
    let json = base64ToJson(r)
    const svg = converttoSVG(json["image"])
    fs.writeFileSync(`outputs/token${id}.svg`, svg, 'utf8');
    gc()

}

main()
  .then(() => process.exit(0))
  .catch((error: Error) => {
    console.error(error);
    process.exit(1);
  });
