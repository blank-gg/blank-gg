// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./User.sol";

contract UserCollection {
    // All Users Collection
    uint256[] userNameList;
    address[] userAddressList;
    mapping(uint256 => address) userNameToAddressMap;

    // Adding New Users to the Collection
    function addUser(address _address) public {
        User newUser = User(_address);
        userNameList.push(newUser.sendUsername());
        userAddressList.push(_address);
        userNameToAddressMap[newUser.sendUsername()] = _address;
    }

    function getUserByName(uint256 _username)
        public
        view
        returns (uint256, address)
    {
        return (_username, userNameToAddressMap[_username]);
    }

    function getUserByAddress(address _address)
        public
        view
        returns (uint256, address)
    {
        uint256 _username;
        for (uint256 i = 0; i < userAddressList.length; i++) {
            if (userNameToAddressMap[userNameList[i]] == _address) {
                _username = userNameList[i];
                break;
            }
        }
        return (_username, _address);
    }
}
