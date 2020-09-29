pragma solidity >=0.6.0;

import "./IERC20.sol";
import "./SafeMath.sol";

contract Resource is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

    function totalSupply() public view override returns (uint) {
        return _totalSupply;
    }

    function balanceOf(address tokenOwner) public view override returns (uint balance) {
        return _balances[tokenOwner];
    }

    function allowance(address tokenOwner, address spender) public view override returns (uint remaining) {
        return _allowances[tokenOwner][spender];
    }

    function transfer(address to, uint tokens) public override returns (bool success) {
        _transfer(msg.sender, to, tokens);
        return true;
    }

    function approve(address spender, uint tokens) public override returns (bool success) {
        _approve(msg.sender, spender, tokens);
        return true;
    }

    function transferFrom(address from, address to, uint tokens) public override returns (bool success) {
        _transfer(from, to, tokens);
        _approve(from, msg.sender, _allowances[from][msg.sender].sub(tokens));
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
}

contract Metalicium is Resource {
    function name() public pure returns (string memory) {
        return "Metalicium";
    }

    function symbol() public pure returns (string memory) {
        return "Mtm";
    }
}

contract Aellementese is Resource {
    function name() public pure returns (string memory) {
        return "Aellementese";
    }

    function symbol() public pure returns (string memory) {
        return "Aee";
    }
}

contract Grinion is Resource {
    function name() public pure returns (string memory) {
        return "Grinion";
    }

    function symbol() public pure returns (string memory) {
        return "Gnn";
    }
}

contract Mumenum is Resource {
    function name() public pure returns (string memory) {
        return "Mumenum";
    }

    function symbol() public pure returns (string memory) {
        return "Mmm";
    }
}