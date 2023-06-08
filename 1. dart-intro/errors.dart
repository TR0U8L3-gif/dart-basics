void main(){

  //error handling
  try {
  breedMoreLlamas();
  } on OutOfLlamasException {
    // A specific exception
    buyMoreLlamas();
  } catch (e) {
    // No specified type, handles all
    print('Something really unknown: $e');
  }finally {
    //Even if an exception is thrown do sth.
    cleanLlamaStalls();
  }
}

class OutOfLlamasException implements Exception {
  final String message;

  OutOfLlamasException(this.message);

  @override
  String toString() {
    return 'OutOfLlamasException: $message';
  }
}

void breedMoreLlamas(){
  throw OutOfLlamasException;
}

void buyMoreLlamas(){
  // yea go buy Llamas... NOW!!!
}

void cleanLlamaStalls(){
  //Always clean up
}