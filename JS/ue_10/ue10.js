const data = require("./data.json");

const array=data.map( array => 
    ({
        id: array["@id"],
        title: array.info.title
    })

);

const authorsArr = data.map( x => (x.info.authors.map(y => ( {
    id: y["@pid"],
    text: y.text
})))).flat();

const authorsArrReduced = authorsArr.reduce();

console.log(authorsArrReduced);