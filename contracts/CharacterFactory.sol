pragma solidity >=0.6.0;

import "./Ownable.sol";

contract CharacterFactory is Ownable {
    enum Class {
        Mech,
        Sentroid, 
        Suiter,
        Cyborg
    }

    event NewCharacter(string name, Class class);

    struct Character {
        string name;
        Class class;
        uint defense;
        uint attack;
    }

    Character[] public characters;

    mapping (address => Character) public ownerToCharacter;

    function createCharacter(string memory _name, Class _class) public {
        require(ownerToCharacter[msg.sender].defense == 0);
        Character storage character = ownerToCharacter[msg.sender];
        character.name = _name;
        character.class = _class;
        character.defense = 1;
        character.attack = 1;
        characters.push(character);
        emit NewCharacter(_name, _class);
    }
}