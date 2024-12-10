var n = 256; // ค่าเริ่มต้นของ n
var i = n; // กำหนด i = n
var r = 0; // กำหนดค่าเริ่มต้นของ r

console.log('เริ่มต้น:');
console.log(`ค่าเริ่มต้น: i = ${i}, r = ${r}`);

while (i >= 1) {
  console.log(`\nรอบของ while: i = ${i}`);

  for (var j = 1; j <= n; j++) {
    r += 1;
    if (j === 1 || j === n) {
      console.log(`  รอบ for: j = ${j}, r = ${r}`);
    }
  }

  i = Math.floor(i / 2);
  console.log(`หลังจบลูป for: i = ${i}, r = ${r}`);
}

console.log(`\nผลลัพธ์ของ r หลังจากจบการทำงาน: ${r}`);