const UserContract  = artifacts.require("User");

module.export = function (deployer) {
    deployer.deploy(NotesContract);
}