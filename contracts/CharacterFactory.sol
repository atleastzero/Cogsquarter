pragma solidity >=0.6.0;


/// @title A place to generate characters 
/// @author Megan OBryan
/// @notice This generates characters which stores the stat info for a player
contract CharacterFactory {

    /// @title Class
    /// @author Megan OBryan
    /// @notice an enum specifying available character classes
    enum Class {
        Mech,
        Sentroid, 
        Suiter,
        Cyborg
    }

    event NewCharacter(string name, Class class);

    /// @title Character
    /// @author Megan OBryan
    /// @notice the struct outlining stored info
    struct Character {
        string name;
        Class class;
        uint defense;
        uint attack;
    }

    Character[] public characters;

    mapping (address => Character) public ownerToCharacter;

    /// @notice Creates a character for an account that doesn't have one
    /// @param _name The name of the character
    /// @param _class The class of the character as a Class enum
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