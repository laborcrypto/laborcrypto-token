pragma solidity 0.4.23;

import "./StandardToken.sol";
import "./Pausable.sol";


/**
 * @title Pausable token
 * @dev StandardToken modified with pausable transfers.
 **/
contract PausableToken is StandardToken, Pausable {

  modifier onlyPayloadSize(uint256 numWords) {
      require(msg.data.length >= numWords * 32 + 4, "Message payload is undersized");
      _;
  }

  function transfer(address _to, uint256 _value) public whenNotPaused onlyPayloadSize(2) returns (bool) {
    return super.transfer(_to, _value);
  }

  function transferFrom(address _from, address _to, uint256 _value) public whenNotPaused onlyPayloadSize(3) returns (bool) {
    return super.transferFrom(_from, _to, _value);
  }

  function approve(address _spender, uint256 _value) public whenNotPaused onlyPayloadSize(2) returns (bool) {
    return super.approve(_spender, _value);
  }

  function increaseApproval(address _spender, uint _addedValue) public whenNotPaused onlyPayloadSize(2) returns (bool success) {
    return super.increaseApproval(_spender, _addedValue);
  }

  function decreaseApproval(address _spender, uint _subtractedValue) public whenNotPaused onlyPayloadSize(2) returns (bool success) {
    return super.decreaseApproval(_spender, _subtractedValue);
  }
  
  // fallback function reverts transaction
  function() public payable {
    revert();
  }

  function batchTransfer(address[] _recipients, uint256[] _values) external onlyOwner whenNotPaused returns (uint256, bool) {
     require(_recipients.length == _values.length);
     address target;
     uint256 amount;
     bool success;
     for (uint256 i = 0; i < _recipients.length; i++) {
         target = _recipients[i];
         amount = _values[i];
         success = transfer(target,amount);
         if(success == false) return (i, false);
     }
     return (i, true);
  }
}
