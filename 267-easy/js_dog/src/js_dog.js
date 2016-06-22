function toSpoken(number) {
  const ending = findEnding(number);
  return `${number}${ending}`;
}

function findEnding(number) {
  switch(number) {
    case 0: return "th"
    case 1: return "st"
    case 2: return "nd"
    case 3: return "rd"
  }
}

module.exports = {
  toSpoken,
}
