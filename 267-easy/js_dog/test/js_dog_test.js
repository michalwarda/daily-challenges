const assert = require('assert');
const {toSpoken} = require('../src/js_dog');

describe('toSpoken', () => {
  it('returns correct number', () => {
    assert.equal(toSpoken(0), "0th");
    assert.equal(toSpoken(1), "1st");
    assert.equal(toSpoken(2), "2nd");
    assert.equal(toSpoken(3), "3rd");
    assert.equal(toSpoken(4), "4th");
  });
});
