int main(){
  //Int
  int x = 1;
  int value = 0x22;
  int bitmask = 0x0f;
    
  //bitwise shift
  /*
    &	AND
    |	OR
    ^	XOR
    ~expr	Unary bitwise complement (0s become 1s; 1s become 0s)
    <<	Shift left
    >>	Shift right
    >>>	Unsigned shift right
  */
  assert((value & bitmask) == 0x02); // AND
  assert((value & ~bitmask) == 0x20); // AND NOT
  assert((value | bitmask) == 0x2f); // OR
  assert((value ^ bitmask) == 0x2d); // XOR
  assert((value << 4) == 0x220); // Shift left
  assert((value >> 4) == 0x02); // Shift right
  assert((value >>> 4) == 0x02); // Unsigned shift right
  assert((-value >> 4) == -0x03); // Shift right
  assert((-value >>> 4) > 0); // Unsigned shift right


  //Double
  double y = 1.1;
  double exponents = 1.42e5;

  //Strings
  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";
  var s5 = 
  '''You can 
  create multi-line strings 
  like this one.''';
  var s6 = 
  """This is 
  also a 
  multi-line string.""";

  //Conversions
    // String to int
    var one = int.parse('1');
    assert(one == 1);

    // String to double
    var onePointOne = double.parse('1.1');
    assert(onePointOne == 1.1);

    // int to String
    String oneAsString = 1.toString();
    assert(oneAsString == '1');

    // double to String
    String piAsString = 3.14159.toStringAsFixed(2);
    assert(piAsString == '3.14');
    
  return 0;
}