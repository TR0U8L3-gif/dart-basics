int main(){
  //List
  List<int> listInt = [1, 2, 3];
  List<String> listStr = [
  'Car',
  'Boat',
  'Plane',
  ];

  print(listInt.length == 3); // true
  print(listInt[1] == 1); // false

  var listInt2 = [0, ...listInt];
  assert(listInt2.length == 4);
  
  //Set 
  Set<String> halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  var surnames = <String>{};
  var names = {}; // Creates a map, not a set!!!!
  
  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);

  //Map 
  Map<String, String> gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  Map<int, String> nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  //Typedef 
  typedef IntList = List<int>;
  IntList il = [1, 2, 3];

  return 0;
}