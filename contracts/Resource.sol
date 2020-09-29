pragma solidity ^0.7.0;

import "./IERC20.sol";
import "./SafeMath.sol";

contract Resource is IERC20 {
    using SafeMath for uint256;

    function totalSupply() public view returns (uint);
    function balanceOf(address tokenOwner) public view returns (uint balance);
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract Metalicium is Resource {
    function name() public view returns (string) {
        return "Metalicium";
    }

    function symbol() public view returns (string) {
        return "Mtm";
    }
}

contract Aellementese is Resource {
    function name() public view returns (string) {
        return "Aellementese";
    }

    function symbol() public view returns (string) {
        return "Aee";
    }
}

contract Grinion is Resource {
    function name() public view returns (string) {
        return "Grinion";
    }

    function symbol() public view returns (string) {
        return "Gnn";
    }
}

contract Mumenum is Resource {
    function name() public view returns (string) {
        return "Mumenum";
    }

    function symbol() public view returns (string) {
        return "Mmm";
    }
}