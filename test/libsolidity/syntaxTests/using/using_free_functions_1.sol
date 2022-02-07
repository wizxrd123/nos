function iden(uint x) pure returns (uint) {
    return x;
}

contract C {
    using { iden } for uint;

    function g(uint z) pure external {
        z.iden();
    }
}
