const LaborCryptoToken = artifacts.require("./LaborCryptoToken.sol");

module.exports = function(deployer,network, accounts) {

  const totalSupply = new web3.BigNumber(10 ** 29).toFixed(); // 1 billion tokens
  deployer.deploy(LaborCryptoToken, totalSupply)
    .then(() => {
      console.log('LaborCrpto Contract Address', LaborCryptoToken.address);
    });
};
