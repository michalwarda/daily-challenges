function toSpoken(number) {
  const ending = number === 0 ? "th" : "st";
  return `${number}${ending}`;
}

module.exports = {
  toSpoken,
}
