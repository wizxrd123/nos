function id(uint x) pure returns (uint) {
    return x;
}

function zero(uint) pure returns (uint) {
    return 0;
}


contract C {
    using * for uint;

    function f(uint x) pure external returns (uint) {
        return x.id();
    }
    function g(uint x) pure external returns (uint) {
        return x.zero();
    }
}
// ----
// ParserError 2314: (142-143): Expected identifier but got '*'
