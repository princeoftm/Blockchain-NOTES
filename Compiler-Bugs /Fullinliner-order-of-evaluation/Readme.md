

An intro to problem-optimizer steps. 


In solidity optimizer steps are used to efficiently optimize the compilation process.It works by r works by refining the unoptimized IR produced by the code generator in discrete steps, each one receiving the output of the previous one. The order of steps is determined by the step sequence.


Full-inliner order evaluation bug 

What do you need-
1)An optimizer sequence that does not prepare the  prerequesites for Fullinliner or the expression inliner.
2)An Nested-Function call with side effects
3)Solidity Optimizer level between 0.6.7 and 0.8.21

*Examples with inline assembly*


Consider Example1.sol
```
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
```

It looks like a normal function right? But since it evaluates from right to left,this is a function that is expected to revert.

Consider what happens when i put an optimizer step "i"?
```
solc test.sol -o results --debug-info none   --overwrite --optimize --ir-optimized --yul-optimizations "i " 

```
```
                if iszero(lt(calldatasize(), 4))
                {
                    let value := calldataload(0)
                    let newValue := 0
                    newValue := shr(224, value)
                    let selector := newValue
                    if eq(0x26121ff0, newValue)
                    {
                        if callvalue() { revert(0, 0) }
                        let headStart := 4
                        let dataEnd := calldatasize()
                        if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }
                        let usr$ret := 0
                        return(usr$ret, usr$ret)
                    }
```
It returns a value,that its not supposed to.This is very dangerous and can lead to Other outcomes.


*Without inline Assembly(High level Language)*

    
1)Consider Example4.sol(an example of different storage values inside them)

Optimizer sequence used

```solc t1.sol -o results --debug-info none   --overwrite --optimize --ir-optimized --yul-optimizations "dhfoDgvlfnTUtnIftreupl a[r]cL Vcul[j] i"```

An explanation for the optimizer sequence used 

1)This is inspired by the new optimizer sequence but focused on getting Non-expression-split form to i(fullinliner).

2)Yes i still used it to get non static assignment form to i.


Consider this 

```
            function fun_empty1(var_a, var_b) -> var
            { var := 0 }
            function fun_empty(var_a) -> var
            {
                var := fun_empty1(var_a, fun_add(0x02, 0x03))
            }
            function extract_from_storage_value_offsett_uint256(slot_value) -> value
            { value := shr(0, slot_value) }
            function fun_trigger() -> var_
            {
                var_ := fun_empty(fun_add(extract_from_storage_value_offsett_uint256(sload(0x00)), 0x02))
            }
```
When i call fun_empty() it directly puts the add function directly into the empty1 call so i get 
```
var := fun_empty1(fun_add(extract_from_storage_value_offsett_uint256(sload(0x00)), 0x02), fun_add(0x02, 0x03))
```
Which would allow it to be inlined.

Now using this optimizer sequence here 
```
 function fun_empty1(var_a, var_b) -> var
            {
                let var_a_1 := var_a
                let var_b_1 := var_b
                let var_1 := 0
                var_1 := checked_add_uint256(var_a, var_b)
                var := var_1
            }
            function fun_empty(var_a) -> var
            {
                let var_a_1 := var_a
                let var_a_2 := 0x02
                let var_b := 0x03
                let var_1 := 0
                let slot := var_1
                let value := var_a_2
                sstore(var_1, update_byte_slice_shift(sload(var_1), var_a_2))
                var_1 := checked_add_uint256(var_a_2, var_b)
                let var_b_1 := var_1
                let var_2 := 0
                let var_a_3 := var_a
                let var_b_2 := var_1
                let var_3 := var_2
                var_3 := checked_add_uint256(var_a, var_1)
                var_2 := var_3
                var := var_3
            }
            function extract_from_storage_value_offsett_uint256(slot_value) -> value
            { value := shr(0, slot_value) }
            function fun_trigger() -> var
            {
                var := fun_empty(fun_add(extract_from_storage_value_offsett_uint256(sload(0x00)), 0x02))
            }
```

Notice how var_a executes before var_b


Now executing this in a version where this bug is not present 

