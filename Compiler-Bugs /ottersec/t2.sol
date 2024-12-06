pragma solidity >=0.6.7 <0.8.29;


contract S2{
  uint256 x =0; 
  function change() public  returns (uint256) {
        x=10;
        return 10;
    }
    function add(uint256 a,uint b) public  returns (uint256) {
      return a+b;
    }
    function empty1(uint256 a, uint256 b) public  returns (uint256) {
        return add(a,b);
    }
    function empty(uint256 a) public  returns (uint256) {
      return empty1(a,change());
    }
    function trigger() public  returns (uint256) {
        return empty(x);
    }
}