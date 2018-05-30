const HDWalletProvider = require("truffle-hdwallet-provider");

const infura_apikey = "XXXXXX"; // Please Enter Your Own Infura Api key
const mnemonic = "Enter your own mnemonic from metamask or any of your wallet";

module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      // gas: 0xfffffffffff,
      gas: 6712390,
      network_id: "*" // Match any network id
    },
    ropsten: {
      provider: new HDWalletProvider(mnemonic, "https://ropsten.infura.io/"+infura_apikey),
      network_id: 3,
      gas: 4600000
    },
    mainnet: {
      provider: new HDWalletProvider(mnemonic, "https://mainnet.infura.io/"+infura_apikey),
      network_id: "*",
      gas: 4600000
    }
  }
};
