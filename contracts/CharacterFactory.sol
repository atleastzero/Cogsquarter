pragma solidity ^0.7.0;

contract CharacterFactory {
    enum Tribe {
        Mech,
        Sentroid, 
        Suiter,
        Cyborg
    }

    event NewCharacter(string name, Tribe tribe);

    struct Character {
        string name;
        Tribe tribe;
        uint defense;
        uint attack;
    }

    Character[] public characters;

    mapping (address => Character) public ownerToCharacter;

    function createCharacter(string memory _name, Tribe _tribe) public {
        require(ownerToCharacter[msg.sender].defense == 0);
        Character storage character = ownerToCharacter[msg.sender];
        character.name = _name;
        character.tribe = _tribe;
        character.defense = 1;
        character.attack = 1;
        characters.push(character);
        emit NewCharacter(_name, _tribe);
    }
}