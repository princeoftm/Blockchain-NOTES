/// @use-src 1:"t1.sol"
object "S1_156" {
    code {
        {
            mstore(64, memoryguard(0x80))
            if callvalue()
            {
                revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb()
            }
            constructor_S1()
            let _1 := allocate_unbounded()
            codecopy(_1, dataoffset("S1_156_deployed"), datasize("S1_156_deployed"))
            return(_1, datasize("S1_156_deployed"))
        }
        function allocate_unbounded() -> memPtr
        { memPtr := mload(64) }
        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb()
        { revert(0, 0) }
        function shift_left(value) -> newValue
        { newValue := shl(0, value) }
        function update_byte_slice_shift(value, toInsert) -> result
        {
            let mask := not(0)
            toInsert := shift_left(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }
        function cleanup_rational_by(value) -> cleaned
        { cleaned := value }
        function cleanup_uint256(value) -> cleaned
        { cleaned := value }
        function identity(value) -> ret
        { ret := value }
        function convert_rational_by_to_uint256(value) -> converted
        {
            converted := cleanup_uint256(identity(cleanup_rational_by(value)))
        }
        function prepare_store_uint256(value) -> ret
        { ret := value }
        function update_storage_value_offsett_rational_by_to_uint256(slot, value)
        {
            sstore(slot, update_byte_slice_shift(sload(slot), prepare_store_uint256(convert_rational_by_to_uint256(value))))
        }
        function constructor_S1()
        {
            update_storage_value_offsett_rational_by_to_uint256(0x00, 0x00)
        }
    }
    /// @use-src 1:"t1.sol"
    object "S1_156_deployed" {
        code {
            {
                mstore(64, memoryguard(0x80))
                if iszero(lt(calldatasize(), 4))
                {
                    switch shift_right_unsigned(calldataload(0))
                    case 0x2ee79ded { external_fun_change() }
                    case 0x771602f7 { external_fun_add() }
                    case 0x7fec8d38 { external_fun_trigger() }
                    case 0x919840ad { external_fun_check() }
                    case 0xf3a3e4fe { external_fun_empty() }
                }
                revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74()
            }
            function shift_right_unsigned(value) -> newValue
            { newValue := shr(224, value) }
            function allocate_unbounded() -> memPtr
            { memPtr := mload(64) }
            function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb()
            { revert(0, 0) }
            function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b()
            { revert(0, 0) }
            function abi_decode(headStart, dataEnd)
            {
                if slt(sub(dataEnd, headStart), 0)
                {
                    revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b()
                }
            }
            function cleanup_uint256(value) -> cleaned
            { cleaned := value }
            function abi_encode_uint256_to_uint256(value, pos)
            {
                mstore(pos, cleanup_uint256(value))
            }
            function abi_encode_uint256(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                abi_encode_uint256_to_uint256(value0, add(headStart, 0))
            }
            function external_fun_change()
            {
                if callvalue()
                {
                    revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb()
                }
                abi_decode(4, calldatasize())
                let ret := fun_change()
                let memPos := allocate_unbounded()
                return(memPos, sub(abi_encode_uint256(memPos, ret), memPos))
            }
            function validator_revert_uint256(value)
            {
                if iszero(eq(value, cleanup_uint256(value))) { revert(0, 0) }
            }
            function abi_decode_uint256(offset, end) -> value
            {
                value := calldataload(offset)
                validator_revert_uint256(value)
            }
            function abi_decode_uint256t_uint256(headStart, dataEnd) -> value0, value1
            {
                if slt(sub(dataEnd, headStart), 64)
                {
                    revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b()
                }
                value0 := abi_decode_uint256(add(headStart, 0), dataEnd)
                value1 := abi_decode_uint256(add(headStart, 32), dataEnd)
            }
            function external_fun_add()
            {
                if callvalue()
                {
                    revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb()
                }
                let param, param_1 := abi_decode_uint256t_uint256(4, calldatasize())
                let ret := fun_add(param, param_1)
                let memPos := allocate_unbounded()
                return(memPos, sub(abi_encode_uint256(memPos, ret), memPos))
            }
            function external_fun_trigger()
            {
                if callvalue()
                {
                    revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb()
                }
                abi_decode(4, calldatasize())
                let ret := fun_trigger()
                let memPos := allocate_unbounded()
                return(memPos, sub(abi_encode_uint256(memPos, ret), memPos))
            }
            function external_fun_check()
            {
                if callvalue()
                {
                    revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb()
                }
                abi_decode(4, calldatasize())
                let ret := fun_check()
                let memPos := allocate_unbounded()
                return(memPos, sub(abi_encode_uint256(memPos, ret), memPos))
            }
            function abi_decode_tuple_uint256(headStart, dataEnd) -> value0
            {
                if slt(sub(dataEnd, headStart), 32)
                {
                    revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b()
                }
                value0 := abi_decode_uint256(add(headStart, 0), dataEnd)
            }
            function external_fun_empty()
            {
                if callvalue()
                {
                    revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb()
                }
                let ret := fun_empty(abi_decode_tuple_uint256(4, calldatasize()))
                let memPos := allocate_unbounded()
                return(memPos, sub(abi_encode_uint256(memPos, ret), memPos))
            }
            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74()
            { revert(0, 0) }
            function zero_value_for_split_uint256() -> ret
            { ret := 0 }
            function cleanup_rational_by(value) -> cleaned
            { cleaned := value }
            function identity(value) -> ret
            { ret := value }
            function convert_rational_by_to_uint256(value) -> converted
            {
                converted := cleanup_uint256(identity(cleanup_rational_by(value)))
            }
            function shift_left(value) -> newValue
            { newValue := shl(0, value) }
            function update_byte_slice_shift(value, toInsert) -> result
            {
                let mask := not(0)
                toInsert := shift_left(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }
            function convert_uint256_to_uint256(value) -> converted
            {
                converted := cleanup_uint256(identity(cleanup_uint256(value)))
            }
            function prepare_store_uint256(value) -> ret
            { ret := value }
            function update_storage_value_offsett_uint256_to_uint256(slot, value)
            {
                sstore(slot, update_byte_slice_shift(sload(slot), prepare_store_uint256(convert_uint256_to_uint256(value))))
            }
            function fun_change() -> var
            {
                var := zero_value_for_split_uint256()
                let _1 := convert_rational_by_to_uint256(0x0a)
                update_storage_value_offsett_uint256_to_uint256(0x00, _1)
                var := _1
            }
            function panic_error_0x11()
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x11)
                revert(0, 0x24)
            }
            function checked_add_uint256(x, y) -> sum
            {
                x := cleanup_uint256(x)
                y := cleanup_uint256(y)
                sum := add(x, y)
                if gt(x, sum) { panic_error_0x11() }
            }
            function fun_add(var_a, var_b) -> var
            {
                var := zero_value_for_split_uint256()
                var := checked_add_uint256(var_a, var_b)
            }
            function shift_right_0_unsigned(value) -> newValue
            { newValue := shr(0, value) }
            function cleanup_from_storage_uint256(value) -> cleaned
            { cleaned := value }
            function extract_from_storage_value_offsett_uint256(slot_value) -> value
            {
                value := cleanup_from_storage_uint256(shift_right_0_unsigned(slot_value))
            }
            function read_from_storage_split_offset_uint256(slot) -> value
            {
                value := extract_from_storage_value_offsett_uint256(sload(slot))
            }
            function require_helper(condition)
            {
                if iszero(condition) { revert(0, 0) }
            }
            function fun_check() -> var_
            {
                var_ := zero_value_for_split_uint256()
                let expr := read_from_storage_split_offset_uint256(0x00)
                require_helper(eq(cleanup_uint256(expr), convert_rational_by_to_uint256(0x0a)))
                var_ := convert_rational_by_to_uint256(0x0a)
            }
            function fun_empty(var_a) -> var
            {
                var := zero_value_for_split_uint256()
                var := fun_add(var_a, fun_check())
            }
            function fun_trigger() -> var
            {
                var := zero_value_for_split_uint256()
                var := fun_empty(fun_change())
            }
        }
        data ".metadata" hex"a264697066735822122039e4718a4e36abb533fca6336530003ddd52473b8d3bc4370ad722135f3bc88a64736f6c63430008150033"
    }
}
