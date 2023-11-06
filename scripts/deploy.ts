import {ethers} from "hardhat";
import {Contract} from "ethers";
import {logger} from "utils";
import {
  BakeBody1__factory,
  BakeBody2__factory,
  BakeBottom__factory,
  BakeCrisp__factory,
  BakeCuts__factory,
  BakeLightBody__factory,
  BakeFrance__factory,
  Bakery__factory,
  BaguetteNFT__factory,
  Background__factory,
  BakeText__factory,
} from "typechain-types";

async function main(): Promise<void> {
  const [deployer] = await ethers.getSigners();


  // Deploy background libs
  const Text = new BakeText__factory(deployer);
  const text = await Text.deploy();
  await text.deployed();
  
  const BG = new Background__factory({
    "contracts/bakery/BakeText.sol:BakeText": text.address,
  },
  deployer);
  const bg = await BG.deploy();
  await bg.deployed();

  // Deploy Bakery libs
  const Body1 = new BakeBody1__factory(deployer);
  const body1 = await Body1.deploy();
  await body1.deployed();

  const Body2 = new BakeBody2__factory(deployer);
  const body2 = await Body2.deploy();
  await body2.deployed();

  const Bottom = new BakeBottom__factory(deployer);
  const bottom = await Bottom.deploy();
  await bottom.deployed();

  const Crisp = new BakeCrisp__factory(deployer);
  const crisp = await Crisp.deploy();
  await crisp.deployed();

  const Cuts = new BakeCuts__factory(deployer);
  const cuts = await Cuts.deploy();
  await cuts.deployed();

  const LightBody = new BakeLightBody__factory(deployer);
  const lightBody = await LightBody.deploy();
  await lightBody.deployed();

  const France = new BakeFrance__factory(deployer);
  const france = await France.deploy();
  await france.deployed();

  const Bakery = new Bakery__factory(
    {
      "contracts/bakery/Background.sol:Background": bg.address,
      "contracts/bakery/BakeCrisp.sol:BakeCrisp": crisp.address,
      "contracts/bakery/BakeCuts.sol:BakeCuts": cuts.address,
      "contracts/bakery/BakeBody1.sol:BakeBody1": body1.address,
      "contracts/bakery/BakeBottom.sol:BakeBottom": bottom.address,
      "contracts/bakery/BakeLightBody.sol:BakeLightBody": lightBody.address,
      "contracts/bakery/BakeFrance.sol:BakeFrance": france.address,
    },
    deployer
  );
  const bakery = await Bakery.deploy();
  await bakery.deployed();

  const BaguetteNFT = new BaguetteNFT__factory(
    {
      "contracts/bakery/Bakery.sol:Bakery": bakery.address,
    },
    deployer
  );

  const baguetteNFT: Contract = await BaguetteNFT.deploy();
  await baguetteNFT.deployed();

  logger.pad(30, "Baguettes deployed to: ", baguetteNFT.address);
}

main()
  .then(() => process.exit(0))
  .catch((error: Error) => {
    console.error(error);
    process.exit(1);
  });
