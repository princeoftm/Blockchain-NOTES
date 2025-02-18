/// @use-src 0:"t.sol"
object "S_81" {
    code {
        {
            mstore(64, memoryguard(0x80))
            if callvalue() { revert(0, 0) }
            let slot := 0x00
            let value := 0x0a
            sstore(slot, update_byte_slice_shift(sload(slot), value))
            let _1 := mload(64)
            codecopy(_1, dataoffset("S_81_deployed"), datasize("S_81_deployed"))
            return(_1, datasize("S_81_deployed"))
        }
        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb()
        { revert(0, 0) }
        function update_byte_slice_shift(value, toInsert) -> result
        {
            let toInsert_1 := shl(0, toInsert)
            let value_1 := and(value, not(not(0)))
            result := or(value_1, and(toInsert_1, not(0)))
        }
        function update_storage_value_offsett_rational_by_to_uint256(slot, value)
        {
            sstore(slot, update_byte_slice_shift(sload(slot), value))
        }
        function constructor_S()
        {
            let slot := 0x00
            let value := 0x0a
            sstore(slot, update_byte_slice_shift(sload(slot), value))
        }
    }
    /// @use-src 0:"t.sol"
    object "S_81_deployed" {
        code {
            {
                mstore(64, memoryguard(0x80))
                if iszero(lt(calldatasize(), 4))
                {
                    switch shr(224, calldataload(0))
                    case 0x76b81449 {
                        if callvalue() { revert(0, 0) }
                        let param, param_1 := abi_decode_uint256t_uint256(4, calldatasize())
                        let var_a := param
                        let var_b := param_1
                        let var := 0
                        let slot := var
                        let value := param
                        sstore(var, update_byte_slice_shift(sload(var), param))
                        var := checked_add_uint256(param, param_1)
                        let ret := var
                        let memPos := mload(64)
                        return(memPos, sub(abi_encode_uint256(memPos, var), memPos))
                    }
                    case 0x771602f7 { external_fun_add() }
                    case 0x7fec8d38 { external_fun_trigger() }
                    case 0xf3a3e4fe { external_fun_empty() }
                    case 0xfcd47b43 { external_fun_empty1() }
                }
                revert(0, 0)
            }
            function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb()
            { revert(0, 0) }
            function validator_revert_uint256(value)
            {
                if iszero(eq(value, value)) { revert(0, 0) }
            }
            function abi_decode_uint256(offset) -> value
            {
                value := calldataload(offset)
                let value_1 := value
                if iszero(eq(value, value)) { revert(0, 0) }
            }
            function abi_decode_uint256_1(offset, end) -> value
            {
                let offset_1 := offset
                let value_1 := 0
                value_1 := calldataload(offset)
                let value_2 := value_1
                if iszero(eq(value_1, value_1)) { revert(0, 0) }
                value := value_1
            }
            function abi_decode_uint256t_uint256(headStart, dataEnd) -> value0, value1
            {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }
                let offset := add(headStart, 0)
                let end := dataEnd
                let value := 0
                let offset_1 := offset
                let value_1 := value
                value_1 := calldataload(offset)
                let value_2 := value_1
                if iszero(eq(value_1, value_1)) { revert(value, value) }
                value := value_1
                value0 := value_1
                let offset_2 := add(headStart, 32)
                let end_1 := dataEnd
                let value_3 := 0
                let offset_3 := offset_2
                let value_4 := value_3
                value_4 := calldataload(offset_2)
                let value_5 := value_4
                if iszero(eq(value_4, value_4)) { revert(value_3, value_3) }
                value_3 := value_4
                value1 := value_4
            }
            function abi_encode_uint256_to_uint256(value, pos)
            { mstore(pos, value) }
            function abi_encode_uint256(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                let value := value0
                let pos := add(headStart, 0)
                mstore(pos, value0)
            }
            function external_fun_add1()
            {
                if callvalue() { revert(0, 0) }
                let param, param_1 := abi_decode_uint256t_uint256(4, calldatasize())
                let var_a := param
                let var_b := param_1
                let var := 0
                let slot := var
                let value := param
                sstore(var, update_byte_slice_shift(sload(var), param))
                var := checked_add_uint256(param, param_1)
                let ret := var
                let memPos := mload(64)
                return(memPos, sub(abi_encode_uint256(memPos, var), memPos))
            }
            function external_fun_add()
            {
                if callvalue() { revert(0, 0) }
                let param, param_1 := abi_decode_uint256t_uint256(4, calldatasize())
                let var_a := param
                let var_b := param_1
                let var := 0
                var := checked_add_uint256(param, param_1)
                let ret := var
                let memPos := mload(64)
                return(memPos, sub(abi_encode_uint256(memPos, var), memPos))
            }
            function abi_decode(headStart, dataEnd)
            {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }
            }
            function external_fun_trigger()
            {
                if callvalue() { revert(0, 0) }
                let headStart := 4
                let dataEnd := calldatasize()
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }
                let var := 0
                var := fun_empty(fun_add(extract_from_storage_value_offsett_uint256(sload(var)), 0x02))
                let ret := var
                let memPos := mload(64)
                return(memPos, sub(abi_encode_uint256(memPos, var), memPos))
            }
            function abi_decode_tuple_uint256(headStart, dataEnd) -> value0
            {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }
                let offset := add(headStart, 0)
                let end := dataEnd
                let value := 0
                let offset_1 := offset
                let value_1 := value
                value_1 := calldataload(offset)
                let value_2 := value_1
                if iszero(eq(value_1, value_1)) { revert(value, value) }
                value := value_1
                value0 := value_1
            }
            function external_fun_empty()
            {
                if callvalue() { revert(0, 0) }
                let ret := fun_empty(abi_decode_tuple_uint256(4, calldatasize()))
                let memPos := mload(64)
                return(memPos, sub(abi_encode_uint256(memPos, ret), memPos))
            }
            function external_fun_empty1()
            {
                if callvalue() { revert(0, 0) }
                let param, param_1 := abi_decode_uint256t_uint256(4, calldatasize())
                let var_a := param
                let var_b := param_1
                let var := 0
                let var_a_1 := param
                let var_b_1 := param_1
                let var_1 := var
                var_1 := checked_add_uint256(param, param_1)
                var := var_1
                let ret := var_1
                let memPos := mload(64)
                return(memPos, sub(abi_encode_uint256(memPos, var_1), memPos))
            }
            function panic_error_0x11()
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x11)
                revert(0, 0x24)
            }
            function checked_add_uint256(x, y) -> sum
            {
                if gt(x, sub(not(0), y))
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x11)
                    revert(0, 0x24)
                }
                sum := add(x, y)
            }
            function fun_add(var_a, var_b) -> var_
            {
                var_ := checked_add_uint256(var_a, var_b)
            }
            function update_byte_slice_shift(value, toInsert) -> result
            {
                let toInsert_1 := shl(0, toInsert)
                let value_1 := and(value, not(not(0)))
                result := or(value_1, and(toInsert_1, not(0)))
            }
            function update_storage_value_offsett_uint256_to_uint256(slot, value)
            {
                sstore(slot, update_byte_slice_shift(sload(slot), value))
            }
            function fun_add1(var_a, var_b) -> var
            {
                let slot := 0x00
                let value := var_a
                sstore(slot, update_byte_slice_shift(sload(slot), var_a))
                var := checked_add_uint256(var_a, var_b)
            }
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
        }
        data ".metadata" hex"a26469706673582212208557722e88f51b1a528dfdd15424be7eaa92b49fb5f694dcf9bace3c779f162e64736f6c634300080d0033"
    }
}
