const BigNumber = web3.BigNumber

require('chai')
  .use(require('chai-as-promised'))
  .use(require('chai-bignumber')(BigNumber))
  .should()


import latestTime from './helpers/latestTime'
import {increaseTimeTo, duration} from './helpers/increaseTime'
import expectRevert from './helpers/expectRevert';

const BoomToken = artifacts.require('BoomToken')
const BoomPresaleTokenLockup = artifacts.require('BoomPresaleTokenLockup')

contract('BoomPresaleTokenLockupTests2', function ([_, owner, beneficiary]) {

  const amount = new BigNumber(100)

  var token;

  beforeEach(async function () {
    token = await BoomToken.new({from: owner})
  })

  describe('construction', async () => {

     it('should not allow to initialize with null token contract address', async () => {
        await expectRevert(BoomPresaleTokenLockup.new(null, beneficiary));
     });

     it('should not allow to initialize with 0 token contract address', async () => {
        await expectRevert(BoomPresaleTokenLockup.new(0, beneficiary));
     });

     it('should not allow to initialize with null beneficiary address', async () => {
       await expectRevert(BoomPresaleTokenLockup.new(token.address, null));
     });

     it('should not allow to initialize with 0 beneficiary address', async () => {
       await expectRevert(BoomPresaleTokenLockup.new(token.address, 0));
     });
  });

})
