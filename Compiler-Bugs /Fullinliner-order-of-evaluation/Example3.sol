
contract S{
  uint256 x = 10; 
  uint256 y = 20; 
  function add(uint256 a,uint b) public  returns (uint256) {
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
        return empty(add(x,2));
    }
}