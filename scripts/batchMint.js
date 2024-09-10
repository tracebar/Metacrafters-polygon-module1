const { ethers } = require("hardhat");
require("dotenv").config();

async function main() {
  const privateKey = process.env.PRIVATE_KEY;

  const networkAddress =
    "https://eth-sepolia.g.alchemy.com/v2/xISVy20DszdNw5uakCDIhIsegXfROLT1";

  const provider = new ethers.providers.JsonRpcProvider(networkAddress);

  const signer = new ethers.Wallet(privateKey, provider);

  const contractAddress = "0x5d5177fD68a6D898910E3CD26bFFA34Dd2C192E0";

  const NightLakeNFT = await ethers.getContractFactory("NightLake", signer);
  const contract = await NightLakeNFT.attach(contractAddress);

  await contract.mint(5);

  console.log("Minted 5 tokens");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
