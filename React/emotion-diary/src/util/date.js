export const getStringDate = (date) => {
  return date.toISOString().slice(0, 10); // ISO형식의 문자열을 반환 (0부터 9까지 -> yyyy/mm/dd)
};
