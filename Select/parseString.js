
const csvGenerateCSV = (arrInputs, arrRegexQuery, arrCols) => {
  let strCSV = '';
  arrCols ?
    arrCols.forEach((col) => {strCSV += (col + ',')}) :
    null;
  arrInputs.forEach((input) => {
    arrRegexQuery.forEach((query) => {
      strCSV += strRegexMatch(input, query) + ',';
    });
  });
  const strRes = strCSV.length > 0 ? strCSV.slice(0,-1) : strCSV;
  return strRes;
}

const strRegexMatch = (strWord, strType) => {
  const objTypes = {
    letters: /[A-Za-z]/g,
    numbers: /[0-9]/g,
  }
  const regex = objTypes[strType];
  const strRes = strWord.match(regex) !== null ?
    strWord.match(regex).join('') :
    null;
  return strRes;
}

const test = {
  data: [
    '123ABC',
    '12A3BC',
    '987DEF',
    '9DE87F',
    'AAA111',
    'AAAZZZ',
    '000111'
  ],
  regexQueries: ['numbers', 'letters'],
  cols: ['Numbers', 'Letters'],
}
console.log(csvGenerateCSV(test.data, test.regexQueries, test.cols));
