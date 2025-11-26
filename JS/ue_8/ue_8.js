function testOverflow() {
    var x = Number.MIN_SAFE_INTEGER;
    var y = Number.MAX_SAFE_INTEGER;
    console.log(x);
    console.log(y);
    console.log("________________________");
    
    x=x**x;
    y=y**y;
    console.log(x);
    console.log(y);
}

function testExpo() {
    for (let i = 1; i > 0; i=i-0.1) {
        
        console.log(i**i);
    }
}

//testOverflow();
testExpo();