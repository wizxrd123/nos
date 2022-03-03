{
  function f() -> r {
     r := mload(0x20)
  }
  sstore(5, 10) // should be removed
  mstore(0, 42) // could be removed, but will probably stay?
  pop(f())
  sstore(5, 10)
}
// ----
// step: unusedStoreEliminator
//
// {
//     {
//         sstore(5, 10)
//         mstore(0, 42)
//         pop(f())
//         sstore(5, 10)
//     }
//     function f() -> r
//     {
//         r := mload(0x20)
//         let r_9 := r
//     }
// }
