pragma solidity ^0.4.15;

import "./StandardToken.sol";
import "./Ownable.sol";
import "./TokenHolder.sol";

/**
 * @title Boom Token
 * @author Ben Johnson
 *
 * @dev ERC20 Boom Token (KUDOS)
 *
 * Boom tokens are displayed using 18 decimal places of precision.
 *
 * The base units of Boom tokens are referred to as "kutoas".
 *
 * In Swahili, kutoa means "to give".
 * In Finnish, kutoa means "to weave" or "to knit".
 *
 * 1 KUDOS is equivalent to:
 *
 *    1,000,000,000,000,000,000 == 1 * 10**18 == 1e18 == One Quintillion kutoas
 *
 *
 * All initial KUDOS kutoas are assigned to the creator of this contract.
 *
 */
contract BoomToken is StandardToken, Ownable, TokenHolder {

   string public constant name = "Boom";
   string public constant symbol = "KUDOS";
   uint8 public constant decimals = 18;
   string public constant version = "1.0";

   uint256 public constant tokenUnit = 10 ** 18;
   uint256 public constant oneBillion = 10 ** 9;
   uint256 public constant maxTokens = 10 * oneBillion * tokenUnit;

   function BoomToken() {
      totalSupply = maxTokens;
      balances[msg.sender] = maxTokens;
   }
}
