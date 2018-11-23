pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/MetaCoin.sol";

contract TestMetacoin {

  function testInitialBalanceUsingDeployedContract() public {
    MetaCoin meta = MetaCoin(DeployedAddresses.MetaCoin());

    uint expected = 100000;

    Assert.equal(meta.balanceOf(tx.origin), expected * (10 ** uint256(meta.decimals())), "Owner should have 100000 MetaCoin initially");
  }

  function testInitialBalanceWithNewMetaCoin() public {
    MetaCoin meta = new MetaCoin();

    uint expected = 0;

    Assert.equal(meta.balanceOf(tx.origin), expected * (10 ** uint256(meta.decimals())), "Owner should have 100000 MetaCoin initially");
  }
}
