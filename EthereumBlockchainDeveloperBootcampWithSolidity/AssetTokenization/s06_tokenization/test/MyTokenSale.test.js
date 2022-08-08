const Token = artifacts.require("MyToken");
const TokenSale = artifacts.require("MyTokenSale");

var chai = require("chai");
const expect = chai.expect;

const BN = web3.utils.BN;
const chaiBN = require('chai-bn')(BN);
chai.use(chaiBN);

var chaiAsPromised = require("chai-as-promised");
chai.use(chaiAsPromised);

contract("TokenSale", async function(accounts) {
    const [ initialHolder, recipient, anotherAccount ] = accounts;

it("there shouldnt be any coins in my account", async () => {
    let instance = await Token.deployed();
    expect(instance.balanceOf.call(initialHolder)).to.eventually.be.a.bignumber.equal(new BN(0));
    });
});
