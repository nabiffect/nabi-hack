pragma solidity ^0.4.15;

contract HoneyTokenAirdrop {
    address owner;

    mapping(bytes32 => bool) airdroplist;

    function HoneyTokenAirdrop() public {
        owner = msg.sender;
    }

    function register() external {
        airdroplist[keccak256(msg.sender)] = true;
    }

    function unregister() external {
        airdroplist[keccak256(msg.sender)] = false;
    }

    function isRegistered(address adAddress) public view returns (bool registered) {
        return airdroplist[keccak256(adAddress)];
    }
}