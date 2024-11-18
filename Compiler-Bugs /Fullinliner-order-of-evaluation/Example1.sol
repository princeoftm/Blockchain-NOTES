pragma solidity >=0.6.7 <0.8.29;

contract C {
    function f() public {
        assembly  {
            function fun_revert() -> ret { revert(0, 0) }
            function fun_return() -> ret { return(0, 0) }
            function empty(a, b) {}

            empty(fun_return(), fun_revert())
        }
    }
}