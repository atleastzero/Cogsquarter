pragma solidity >=0.6.0;

import "./ResourceFactory.sol";
import "./Item.sol";

contract ItemFactory is ResourceFactory, Item {
    event NewPart(string name, Part part);

    Item[] public items;

    mapping (address => Item) public ownerToItem;

    function buildItem(string memory _name, Part _part) public {
        _burnMetalicium(msg.sender, 400);
        _burnAellementese(msg.sender, 50);
        _burnGrinion(msg.sender, 4);
        _burnMumenum(msg.sender, 1);

        emit NewPart("Part", Part.Head);
    }
}