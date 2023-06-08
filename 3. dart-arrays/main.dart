void main(){

  final fixedLengthList = List<int>.filled(5, 0); // Creates fixed-length list.
  print(fixedLengthList); // [0, 0, 0, 0, 0]
  fixedLengthList[0] = 87;
  fixedLengthList.setAll(1, [1, 2, 3]);
  print(fixedLengthList); // [87, 1, 2, 3, 0]

  // Fixed length list length can't be changed or increased
  try{
    fixedLengthList.length = 0;  // Throws
    fixedLengthList.add(499);  // Throws
  } catch (e){
    print(e);
  }
  
  // Creates growable list.
  final growableList = <String>['A', 'B']; 
  growableList[0] = 'G';
  print(growableList); // [G, B]
  growableList.add('X');
  growableList.addAll({'C', 'B'});
  print(growableList); // [G, B, X, C, B]

  //indexes
  final indexA = growableList.indexOf('A'); // -1 (not in the list)
  final firstIndexB = growableList.indexOf('B'); // 1
  final lastIndexB = growableList.lastIndexOf('B'); // 4

  //remove
  growableList.remove('C');
  growableList.removeLast();
  print(growableList); // [G, B, X]

  //sort
  growableList.sort((a, b) => a.compareTo(b));
  print(growableList); // [A, AB, F, F]

  //shuffle
  growableList.shuffle();
  print(growableList); 

  GrowableArray<int> growArr = GrowableArray(1);
  for(int i = 0; i < 8; i++){
    growArr.add(i);
    print(growArr);
  }

}

class GrowableArray<T> {
  List<T?> _arr = List.empty();
  int _length = 0;
  int _capacity = 0;

  int get size => _length;
  int get capacity => _capacity;
  bool get isEmpty => _length == 0;

  GrowableArray([int capacity = 8]) {
    if(capacity < 0) throw Exception("Illegal capacity $capacity");
    this._capacity = capacity;
    this._arr = List.filled(_capacity, null);
  }

  T? get(int index){
    if(index >= _length) return null;
    return _arr[index];
  }

  void add(T obj){
    if(_length + 1 >= _capacity){
      if(_capacity == 0) {
        _capacity = 1;
      }
      else {
        _capacity *= 2;
      }
      List<T?> newArr = List.filled(_capacity, null);
      for(int i = 0; i < _length; i++){
        newArr[i] = _arr[i];
      }
      _arr = newArr;
    }
    _arr[_length] = obj;
    _length++;
  }

  void set(int index, T obj){
    if(index >= _length) return;
    _arr[index] = obj;
  }

  void clear() {
    _arr = List.filled(_capacity, null);
  }

  T? removeAt(int index){
    if(index < 0 || index >= _length) return null;
    T? result = _arr[index];
    List<T?> newArr = List.filled(_capacity, null);
    for(int i = 0, j = 0; i < _length; i++, j++){
      if(i == index) {
        j--;
        continue;
      }
      newArr[j] = _arr[i];
    }
    _arr = newArr;
    _length--;
    _capacity = _length;
    return result;
  }

  bool remove(T obj){
    for(int i = 0; i < _length; i++){
      if(_arr[i] == obj){
        removeAt(i);
        return true;
      }
    }
    return false;
  }

  int indexOf(T obj){
    for(int i = 0; i < _length; i++){
      if(_arr[i] == obj){
        return i;
      }
    }
    return -1;
  }

  bool contains(T obj){
    return indexOf(obj) == -1 ? false : true;
  }

  @override
  String toString(){
    String result = "GrowableArray[capacity: $_capacity, length: $_length] -> [";
    for(int i = 0; i < _length; i++){
      result += "${_arr[i]}";
      if(i != _length - 1){
        result += ", ";
      }
    }
    result += "]";
    return result;
  }
}
