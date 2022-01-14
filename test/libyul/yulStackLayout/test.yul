/*=====================================================*
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *=====================================================*/

/// @use-src 0:"test/libsolidity/semanticTests/constructor_with_params.sol"
object "C_21" {
    code {
        {
            /// @src 0:0:135  "contract C {..."
            let _1 := memoryguard(0x80)
            mstore(64, _1)
            if callvalue() { revert(0, 0) }
            let programSize := datasize("C_21")
            let argSize := sub(codesize(), programSize)
            let newFreePtr := add(_1, and(add(argSize, 31), not(31)))
            if or(gt(newFreePtr, sub(shl(64, 1), 1)), lt(newFreePtr, _1))
            {
                mstore(/** @src -1:-1:-1 */ 0, /** @src 0:0:135  "contract C {..." */ shl(224, 0x4e487b71))
                mstore(4, 0x41)
                revert(/** @src -1:-1:-1 */ 0, /** @src 0:0:135  "contract C {..." */ 0x24)
            }
            mstore(64, newFreePtr)
            codecopy(_1, programSize, argSize)
            if slt(sub(add(_1, argSize), _1), 64)
            {
                revert(/** @src -1:-1:-1 */ 0, 0)
            }
            /// @src 0:0:135  "contract C {..."
            let value0 := mload(_1)
            constructor_C(value0, mload(add(_1, 32)))
            let _2 := mload(64)
            let _3 := datasize("C_21_deployed")
            codecopy(_2, dataoffset("C_21_deployed"), _3)
            return(_2, _3)
        }
        /// @ast-id 20 @src 0:56:133  "constructor(uint newI, uint newK) {..."
        function constructor_C(var_newI, var_newK)
        {
            /// @src 0:0:135  "contract C {..."
            sstore(/** @src 0:100:108  "i = newI" */ 0x00, /** @src 0:0:135  "contract C {..." */ var_newI)
            sstore(/** @src 0:118:126  "k = newK" */ 0x01, /** @src 0:0:135  "contract C {..." */ var_newK)
        }
    }
    /// @use-src 0:"test/libsolidity/semanticTests/constructor_with_params.sol"
    object "C_21_deployed" {
        code {
            {
                /// @src 0:0:135  "contract C {..."
                let _1 := memoryguard(0x80)
                mstore(64, _1)
                if iszero(lt(calldatasize(), 4))
                {
                    let _2 := 0
                    switch shr(224, calldataload(_2))
                    case 0xb4f40c61 {
                        if callvalue() { revert(_2, _2) }
                        if slt(add(calldatasize(), not(3)), _2) { revert(_2, _2) }
                        mstore(_1, sload(/** @src 0:36:49  "uint public k" */ 1))
                        /// @src 0:0:135  "contract C {..."
                        return(_1, 32)
                    }
                    case 0xe5aa3d58 {
                        if callvalue() { revert(_2, _2) }
                        if slt(add(calldatasize(), not(3)), _2) { revert(_2, _2) }
                        let ret := sload(_2)
                        let memPos := mload(64)
                        return(memPos, sub(abi_encode_uint256(memPos, ret), memPos))
                    }
                }
                revert(0, 0)
            }
            function abi_encode_uint256(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, value0)
            }
        }
        data ".metadata" hex"a36469706673582212206acfe0eecd0c5183400b9067c1b13f9519dd0a151b8a36bb27960af0a93ba8336c6578706572696d656e74616cf564736f6c63782c302e382e31322d646576656c6f702e323032322e312e31332b636f6d6d69742e38646130383535362e6d6f64006b"
    }
}

