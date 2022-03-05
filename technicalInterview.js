const strTest = 'AB-2022-03-04_xx';

const parser = (str) => {
  let date = str.substring(3, str.length-3);;
  let res = new Date(date);
  return res;
}

console.log(parser(test));
