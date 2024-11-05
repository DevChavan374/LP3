// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank{
    mapping(address => uint256) public balances;
    address payable owner;

    constructor() public{
        owner = payable(msg.sender);
    }

    function deposit() public payable{
        require(msg.value > 0, "Deposit amt mst be greater than 0.");
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(msg.sender == owner, "Only owner can withdraw funds.");
        require(amount <= balances[msg.sender], "Insufficient funds.");
        require(amount > 0, "Withdrawal amt mst be greater than 0.");
        payable(msg.sender).transfer(amount);
        balances[msg.sender] -= amount;
    }

    function showBalance(address payable user) public view returns (uint256) {
        return balances[user];
    }
}