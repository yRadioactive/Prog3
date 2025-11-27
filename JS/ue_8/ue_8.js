function testOverflow() {
    var x = Number.MIN_SAFE_INTEGER;
    var y = Number.MAX_SAFE_INTEGER;
    console.log(x);
    console.log(y);
    console.log("________________________");

    x = x ** x;
    y = y ** y;
    console.log(x);
    console.log(y);
}

function testExpo() {
    for (let i = 1; i > 0; i = i - 0.1) {

        console.log(i ** i);
    }
}

function combineArrays() {
    var output = arguments[0];

    for (let i = 1; i < arguments.length; i++) {
        output = output.concat(arguments[i]);
    }
    output = output.filter(v => ["number","boolean","string"].includes(typeof v));

    output.sort();

    output = [...new Set(output)]

    return output;
}

const arr1 = [1, 2, 3, 1, 4];
const arr2 = [5, 6, 7, 8, null];
const arr3 = ["was","soll","das"];
const arr4 = ["was","spl","Das","WAS","SPL"];


//function parse(filename,filesize,type){
//}

//testOverflow();
//testExpo();
console.log(combineArrays(arr1, arr2,arr3,arr4));
