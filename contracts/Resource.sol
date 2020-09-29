pragma solidity ^0.7.0;

import "./IERC20.sol";
import "./SafeMath.sol";

contract Resource is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

    function totalSupply() public view returns (uint) {
        return _totalSupply;
    }

    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return _balances[tokenOwner];
    }

    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return _allowances[tokenOwner][spender];
    }

    function transfer(address to, uint tokens) public returns (bool success) {
        _transfer(_msgSender(), to, tokens);
        return true;
    }

    function approve(address spender, uint tokens) public returns (bool success) {
        _approve(_msgSender(), spender, tokens);
        return true;
    }

    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        _transfer(from, to, tokens);
        _approve(from, _msgSender(), _allowances[from][_msgSender()].sub(tokens));
        return true;
    }

    function _transfer(address from, address to, uint256 tokens) internal virtual {
        require(from != address(0));
        require(to != address(0));

        _balances[from] = _balances[from].sub(tokens);
        _balances[to] = _balances[to].add(tokens);
        emit Transfer(from, to, tokens);
    }

    function _mint(address account, uint256 tokens) internal virtual {
        require(account != address(0));

        _totalSupply = _totalSupply.add(tokens);
        _balances[account] = _balances[account].add(tokens);
        emit Transfer(address(0), account, tokens);
    }

    function _burn(address account, uint256 tokens) internal virtual {
        require(account != address(0));

        _balances[account] = _balances[account].sub(tokens);
        _totalSupply = _totalSupply.sub(tokens);
        emit Transfer(account, address(0), tokens);
    }

    function _approve(address owner, address spender, uint256 tokens) internal virtual {
        require(owner != address(0));
        require(spender != address(0));

        _allowances[owner][spender] = tokens;
        emit Approval(owner, spender, tokens);
    }

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