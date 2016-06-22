function toSpoken(number) {
  const ending = findEnding(number);
  return `${number}${ending}`;
}

function findEnding(number) {
  switch(number) {
    case 1: return "st"
    case 2: return "nd"
    case 3: return "rd"
    default: return "th"
  };
}

module.exports = {
  toSpoken,
}
