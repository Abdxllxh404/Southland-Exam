var x = 1;
var i = 1;

console.log('เริ่มต้น:');
console.log(`รอบที่ ${i}: ค่า x = ${x}`);

while (x <= 1000) {
  x = Math.pow(2, x); // คำนวณ 2 ยกกำลัง x
  i += 1;
  console.log(`รอบที่ ${i}: ค่า x = ${x}`);
}

console.log(`\nค่า i หลังจบลูป: ${i}`);
console.log(`ค่า x หลังจบลูป: ${x}`);
