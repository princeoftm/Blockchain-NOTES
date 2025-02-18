pragma solidity >=0.6.7 <0.8.29;


contract S1{
  uint256 x =0; 
  function change() public  returns (uint256) {
        x=10;
        return 10;
    }
    function add(uint256 a,uint b) public  returns (uint256) {
      return a+b;
    }
  function check() public  returns (uint256) {
        require(x==10);
        return 10;    
    }


    function empty(uint256 a) public  returns (uint256) {
      return add(a,check());
    }
    function trigger() public  returns (uint256) {
        return empty(change());
    }
}