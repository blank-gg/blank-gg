// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "/Users/jainakin/StudioProjects/blank-mobile/contracts/UserCollection.sol";
import "./Post.sol";
import "./Chat.sol";

contract UserNew {
    struct Follow {
        uint256 userName;
        address userAddress;
    }

    // Basic User Data
    uint256 public immutable userName;
    address public immutable userAddress;
    address private immutable contractOwner;

    // User Following Data
    event iAmFollowing(
        uint256 _followingCount,
        uint256 _userName,
        address _address
    );
    uint256 public followingCount;
    Follow[] public followingArray;

    // User Follower Data
    event iGotFollowed(
        uint256 _followedCount,
        uint256 _userName,
        address _address
    );
    uint256 public followedCount;
    Follow[] public followedArray;

    // User Posts
    address[] public postList;

    // User Chats
    address[] public chatList;

    // Initializing the Username and Address
    constructor(uint256 _username) {
        userName = _username;
        userAddress = msg.sender;
        contractOwner = address(this);
    }

    // Post content
    function post(uint256 _content) public {
        Post posted = new Post(_content, userAddress, userName);
        postList.push(address(posted));
    }

    // Start Chat
    function chat(address _address) public {
        Chat dm = new Chat(_address);
        chatList.push(address(dm));
    }

    // Helper Function to Send Username (Optimization Feature)
    function sendUsername() external view returns (uint256) {
        return userName;
    }

    // Helper Function to Get Followed (Security Feature)
    function getFollowed(uint256 _username) external {
        followingArray.push(Follow(_username, msg.sender));
        emit iGotFollowed(followedCount, userName, msg.sender);
        followedCount += 1;
    }

    // Follow Another User
    function follow(address _address) public {
        require(
            msg.sender == userAddress,
            "Unauthorized access attempt, request denied"
        ); // Only the account owner can follow (Security Feature)
        require(
            !isAlreadyFollowed(_address),
            "Sorry, you are already following this user"
        ); // Followig status check (Optimization Feature)
        User toBeFollowed = User(_address); // The user to be followed
        toBeFollowed.getFollowed(userName);
        emit iAmFollowing(
            followingCount,
            toBeFollowed.sendUsername(),
            _address
        );
        followingCount += 1;
    }

    // Check if Alreaedy Followed
    function isAlreadyFollowed(address _address) private view returns (bool) {
        bool status = false;
        for (uint256 i = 0; i < followingArray.length; i++) {
            if (followingArray[i].userAddress == _address) {
                status = true;
                break;
            }
        }
        return status;
    }

    // Check User Following
    function getFollowing() public view returns (Follow[] memory) {
        return followingArray;
    }

    // Check User Followers
    function getFollowers() public view returns (Follow[] memory) {
        return followedArray;
    }
}
