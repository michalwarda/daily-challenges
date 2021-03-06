const assert = require('assert');
const {didntGet, toSpoken, createList} = require('../src/js_dog');

describe('toSpoken', () => {
  it('returns correct number', () => {
    assert.equal(toSpoken(0), "0th");
    assert.equal(toSpoken(1), "1st");
    assert.equal(toSpoken(2), "2nd");
    assert.equal(toSpoken(3), "3rd");
    assert.equal(toSpoken(4), "4th");
    assert.equal(toSpoken(11), "11th");
    assert.equal(toSpoken(12), "12th");
    assert.equal(toSpoken(13), "13th");
    assert.equal(toSpoken(111), "111th");
    assert.equal(toSpoken(112), "112th");
    assert.equal(toSpoken(113), "113th");
  });
});

describe('createList', () => {
  it("creates a list of places the dog didn't get", () => {
    assert.deepEqual(createList(1), ['2nd', '3rd', '4th', '5th', '6th', '7th', '8th', '9th', '10th', '11th', '12th', '13th', '14th', '15th', '16th', '17th', '18th', '19th', '20th', '21st', '22nd', '23rd', '24th', '25th', '26th', '27th', '28th', '29th', '30th', '31st', '32nd', '33rd', '34th', '35th', '36th', '37th', '38th', '39th', '40th', '41st', '42nd', '43rd', '44th', '45th', '46th', '47th', '48th', '49th', '50th', '51st', '52nd', '53rd', '54th', '55th', '56th', '57th', '58th', '59th', '60th', '61st', '62nd', '63rd', '64th', '65th', '66th', '67th', '68th', '69th', '70th', '71st', '72nd', '73rd', '74th', '75th', '76th', '77th', '78th', '79th', '80th', '81st', '82nd', '83rd', '84th', '85th', '86th', '87th', '88th', '89th', '90th', '91st', '92nd', '93rd', '94th', '95th', '96th', '97th', '98th', '99th', '100th', '101st']);
    assert.deepEqual(createList(1, 101), ['2nd', '3rd', '4th', '5th', '6th', '7th', '8th', '9th', '10th', '11th', '12th', '13th', '14th', '15th', '16th', '17th', '18th', '19th', '20th', '21st', '22nd', '23rd', '24th', '25th', '26th', '27th', '28th', '29th', '30th', '31st', '32nd', '33rd', '34th', '35th', '36th', '37th', '38th', '39th', '40th', '41st', '42nd', '43rd', '44th', '45th', '46th', '47th', '48th', '49th', '50th', '51st', '52nd', '53rd', '54th', '55th', '56th', '57th', '58th', '59th', '60th', '61st', '62nd', '63rd', '64th', '65th', '66th', '67th', '68th', '69th', '70th', '71st', '72nd', '73rd', '74th', '75th', '76th', '77th', '78th', '79th', '80th', '81st', '82nd', '83rd', '84th', '85th', '86th', '87th', '88th', '89th', '90th', '91st', '92nd', '93rd', '94th', '95th', '96th', '97th', '98th', '99th', '100th', '101st', '102nd']);
  });
});

describe('didntGet', () => {
  it("returns a string with all the places my dog didn't get", () => {
    assert.equal(didntGet(1), "2nd, 3rd, 4th, 5th, 6th, 7th, 8th, 9th, 10th, 11th, 12th, 13th, 14th, 15th, 16th, 17th, 18th, 19th, 20th, 21st, 22nd, 23rd, 24th, 25th, 26th, 27th, 28th, 29th, 30th, 31st, 32nd, 33rd, 34th, 35th, 36th, 37th, 38th, 39th, 40th, 41st, 42nd, 43rd, 44th, 45th, 46th, 47th, 48th, 49th, 50th, 51st, 52nd, 53rd, 54th, 55th, 56th, 57th, 58th, 59th, 60th, 61st, 62nd, 63rd, 64th, 65th, 66th, 67th, 68th, 69th, 70th, 71st, 72nd, 73rd, 74th, 75th, 76th, 77th, 78th, 79th, 80th, 81st, 82nd, 83rd, 84th, 85th, 86th, 87th, 88th, 89th, 90th, 91st, 92nd, 93rd, 94th, 95th, 96th, 97th, 98th, 99th, 100th, 101st");
  })
})
