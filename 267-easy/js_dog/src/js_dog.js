function toSpoken(number) {
  const ending = {1: 'st', 2: 'nd', 3: 'rd'}[number % 10] || 'th';
  return `${number}${ending}`;
}

function createList(place) {
  return Array
    .from({length: 102}, (_, number) => number)
    .filter(number => number !== place)
    .map(number => toSpoken(number))
}

module.exports = {
  toSpoken,
  createList,
}
