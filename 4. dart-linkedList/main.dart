class Node<T> {
  T data;
  Node<T>? next;

  Node(this.data, [this.next = null]);

  @override
  String toString() {
    return "Node(data: $data, next: $next)";
  }
}

class LinkedList<T> {
  Node<T>? _head;
  int _length = 0;

  LinkedList([Node<T>? head]){
    this._head = head;
  }

  bool get isEmpty => _length == 0;
  int get length => _length;

  void add(T data) {
    final newNode = Node<T>(data);

    if (_head == null) {
      _head = newNode;
    } else {
      var currentNode = _head;
      while (currentNode!.next != null) {
        currentNode = currentNode.next;
      }
      currentNode.next = newNode;
    }

    _length++;
  }

  void remove(T data) {
    if (_head == null) {
      return;
    }

    if (_head!.data == data) {
      _head = _head!.next;
      _length--;
      return;
    }

    var currentNode = _head;
    var previousNode = currentNode;

    while (currentNode != null && currentNode.data != data) {
      previousNode = currentNode;
      currentNode = currentNode.next;
    }

    if (currentNode != null) {
      previousNode!.next = currentNode.next;
      _length--;
    }
  }

  void printList() {
    print(_head);
  }

  void printListData() {
    if(_head == null){
      print("Linked List is empty");
      return;
    }
    print("Linked List data: ");
    var currentNode = _head;
    while (currentNode != null) {
      print(currentNode.data);
      currentNode = currentNode.next;
    }
  }

  @override
  String toString() {
    String result = "Linked List [";
    var currentNode = _head;
    while (currentNode != null) {
      result += "${currentNode.data}";
      if (currentNode.next != null) {
        result += ", ";
      }
      currentNode = currentNode.next;
    }
    result += "]";
    return result;
  }
}

void main() {
  final linkedList = LinkedList<int>();

  linkedList.add(1);
  linkedList.add(2);
  linkedList.add(3);

  print(linkedList);
  linkedList.printList(); 

  linkedList.remove(2);
  linkedList.printListData(); 
  linkedList.remove(3);
  linkedList.printListData();
  linkedList.remove(1);
  linkedList.printListData(); 

}
