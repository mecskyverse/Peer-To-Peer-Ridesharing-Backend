const { ethers } = require("hardhat");
require("dotenv").config({ path: ".env" });


async function main() {
  
  const customerContractFactory = await ethers.getContractFactory(
    "Customer"
  );

  // deploy the contract
  const deployedCustomerContract = await customerContractFactory.deploy();

  await deployedCustomerContract.deployed();
  // print the address of the deployed contract
  console.log(
    "Customer solidity address",
    deployedCustomerContract.address
  );
}

// Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });