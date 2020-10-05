pragma solidity >=0.6.0;

import "./IERC721.sol";
import "./SafeMath.sol";

contract Item is IERC721 {
    enum Part {
        Head,
        Chest,
        Legs
    }

    using SafeMath for uint256;

    mapping (uint => address) itemApprovals;
    mapping (uint => address) public itemToOwner;
    mapping (address => uint) ownerInventoryCount;

    struct ItemDetails {
        string name;
        Part part;
        uint defense;
        uint attack;
    }

    function balanceOf(address _owner) external view override returns (uint256) {
        return ownerInventoryCount[_owner];
    }

    function ownerOf(uint256 _tokenId) external view override returns (address) {
        itemToOwner[_tokenId];
    }

    function _transfer(address _from, address _to, uint256 _tokenId) private {
        ownerInventoryCount[_to] = ownerInventoryCount[_to].add(1);
        ownerInventoryCount[msg.sender] = ownerInventoryCount[msg.sender].sub(1);
        itemToOwner[_tokenId] = _to;
        emit Transfer(_from, _to, _tokenId);
    }

    function transferFrom(address _from, address _to, uint256 _tokenId) external payable override {
        require (itemToOwner[_tokenId] == msg.sender || itemApprovals[_tokenId] == msg.sender);
        _transfer(_from, _to, _tokenId);
    }

    function approve(address _approved, uint256 _tokenId) external payable override {
        itemApprovals[_tokenId] = _approved;
        emit Approval(msg.sender, _approved, _tokenId);
    }
}
