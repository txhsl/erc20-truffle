pragma solidity ^0.4.18;

import "./ConvertLib.sol";
import "./MetaCoin.sol";

contract MultiBalances { 
    function getBalances(address contractAddress, address[] addresses) public view returns (uint256[]){
        MetaCoin erc20 = MetaCoin(contractAddress);
        uint addrLength = addresses.length;
        uint256[]  memory balances = new uint256[](addrLength);
        for(uint i = 0; i<addrLength; i++){
            balances[i] = erc20.balanceOf(addresses[i]);
        }
        return balances;
    } 
}