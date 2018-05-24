pragma solidity ^0.4.23;

import "./PausableToken.sol";

contract LaborCryptoToken is PausableToken {

  string public constant name = "LaborCryptoToken";
  string public constant symbol = "LBR";
  uint8 public constant decimals = 18;

  // uint256 public constant INITIAL_SUPPLY = (1 ** 5) * (10 ** uint256(decimals));
  // uint256 public constant INITIAL_SUPPLY = 200000000000000000000000000000;
  constructor(uint256 _totalSupply) public {
    totalSupply_ = _totalSupply;
    balances[msg.sender] = _totalSupply;
  }
}
