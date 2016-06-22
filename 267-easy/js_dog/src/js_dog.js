function toSpoken(number) {
  const ending = convertNumber(number);
  return `${number}${ending}`;
}

function convertNumber(number) {
  if([11, 12, 13].includes(number)) {
    return 'th';
  } else {
    return {1: 'st', 2: 'nd', 3: 'rd'}[number % 10] || 'th'
  }
}

function createList(place, length = 100) {
  return Array
    .from({length: length + 1}, (_, number) => number + 1)
    .filter(number => number !== place)
    .map(number => toSpoken(number))
}

module.exports = {
  toSpoken,
  createList,
}
