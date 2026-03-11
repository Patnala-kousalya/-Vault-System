const hre = require("hardhat");

async function main() {

    const Auth = await hre.ethers.getContractFactory("AuthorizationManager");
    const auth = await Auth.deploy();
    await auth.waitForDeployment();

    console.log("AuthorizationManager:", await auth.getAddress());

    const Vault = await hre.ethers.getContractFactory("SecureVault");
    const vault = await Vault.deploy(await auth.getAddress());
    await vault.waitForDeployment();

    console.log("SecureVault:", await vault.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});