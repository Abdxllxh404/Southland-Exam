// โครงสร้างของ Tree Node
class TreeNode {
  constructor(value, left = null, right = null) {
    this.value = value; // ค่าในโหนด
    this.left = left; // โหนดซ้าย
    this.right = right; // โหนดขวา
  }
}

// ฟังก์ชันหาผลรวมของตัวเลขใน Tree
function sumTree(root) {
  if (root === null) return 0;

  if (typeof root.value === 'number') {
    return root.value + sumTree(root.left) + sumTree(root.right);
  }

  return sumTree(root.left) + sumTree(root.right);
}

// สร้าง Tree ตามโจทย์
const tree = new TreeNode(
  'D',
  new TreeNode(2, new TreeNode(4)),
  new TreeNode(
    3,
    new TreeNode(5, new TreeNode(7), new TreeNode('Empty')),
    new TreeNode('F', new TreeNode(9), new TreeNode(10))
  )
);

// ฟังก์ชันสำหรับวาด Tree พร้อมกิ่งก้าน
function drawTree(node, prefix = '', isLeft = true) {
  if (node === null) return;

  if (node.right !== null) {
    drawTree(node.right, prefix + (isLeft ? '│   ' : '    '), false);
  }

  console.log(prefix + (isLeft ? '└── ' : '┌── ') + node.value);

  if (node.left !== null) {
    drawTree(node.left, prefix + (isLeft ? '    ' : '│   '), true);
  }
}

// แสดง Tree พร้อมกิ่งก้าน
console.log('Tree Structure:');
drawTree(tree);

// เรียกใช้ฟังก์ชันคำนวณผลรวมและแสดงผล
const result = sumTree(tree);
console.log(`\nผลรวมของตัวเลขใน Tree คือ: ${result}`);
