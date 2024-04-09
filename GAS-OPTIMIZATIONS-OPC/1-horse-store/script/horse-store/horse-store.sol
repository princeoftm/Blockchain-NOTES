pragma solidity ^0.8.0;

contract HorseStore{
    uint number_of_horses;

    function updateHorseNumber(uint256 newNumberOfHorses) external{
        number_of_horses=newNumberOfHorses;
    }
    function readNumberOfHorses() external view returns (uint256){
        return number_of_horses;
    }

}