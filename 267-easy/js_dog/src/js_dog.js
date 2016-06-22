function toSpoken(number) {
  const ending = {1: 'st', 2: 'nd', 3: 'rd'}[number % 10] || 'th';
  return `${number}${ending}`;
}

module.exports = {
  toSpoken,
}
