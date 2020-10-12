pragma solidity >=0.6.0;

import "./IERC20.sol";
import "./SafeMath.sol";

/// @title A place to implement the functionality of Resources
/// @author Megan OBryan
/// @notice Generic implementation of IERC20
contract Resource is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

    /// @dev Returns the amount of tokens in existence.
    function totalSupply() public view override returns (uint) {
        return _totalSupply;
    }

    /// @return balance The amount of tokens owned by `tokenOwner`.
    function balanceOf(address tokenOwner) public view override returns (uint balance) {
        return _balances[tokenOwner];
    }

    /// @return remaining The remaining number of tokens that `spender` will be
    /// allowed to spend on behalf of `tokenOwner` through {transferFrom}. This is
    /// zero by default.
    /// @notice This value changes when {approve} or {transferFrom} are called.
    function allowance(address tokenOwner, address spender) public view override returns (uint remaining) {
        return _allowances[tokenOwner][spender];
    }

    /// @dev Moves `tokens` tokens from the caller's account to `to`.
    /// @notice Emits a {Transfer} event.
    /// @return success A boolean value indicating whether the operation succeeded
    function transfer(address to, uint tokens) public override returns (bool success) {
        _transfer(msg.sender, to, tokens);
        return true;
    }

    /// @dev Sets `tokens` as the allowance of `spender` over the caller's tokens.
    /// @notice Emits an {Approval} event.
    /// @return success A boolean value indicating whether the operation succeeded.
    function approve(address spender, uint tokens) public override returns (bool success) {
        _approve(msg.sender, spender, tokens);
        return true;
    }

    /// @dev Moves `tokens` tokens from `from` to `to` using the
    /// allowance mechanism. `tokens` is then deducted from the caller's
    /// allowance.
    /// @notice Emits a {Transfer} event.
    /// @return success A boolean value indicating whether the operation succeeded.
    function transferFrom(address from, address to, uint tokens) public override returns (bool success) {
        _transfer(from, to, tokens);
        _approve(from, msg.sender, _allowances[from][msg.sender].sub(tokens));
        return true;
    }

    /// @notice Helper function to transfer tokens in any capacity
    function _transfer(address from, address to, uint256 tokens) internal {
        require(from != address(0));
        require(to != address(0));

        _balances[from] = _balances[from].sub(tokens);
        _balances[to] = _balances[to].add(tokens);
        emit Transfer(from, to, tokens);
    }

    /// @notice Helper function to mint new tokens
    /// @param account The address of the account getting new tokens 
    /// @param tokens The amount of tokens to be minted
    function _mint(address account, uint256 tokens) internal {
        require(account != address(0));

        _totalSupply = _totalSupply.add(tokens);
        _balances[account] = _balances[account].add(tokens);
        emit Transfer(address(0), account, tokens);
    }

    /// @notice Helper function to burn tokens
    /// @param account The address of the account currently holding the tokens
    /// @param tokens The amount of tokens to be burned
    function _burn(address account, uint256 tokens) internal {
        require(account != address(0));

        _balances[account] = _balances[account].sub(tokens);
        _totalSupply = _totalSupply.sub(tokens);
        emit Transfer(account, address(0), tokens);
    }

    /// @notice Helper function to approve transfers of tokens
    function _approve(address owner, address spender, uint256 tokens) internal {
        require(owner != address(0));
        require(spender != address(0));

        _allowances[owner][spender] = tokens;
        emit Approval(owner, spender, tokens);
    }
}

/// @title Resource: Metalicium
/// @author Megan OBryan
/// @notice A specific resource called Metalicium
contract Metalicium is Resource {

    /// @notice an implementation of the optional name function in ERC20
    /// @return The string "Metalicium"
    function name() public pure virtual returns (string memory) {
        return "Metalicium";
    }

    /// @notice an implementation of the optional symbol function in ERC20
    /// @return The string "Mtm"
    function symbol() public pure virtual returns (string memory) {
        return "Mtm";
    }

    /// @notice a specified mint function that allows different resources to be
    /// minted together.
    /// @param account The address of the account getting new tokens 
    /// @param tokens The amount of tokens to be minted
    function _mintMetalicium(address account, uint256 tokens) internal virtual {
        _mint(account, tokens);
    }

    /// @notice a specified burn function that allows different resources to be
    /// burned together.
    /// @param account The address of the account whose tokens are being burned
    /// @param tokens The amount of tokens to be burned
    function _burnMetalicium(address account, uint256 tokens) internal virtual {
        _burn(account, tokens);
    }
}

/// @title Resource: Aellementese
/// @author Megan OBryan
/// @notice A specific resource called Aellementese
contract Aellementese is Resource {

    /// @notice an implementation of the optional name function in ERC20
    /// @return The string "Aellementese"
    function name() public pure virtual returns (string memory) {
        return "Aellementese";
    }

    /// @notice an implementation of the optional symbol function in ERC20
    /// @return The string "Aee"
    function symbol() public pure virtual returns (string memory) {
        return "Aee";
    }

    /// @notice a specified mint function that allows different resources to be
    /// minted together.
    /// @param account The address of the account getting new tokens 
    /// @param tokens The amount of tokens to be minted
    function _mintAellementese(address account, uint256 tokens) internal virtual {
        _mint(account, tokens);
    }

    /// @notice a specified burn function that allows different resources to be
    /// burned together.
    /// @param account The address of the account whose tokens are being burned
    /// @param tokens The amount of tokens to be burned
    function _burnAellementese(address account, uint256 tokens) internal virtual {
        _burn(account, tokens);
    }
}

/// @title Resource: Grinion
/// @author Megan OBryan
/// @notice A specific resource called Grinion
contract Grinion is Resource {

    /// @notice an implementation of the optional name function in ERC20
    /// @return The string "Grinion"
    function name() public pure virtual returns (string memory) {
        return "Grinion";
    }

    /// @notice an implementation of the optional symbol function in ERC20
    /// @return The string "Gnn"
    function symbol() public pure virtual returns (string memory) {
        return "Gnn";
    }

    /// @notice a specified mint function that allows different resources to be
    /// minted together.
    /// @param account The address of the account getting new tokens 
    /// @param tokens The amount of tokens to be minted
    function _mintGrinion(address account, uint256 tokens) internal virtual {
        _mint(account, tokens);
    }

    /// @notice a specified burn function that allows different resources to be
    /// burned together.
    /// @param account The address of the account whose tokens are being burned
    /// @param tokens The amount of tokens to be burned
    function _burnGrinion(address account, uint256 tokens) internal virtual {
        _burn(account, tokens);
    }
}

/// @title Resource: Mumenum
/// @author Megan OBryan
/// @notice A specific resource called Mumenum
contract Mumenum is Resource {

    /// @notice an implementation of the optional name function in ERC20
    /// @return The string "Mumenum"
    function name() public pure virtual returns (string memory) {
        return "Mumenum";
    }

    /// @notice an implementation of the optional symbol function in ERC20
    /// @return The string "Mmm"
    function symbol() public pure virtual returns (string memory) {
        return "Mmm";
    }

    /// @notice a specified mint function that allows different resources to be
    /// minted together.
    /// @param account The address of the account getting new tokens 
    /// @param tokens The amount of tokens to be minted
    function _mintMumenum(address account, uint256 tokens) internal virtual {
        _mint(account, tokens);
    }

    /// @notice a specified burn function that allows different resources to be
    /// burned together.
    /// @param account The address of the account whose tokens are being burned
    /// @param tokens The amount of tokens to be burned
    function _burnMumenum(address account, uint256 tokens) internal virtual {
        _burn(account, tokens);
    }
}