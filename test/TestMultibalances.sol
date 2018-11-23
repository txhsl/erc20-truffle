pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/MetaCoin.sol";
import "../contracts/MultiBalances.sol";

contract TestMultibalances {
    function testMultiBalances() public {
        MetaCoin meta = MetaCoin(DeployedAddresses.MetaCoin());
        MultiBalances multi = new MultiBalances();

        uint expected = 100000;
        address[] addresses = new address[]();
        addresses[0] = tx.origin; 

        Assert.equal(multi.getBalances(meta, addresses), expected * (10 ** uint256(meta.decimals())), "Owner should have 100000 MetaCoin initially");
    }
}