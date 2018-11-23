pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/MetaCoin.sol";
import "../contracts/MultiBalances.sol";

contract TestMultibalances {

    function testMultibalancesUsingDeployedContract() public {
        //MetaCoin meta = MetaCoin(DeployedAddresses.MetaCoin());
        //MultiBalances multi = MultiBalances(DeployedAddresses.MetaCoin());

        //uint expected = 100000;
        //address[] addresses = new address[]();
        //addresses[0] = tx.origin; 

        //Assert.equal(multi.getBalances(meta, addresses), expected * (10 ** uint256(8)), "Owners should have total 100000 MetaCoin");
    }
}