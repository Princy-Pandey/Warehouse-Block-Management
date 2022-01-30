const Admin = artifacts.require("Admin");
const FarmerBond = artifacts.require("FarmerBond");


module.exports = function(deployer) {
  deployer.deploy(Admin);
  deployer.deploy(FarmerBond);

};
