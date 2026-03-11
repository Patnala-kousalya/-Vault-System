// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IAuthorizationManager {
    function verifyAuthorization(
        address vault,
        address recipient,
        uint256 amount,
        bytes32 authId
    ) external returns (bool);
}

contract SecureVault {

    IAuthorizationManager public authManager;

    event Deposit(address indexed sender, uint amount);
    event Withdrawal(address indexed recipient, uint amount);

    constructor(address _authManager) {
        authManager = IAuthorizationManager(_authManager);
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(
        address payable recipient,
        uint256 amount,
        bytes32 authId
    ) external {

        require(address(this).balance >= amount, "Insufficient vault balance");

        bool valid = authManager.verifyAuthorization(
            address(this),
            recipient,
            amount,
            authId
        );

        require(valid, "Authorization failed");

        recipient.transfer(amount);

        emit Withdrawal(recipient, amount);
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}
