pragma solidity >=0.6.0;

import "./Resource.sol";
import "./CharacterFactory.sol";

contract ResourceFactory is Metalicium, Aellementese, Grinion, Mumenum {
    function name() public pure override(Metalicium, Aellementese, Grinion, Mumenum) returns (string memory) {
        return "ResourceFactory";
    }    
    
    function symbol() public pure override(Metalicium, Aellementese, Grinion, Mumenum) returns (string memory) {
        return "RF";
    }
    
    function scavenge() public returns(uint8[4] memory) {
        _mintMetalicium(msg.sender, 8);
        _mintAellementese(msg.sender, 4);
        _mintGrinion(msg.sender, 3);
        _mintMumenum(msg.sender, 1);
        
        return [8, 4, 3, 1];
    }
}
