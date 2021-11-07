// SPDX-License-Identifier: MIT
pragma solidity >=0.4.20;

import "./Team.sol";

contract TeamFactory {
    address payable stock = payable(0xB219fe481f9b1370eACf4D0578B8bF11D975CB52);
    
    mapping(address => bool) public supported_teams;
    
    function create_team(address[20] memory team_members, uint[20] memory percentages) external {
        supported_teams[address(new Team(team_members, percentages))] = true;
    }
    
    receive() external payable {
        // used to pay developers, servers, marketing etc
        stock.transfer(msg.value);
    }
    
    fallback() external payable { 
        // used to pay developers, servers, marketing etc
        stock.transfer(msg.value);
    }
}

