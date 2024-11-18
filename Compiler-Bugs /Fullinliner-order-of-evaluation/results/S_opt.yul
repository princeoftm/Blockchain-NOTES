/// @use-src 0:"Example3.sol"
object "S_83" {
    code {
        {
            let _1 := memoryguard(0x80)
            let _2 := 64
            mstore(_2, _1)
            if callvalue()
            {
                let _3 := 0
                let _4 := _3
                revert(_3, _3)
            }
            let slot := 0x00
            let value := 0x0a
            sstore(slot, update_byte_slice_shift(sload(slot), value))
            let slot_1 := 0x01
            let value_1 := 0x14
            sstore(slot_1, update_byte_slice_shift(sload(slot_1), value_1))
            let _5 := _2
            let _6 := _1
            let _7 := datasize("S_83_deployed")
            codecopy(_1, dataoffset("S_83_deployed"), _7)
            return(_1, _7)
        }
        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb()
        {
            let _1 := 0
            let _2 := _1
            revert(_1, _1)
        }
        function update_byte_slice_shift(value, toInsert) -> result
        {
            let toInsert_1 := shl(0, toInsert)
            let _1 := not(0)
            let value_1 := and(value, not(_1))
            let _2 := _1
            result := or(value_1, and(toInsert_1, _1))
        }
        function update_storage_value_offsett_rational_by_to_uint256(slot, value)
        {
            sstore(slot, update_byte_slice_shift(sload(slot), value))
        }
        function update_storage_value_offsett_rational_by_to_t_uint256(slot, value)
        {
            sstore(slot, update_byte_slice_shift(sload(slot), value))
        }
        function constructor_S()
        {
            let slot := 0x00
            let value := 0x0a
            sstore(slot, update_byte_slice_shift(sload(slot), value))
            let slot_1 := 0x01
            let value_1 := 0x14
            sstore(slot_1, update_byte_slice_shift(sload(slot_1), value_1))
        }
    }
    /// @use-src 0:"Example3.sol"
    object "S_83_deployed" {
        code {
            {
                mstore(64, memoryguard(0x80))
                if iszero(lt(calldatasize(), 4))
                {
                    switch shr(224, calldataload(0))
                    case 0x76b81449 {
                        if callvalue()
                        {
                            let _1 := 0
                            let _2 := _1
                            revert(_1, _1)
                        }
                        let headStart := 4
                        let dataEnd := calldatasize()
                        let value0 := 0
                        let value1 := value0
                        if slt(sub(dataEnd, headStart), 64)
                        {
                            let _3 := value0
                            let _4 := value0
                            revert(value0, value0)
                        }
                        value0 := abi_decode_uint256(add(headStart, value0))
                        value1 := abi_decode_uint256(add(headStart, 32))
                        let param := value0
                        let param_1 := value1
                        let var_a := value0
                        let var_b := value1
                        let var := 0
                        let slot := var
                        let value := value0
                        sstore(var, update_byte_slice_shift(sload(var), value0))
                        var := checked_add_uint256(value0, value1)
                        let ret := var
                        let memPos := mload(64)
                        return(memPos, sub(abi_encode_uint256(memPos, var), memPos))
                    }
                    case 0x771602f7 { external_fun_add() }
                    case 0x7fec8d38 { external_fun_trigger() }
                    case 0xf3a3e4fe { external_fun_empty() }
                    case 0xfcd47b43 { external_fun_empty1() }
                }
                let _5 := 0
                let _6 := _5
                revert(_5, _5)
            }
            function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb()
            {
                let _1 := 0
                let _2 := _1
                revert(_1, _1)
            }
            function validator_revert_uint256(value)
            {
                if iszero(eq(value, value))
                {
                    let _1 := 0
                    let _2 := _1
                    revert(_1, _1)
                }
            }
            function abi_decode_uint256(offset) -> value
            {
                let value_1 := calldataload(offset)
                let value_2 := value_1
                value := value_1
                let value_3 := value_1
                if iszero(eq(value_1, value_1))
                {
                    let _1 := 0
                    let _2 := _1
                    revert(_1, _1)
                }
            }
            function abi_decode_uint256t_uint256(headStart, dataEnd) -> value0, value1
            {
                if slt(sub(dataEnd, headStart), 64)
                {
                    let _1 := 0
                    let _2 := _1
                    revert(_1, _1)
                }
                value0 := abi_decode_uint256(add(headStart, 0))
                value1 := abi_decode_uint256(add(headStart, 32))
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
                if callvalue()
                {
                    let _1 := 0
                    let _2 := _1
                    revert(_1, _1)
                }
                let headStart := 4
                let dataEnd := calldatasize()
                let value0 := 0
                let value1 := value0
                if slt(sub(dataEnd, headStart), 64)
                {
                    let _3 := value0
                    let _4 := value0
                    revert(value0, value0)
                }
                value0 := abi_decode_uint256(add(headStart, value0))
                value1 := abi_decode_uint256(add(headStart, 32))
                let param := value0
                let param_1 := value1
                let var_a := value0
                let var_b := value1
                let var := 0
                let slot := var
                let value := value0
                sstore(var, update_byte_slice_shift(sload(var), value0))
                var := checked_add_uint256(value0, value1)
                let ret := var
                let memPos := mload(64)
                return(memPos, sub(abi_encode_uint256(memPos, var), memPos))
            }
            function external_fun_add()
            {
                if callvalue()
                {
                    let _1 := 0
                    let _2 := _1
                    revert(_1, _1)
                }
                let headStart := 4
                let dataEnd := calldatasize()
                let value0 := 0
                let value1 := value0
                if slt(sub(dataEnd, headStart), 64)
                {
                    let _3 := value0
                    let _4 := value0
                    revert(value0, value0)
                }
                value0 := abi_decode_uint256(add(headStart, value0))
                value1 := abi_decode_uint256(add(headStart, 32))
                let param := value0
                let param_1 := value1
                let ret := checked_add_uint256(value0, value1)
                let memPos := mload(64)
                return(memPos, sub(abi_encode_uint256(memPos, ret), memPos))
            }
            function abi_decode(headStart, dataEnd)
            {
                if slt(sub(dataEnd, headStart), 0)
                {
                    let _1 := 0
                    let _2 := _1
                    revert(_1, _1)
                }
            }
            function external_fun_trigger()
            {
                if callvalue()
                {
                    let _1 := 0
                    let _2 := _1
                    revert(_1, _1)
                }
                let headStart := 4
                let dataEnd := calldatasize()
                if slt(sub(dataEnd, headStart), 0)
                {
                    let _3 := 0
                    let _4 := _3
                    revert(_3, _3)
                }
                let var := 0
                var := fun_empty(checked_add_uint256(extract_from_storage_value_offsett_uint256(sload(var)), 0x02))
                let ret := var
                let memPos := mload(64)
                return(memPos, sub(abi_encode_uint256(memPos, var), memPos))
            }
            function abi_decode_tuple_uint256(headStart, dataEnd) -> value0
            {
                if slt(sub(dataEnd, headStart), 32)
                {
                    let _1 := 0
                    let _2 := _1
                    revert(_1, _1)
                }
                value0 := abi_decode_uint256(add(headStart, 0))
            }
            function external_fun_empty()
            {
                if callvalue()
                {
                    let _1 := 0
                    let _2 := _1
                    revert(_1, _1)
                }
                let ret := fun_empty(abi_decode_tuple_uint256(4, calldatasize()))
                let memPos := mload(64)
                return(memPos, sub(abi_encode_uint256(memPos, ret), memPos))
            }
            function external_fun_empty1()
            {
                if callvalue()
                {
                    let _1 := 0
                    let _2 := _1
                    revert(_1, _1)
                }
                let headStart := 4
                let dataEnd := calldatasize()
                let value0 := 0
                let value1 := value0
                if slt(sub(dataEnd, headStart), 64)
                {
                    let _3 := value0
                    let _4 := value0
                    revert(value0, value0)
                }
                value0 := abi_decode_uint256(add(headStart, value0))
                value1 := abi_decode_uint256(add(headStart, 32))
                let param := value0
                let param_1 := value1
                let var_a := value0
                let var_b := value1
                let var := 0
                var := checked_add_uint256(value0, value1)
                let ret := var
                let memPos := mload(64)
                return(memPos, sub(abi_encode_uint256(memPos, var), memPos))
            }
            function panic_error_0x11()
            {
                let _1 := shl(224, 0x4e487b71)
                let _2 := 0
                mstore(_2, _1)
                mstore(4, 0x11)
                let _3 := 0x24
                let _4 := _2
                revert(_2, _3)
            }
            function checked_add_uint256(x, y) -> sum
            {
                let x_1 := x
                let y_1 := y
                if gt(x, sub(not(0), y))
                {
                    let _1 := shl(224, 0x4e487b71)
                    let _2 := 0
                    mstore(_2, _1)
                    mstore(4, 0x11)
                    let _3 := 0x24
                    let _4 := _2
                    revert(_2, _3)
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
                let _1 := not(0)
                let value_1 := and(value, not(_1))
                let _2 := _1
                result := or(value_1, and(toInsert_1, _1))
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
                var := checked_add_uint256(var_a, var_b)
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
                var_2 := checked_add_uint256(var_a, var_1)
                var := var_2
            }
            function extract_from_storage_value_offsett_uint256(slot_value) -> value
            { value := shr(0, slot_value) }
            function fun_trigger() -> var
            {
                var := fun_empty(checked_add_uint256(extract_from_storage_value_offsett_uint256(sload(0x00)), 0x02))
            }
        }
        data ".metadata" hex"a26469706673582212205b2d2f1f4fbb3fc235a52898075dc7e0698a585efecdeca35cac5ba9618c0e2064736f6c634300080d0033"
    }
}
