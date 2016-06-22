const {didntGet, toSpoken, createList} = require('./src/js_dog');

const place = parseInt(process.argv[2]);
if(!place) throw "Specify which place your dog got!";
const length = parseInt(process.argv[3] || 100);

console.log(didntGet(place, length));
