pragma solidity ^0.4.21;

import './HoneyToken.sol';
import './HoneyTokenAirdrop.sol';
import 'openzeppelin-solidity/contracts/math/SafeMath.sol';

contract HoneyTokenSale {
    HoneyToken public token;
    HoneyTokenAirdrop public airdroplist;
    uint public REWARD_TOKEN = 20;

    function HoneyTokenSale(HoneyToken _token, HoneyTokenAirdrop _airdroplist) public {
        require(_token != address(0));
        token = _token;
        airdroplist = _airdroplist;
    }

    function() external payable {        
        require(airdroplist.isRegistered(msg.sender));

        token.transfer(msg.sender, REWARD_TOKEN);
    }
}