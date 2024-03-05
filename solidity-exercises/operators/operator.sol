pragma solidity 0.8.0;

contract operators{
    uint public x;
    uint public y;
    uint public sum;
    uint public sub;
    uint public div;
    uint public mult;

    function add(uint x,uint y) public {
        sum= x+y;
    }
    function subtract(uint x,uint y) public {
        sub=x-y;
    }
    function divide(uint x,uint y) public{
        div=x/y;
    }
    function multiply(uint x,uint y) public {
        mult=x*y;
    }

}