```
function fun_empty1(var_a, var_b) -> var
            {
                let var_b_1 := var_b
                let var_a_1 := var_a
                let var_1 := 0
                let value := var_b
                let slot := var_1
                sstore(var_1, update_byte_slice_shift(sload(var_1), var_b))
                var_1 := checked_add_uint256(var_a, var_b)
                var := var_1
            }
            function fun_empty(var_a) -> var
            {
                var := fun_empty1(var_a, fun_add1(0x02, 0x03))
            }
            function extract_from_storage_value_offsett_uint256(slot_value) -> value
            { value := shr(0, slot_value) }
            function fun_trigger() -> var
            {
                var := fun_empty(fun_add(extract_from_storage_value_offsett_uint256(sload(0x00)), 0x02))
            }
```

which it does in a correct order.


2)Consider example 5(An example where it is supposed to revert but does not revert)

The function check will always revert here as x==10 is not true .Using The same optimizer sequence above in 0.8.21 gives me this 


```
function fun_empty1(var_a, var_b) -> var
            {
                let var_b_1 := var_b
                let var_a_1 := var_a
                let var_1 := 0
                let y := var_b
                let x := var_a
                let sum := var_1
                sum := add(var_a, var_b)
                if gt(var_a, sum)
                {
                    mstore(var_1, shl(224, 0x4e487b71))
                    mstore(4, 0x11)
                    revert(var_1, 0x24)
                }
                var_1 := sum
                var := sum
            }
            function fun_empty(var_a) -> var
            {
                var := fun_empty1(var_a, fun_check())
            }
            function fun_trigger() -> var
            {
                var := fun_empty(fun_change())
            }
        }
```
As var_b(fun_check()) gets executed first it always reverts,But Now using the same optimizer sequence in 0.8.13 i get

```
function fun_empty1(var_a, var_b) -> var
            {
                let var_a_1 := var_a
                let var_b_1 := var_b
                let var_1 := 0
                let slot := var_1
                let value := var_b
                sstore(var_1, update_byte_slice_shift(sload(var_1), var_b))
                var_1 := checked_add_uint256(var_a, var_b)
                var := var_1
            }
            function fun_empty(var_a) -> var
            {
                let var_a_1 := var_a
                let var_a_2 := 0x02
                let var_b := 0x03
                let var_1 := 0
                let slot := var_1
                let value := var_a_2
                sstore(var_1, update_byte_slice_shift(sload(var_1), var_a_2))
                var_1 := checked_add_uint256(var_a_2, var_b)
                let var_b_1 := var_1
                let var_2 := 0
                let var_a_3 := var_a
                let var_b_2 := var_1
                let var_3 := var_2
                let slot_1 := var_2
                let value_1 := var_1
                sstore(var_2, update_byte_slice_shift(sload(var_2), var_1))
                var_3 := checked_add_uint256(var_a, var_1)
                var_2 := var_3
                var := var_3
            }
            function extract_from_storage_value_offsett_uint256(slot_value) -> value
            { value := shr(0, slot_value) }
            function fun_trigger() -> var
            {
                var := fun_empty(fun_add(extract_from_storage_value_offsett_uint256(sload(0x00)), 0x02))
            }
```

Remember var_a is change() which changes the value so that check will always become true;



Therefore i can say that,The bug has the potential to alter the behavior of a contract in a very significant way. Reordering reverts or returns may lead to storage writes, memory writes, or event emissions not being performed. It may also lead to the contract not reverting (and therefore not rolling back some operations) when it should or vice-versa.




Codes used-


Example1.sol

```
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


```



Example4.sol

```
pragma solidity >=0.6.7 <0.8.29;

contract S{
  uint256 x = 10; 
  function add(uint256 a,uint b) public  returns (uint256) {
      x=b;
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
```



Example5.sol


```
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

    function empty1(uint256 a, uint256 b) public  returns (uint256) {
        return add(a,b);
    }
    function empty(uint256 a) public  returns (uint256) {
      return empty1(a,check());
    }
    function trigger() public  returns (uint256) {
        return empty(change());
    }
}
```