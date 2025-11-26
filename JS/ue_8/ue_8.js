function testOverflow() {
    var x = Number.MIN_SAFE_INTEGER;
    var y = Number.MAX_SAFE_INTEGER;
    x--;
    y++;
    print(x);
    print(y);
}
testOverflow();