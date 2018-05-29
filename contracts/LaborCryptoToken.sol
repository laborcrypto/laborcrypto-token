pragma solidity 0.4.23;

import "./PausableToken.sol";

contract LaborCryptoToken is PausableToken {

  string public constant name = "LaborCryptoToken";
  string public constant symbol = "LBR";
  uint8 public constant decimals = 18;

  constructor(uint256 _totalSupply) public {
    totalSupply_ = _totalSupply;
    balances[msg.sender] = _totalSupply;
    emit Transfer(address(0), msg.sender, _totalSupply);
  }
}
