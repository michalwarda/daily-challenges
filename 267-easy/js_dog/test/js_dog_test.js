const assert = require('assert');
const {toSpoken} = require('../src/js_dog');

describe('toSpoken', () => {
  it('returns correct number', () => {
    assert(toSpoken(0) === "0th");
    assert(toSpoken(1) === "1st");
  });
});
