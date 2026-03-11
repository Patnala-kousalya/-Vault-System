// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AuthorizationManager {

    mapping(bytes32 => bool) public usedAuthorizations;

    event AuthorizationUsed(bytes32 authId);

    function verifyAuthorization(
        address vault,
        address recipient,
        uint256 amount,
        bytes32 authId
    ) external returns (bool) {

        require(!usedAuthorizations[authId], "Authorization already used");

        usedAuthorizations[authId] = true;

        emit AuthorizationUsed(authId);

        return true;
    }
}