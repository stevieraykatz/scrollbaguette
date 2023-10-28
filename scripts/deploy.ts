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
  BakeSuperCrisp__factory,
  Bakery__factory,
  BaguetteNFT__factory,
} from "typechain-types";

async function main(): Promise<void> {
  const [deployer] = await ethers.getSigners();

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

  const SuperCrisp = new BakeSuperCrisp__factory(deployer);
  const superCrisp = await SuperCrisp.deploy();
  await superCrisp.deployed();

  const Bakery = new Bakery__factory(
    {
      "contracts/lib/BakeBody1.sol:BakeBody1": body1.address,
      "contracts/lib/BakeBody2.sol:BakeBody2": body2.address,
      "contracts/lib/BakeBottom.sol:BakeBottom": bottom.address,
      "contracts/lib/BakeCrisp.sol:BakeCrisp": crisp.address,
      "contracts/lib/BakeCuts.sol:BakeCuts": cuts.address,
      "contracts/lib/BakeLightBody.sol:BakeLightBody": lightBody.address,
      "contracts/lib/BakeSuperCrisp.sol:BakeSuperCrisp": superCrisp.address,
    },
    deployer
  );
  const bakery = await Bakery.deploy();
  await bakery.deployed();

  const BaguetteNFT = new BaguetteNFT__factory(
    {
      "contracts/lib/Bakery.sol:Bakery": bakery.address,
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
