pragma solidity >=0.6.7 <0.8.29;

contract C1 {
  uint x=1;
    function f() public {
        assembly  {
            function fun_revert() -> ret { revert(0, 0) }
            function fun_return() -> ret { return(0, 0) }
            function f(a, b) -> w {
                let c := mul(a, 4)
                w := add(c, b)
            }
            function store(x, y) -> r {
                sstore(x, y)
                r := y
            }
            let m:=add(fun_return(), fun_revert())
        }
    }
}