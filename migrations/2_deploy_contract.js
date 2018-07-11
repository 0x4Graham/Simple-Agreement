const AgreementContract = artifacts.require("AgreementContract");


module.exports = function(deployer){
    deployer.deploy(AgreementContract);
};

  