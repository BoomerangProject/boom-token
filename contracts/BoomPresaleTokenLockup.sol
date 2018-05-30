pragma solidity ^0.4.15;

import "./SafeMath.sol";
import './BoomToken.sol';

/**
 * @title BoomPresaleTokenLockup
 * @author Ben Johnson
 *
 * @dev BoomPresaleTokenLockup will allow a beneficiary to extract the tokens on 11/15/2017 at 9 AM EST
 * @dev Based on TokenTimelock by OpenZeppelin: https://github.com/OpenZeppelin/zeppelin-solidity
 */
contract BoomPresaleTokenLockup {
   using SafeMath for uint256;

   BoomToken kudosToken;

   // beneficiary of tokens after they are released
   address public beneficiary;

   // timestamp when token release is enabled
   uint256 public releaseTime;

   function BoomPresaleTokenLockup(address _tokenContractAddress, address _beneficiary) {
      require(_tokenContractAddress != address(0));
      require(_beneficiary != address(0));
      releaseTime = 1510754400;
      kudosToken = BoomToken(_tokenContractAddress);
      beneficiary = _beneficiary;
   }

   /**
   * @notice Transfers tokens held by timelock to beneficiary.
   */
   function release() {
      require(now >= releaseTime);

      uint256 balance = kudosToken.balanceOf(this);
      require(balance > 0);

      assert(kudosToken.transfer(beneficiary, balance));
   }

   function fundsAreAvailable() constant returns (bool) {
      return now >= releaseTime;
   }
}
