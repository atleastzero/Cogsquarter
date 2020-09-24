pragma solidity ^0.7.0;

contract CharacterFactory {
    enum Tribe {
        Mech,
        Sentroid, 
        Suiter,
        Cyborg
    }

    struct Character {
        string name;
        Tribe tribe;
        uint64 defense;
        uint64 attack;
    }
}