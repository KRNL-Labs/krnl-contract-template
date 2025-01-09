// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {KRNL, KrnlPayload, KernelParameter, KernelResponse} from "./KRNL.sol";

// ===============================

// This version of smart contract is the simple version of FinalContract.sol
// No response from kernel is shown
// No event is emitted during the transaction

// ===============================

contract Sample is KRNL {
    constructor(address _tokenAuthorityPublicKey) KRNL(_tokenAuthorityPublicKey) {}

    string message = "hello";

    function protectedFunction(
        KrnlPayload memory krnlPayload,
        string memory input
    )
        external
        onlyAuthorized(krnlPayload, abi.encode(input))
    {
        message = input;
    }

    function readMessage() external view returns (string memory) {
        return message;
    }
}