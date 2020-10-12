pragma solidity >=0.6.0;

import "./Resource.sol";
import "./CharacterFactory.sol";

/// @title A place to implement the use of Resources
/// @author Megan OBryan
contract ResourceFactory is Metalicium, Aellementese, Grinion, Mumenum {

    /// @notice this had to be implemented to use Resources as a collective parent
    /// @return name A placeholder name
    function name() public pure override(Metalicium, Aellementese, Grinion, Mumenum) returns (string memory) {
        return "ResourceFactory";
    }    
    
    /// @notice this had to be implemented to use Resources as a collective parent
    /// @return symbol A placeholder symbol
    function symbol() public pure override(Metalicium, Aellementese, Grinion, Mumenum) returns (string memory) {
        return "RF";
    }
    
    /// @notice this function mints resources for a player
    /// @return an array of the amount of each resource collected
    function scavenge() public returns(uint8[4] memory) {
        _mintMetalicium(msg.sender, 8);
        _mintAellementese(msg.sender, 4);
        _mintGrinion(msg.sender, 3);
        _mintMumenum(msg.sender, 1);
        
        return [8, 4, 3, 1];
    }
}
