var MetaCoin = artifacts.require("./MetaCoin.sol");
var MultiBalances = artifacts.require("./MultiBalances.sol");

contract('MetaCoin', function(accounts) {
  it("should put 100000 MetaCoin in the first account", function() {
    return MetaCoin.deployed().then(function(instance) {
      return instance.balanceOf.call(accounts[0]);
    }).then(function(balance) {
      assert.equal(balance.valueOf(), 100000 * Math.pow(10, 8), "100000 wasn't in the first account");
    });
  });
  it("should send coin correctly", function() {
    var meta;

    // Get initial balances of first and second account.
    var account_one = accounts[0];
    var account_two = accounts[1];

    var account_one_starting_balance;
    var account_two_starting_balance;
    var account_one_ending_balance;
    var account_two_ending_balance;

    var amount = 10;

    return MetaCoin.deployed().then(function(instance) {
      meta = instance;
      return meta.balanceOf.call(account_one);
    }).then(function(balance) {
      account_one_starting_balance = balance.toNumber();
      return meta.balanceOf.call(account_two);
    }).then(function(balance) {
      account_two_starting_balance = balance.toNumber();
      return meta.transfer(account_two, amount, {from: account_one});
    }).then(function() {
      return meta.balanceOf.call(account_one);
    }).then(function(balance) {
      account_one_ending_balance = balance.toNumber();
      return meta.balanceOf.call(account_two);
    }).then(function(balance) {
      account_two_ending_balance = balance.toNumber();

      assert.equal(account_one_ending_balance, account_one_starting_balance - amount, "Amount wasn't correctly taken from the sender");
      assert.equal(account_two_ending_balance, account_two_starting_balance + amount, "Amount wasn't correctly sent to the receiver");
    });
  });
});

contract("MultiBalances", function(accounts) {
  it("should get the total balance 100000", function(){
    var meta;
    var multi;

    return MetaCoin.deployed().then(function(instance) {
      meta = instance;
      return MultiBalances.balanceOf.deployed().then(function(instance) {
        multi = instance;
      });
    });
  });
});