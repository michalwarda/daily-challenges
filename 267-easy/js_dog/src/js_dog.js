function toSpoken(number) {
  const ending = {1: 'st', 2: 'nd', 3: 'rd'}[number % 10] || 'th';
  return `${number}${ending}`;
}

function createList(place, length = 100) {
  return Array
    .from({length: length + 2}, (_, number) => number)
    .filter(number => number !== place)
    .map(number => toSpoken(number))
}

module.exports = {
  toSpoken,
  createList,
}
