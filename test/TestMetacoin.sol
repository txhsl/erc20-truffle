pragma solidity ^0.4.18;

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

    Assert.equal(meta.balanceOf(tx.origin), 0, "Owner should have 100000 MetaCoin initially");
  }

  function testBigAmountBalanceOfMethodCall() public {
    uint balance = 0;
    for (uint i = 0; i < 1000; i++){
      MetaCoin meta = MetaCoin(DeployedAddresses.MetaCoin());

      uint expected = 100000;
    
      balance = meta.balanceOf(tx.origin);
    }
    Assert.equal(balance, expected * (10 ** uint256(meta.decimals())), "Owner should have 100000 MetaCoin initially");
  }
}
