pragma solidity >=0.6.7 <0.8.29;



contract S{
  uint256 x = 10; 
  function add(uint256 a,uint b) public  returns (uint256) {
      x=1;
      return a+b;
    }
  function add1(uint256 a,uint b) public  returns (uint256) {
      x=a;
      return a+b;
    }

    function empty1(uint256 a, uint256 b) public  returns (uint256) {
        return add(a,b);
    }
    function empty(uint256 a) public  returns (uint256) {
      return empty1(a,add1(2, 3));
    }
    function trigger() public  returns (uint256) {
        return empty(add(1,2));
    }
}