int main(){
  //Records
  var record = ('first', a: 2, b: true, 'last');
  ({int a, bool b}) recordAB;
  recordAB = (a: 2, b: 4);

  (int, int) swap((int, int) record) {
    var (a, b) = record;
    return (b, a);
  }

  (num, Object) pair = (42, 'a');
  var first = pair.$1; // Static type `num`, runtime type `int`.
  var second = pair.$2;

  (int x, int y, int z) point = (1, 2, 3);
  (int r, int g, int b) color = (1, 2, 3);
  print(point == color); // Prints 'true'.

  ({int x, int y, int z}) pointOb = (x: 1, y: 2, z: 3);
  ({int r, int g, int b}) colorOb = (r: 1, g: 2, b: 3);
  print(pointOb == colorOb); // Prints 'false' due to unrelated types.

  return 0;
}