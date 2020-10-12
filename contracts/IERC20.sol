pragma solidity >=0.6.0;

/// @dev Interface of the ERC20 standard as defined in the EIP.
abstract contract IERC20 {

    /// @dev Returns the amount of tokens in existence.
    function totalSupply() virtual public view returns (uint);

    /// @return balance The amount of tokens owned by `tokenOwner`.
    function balanceOf(address tokenOwner) virtual public view returns (uint balance);
    
    /// @return remaining The remaining number of tokens that `spender` will be
    /// allowed to spend on behalf of `tokenOwner` through {transferFrom}. This is
    /// zero by default.
    /// @notice This value changes when {approve} or {transferFrom} are called.
    function allowance(address tokenOwner, address spender) virtual public view returns (uint remaining);
    
    /// @dev Moves `tokens` tokens from the caller's account to `to`.
    /// @notice Emits a {Transfer} event.
    /// @return success A boolean value indicating whether the operation succeeded
    function transfer(address to, uint tokens) virtual public returns (bool success);
    
    /// @dev Sets `tokens` as the allowance of `spender` over the caller's tokens.
    /// @notice Emits an {Approval} event.
    /// @return success A boolean value indicating whether the operation succeeded.
    function approve(address spender, uint tokens) virtual public returns (bool success);
    
    /// @dev Moves `tokens` tokens from `from` to `to` using the
    /// allowance mechanism. `tokens` is then deducted from the caller's
    /// allowance.
    /// @notice Emits a {Transfer} event.
    /// @return success A boolean value indicating whether the operation succeeded.
    function transferFrom(address from, address to, uint tokens) virtual public returns (bool success);

    /// @dev Emitted when `value` tokens are moved from one account (`from`) to
    /// another (`to`).
    event Transfer(address indexed from, address indexed to, uint tokens);

    /// @dev Emitted when the allowance of a `spender` for an `owner` is set by
    /// a call to {approve}. `value` is the new allowance.
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}