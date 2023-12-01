import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BreadCrumbProvider(),
      child: MaterialApp(
        title: 'Provider Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const MyHomePage(),
          '/new': (context) => const MyNewBreadCrumbPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer<BreadCrumbProvider>(
          builder: (
            BuildContext context,
            BreadCrumbProvider value,
            Widget? child,
          ) {
            return BreadCrumbsWidget(breadCrumbs: value.items);
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton.extended(
            onPressed: () => context.read<BreadCrumbProvider>().reset(),
            elevation: 4.0,
            tooltip: "Reset routes",
            label: const Row(
              children: [
                Icon(Icons.replay_outlined),
                SizedBox(
                  width: 8.0,
                ),
                Text("Reset Routes")
              ],
            ),
          ),
          FloatingActionButton.extended(
            onPressed: () => Navigator.of(context).pushNamed('/new'),
            elevation: 4.0,
            tooltip: "Add new route",
            label: const Row(
              children: [
                Icon(Icons.add),
                SizedBox(
                  width: 8.0,
                ),
                Text("Add New Route")
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class MyNewBreadCrumbPage extends StatefulWidget {
  const MyNewBreadCrumbPage({super.key});

  @override
  State<MyNewBreadCrumbPage> createState() => _MyNewBreadCrumbPageState();
}

class _MyNewBreadCrumbPageState extends State<MyNewBreadCrumbPage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Add BreadCrumb Page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a new route name',
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton.extended(
            onPressed: () => Navigator.of(context).pop(),
            elevation: 4.0,
            tooltip: "Go back",
            label: const Row(
              children: [
                Icon(Icons.arrow_back),
                SizedBox(
                  width: 8.0,
                ),
                Text("Go Back")
              ],
            ),
          ),
          FloatingActionButton.extended(
            onPressed: () {
              if (_controller.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Enter valid route name')));
                return;
              }
              context.read<BreadCrumbProvider>().add(
                  BreadCrumb(isActive: true, name: _controller.text.trim()));
            },
            elevation: 4.0,
            tooltip: "Add BreadCrumb",
            label: const Row(
              children: [
                Icon(Icons.add),
                SizedBox(
                  width: 8.0,
                ),
                Text("Add BreadCrumb")
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class BreadCrumb {
  bool isActive;
  final String name;
  final String uuid;

  BreadCrumb({
    required this.isActive,
    required this.name,
  }) : uuid = const Uuid().v4();

  String get title => "$name ${isActive ? "" : ">"} ";

  void activate() {
    isActive = true;
  }

  void deactivate() {
    isActive = false;
  }

  @override
  bool operator ==(covariant BreadCrumb other) => uuid == other.uuid;

  @override
  int get hashCode => uuid.hashCode;
}

class BreadCrumbProvider extends ChangeNotifier {
  final List<BreadCrumb> _items = [];
  UnmodifiableListView<BreadCrumb> get items => UnmodifiableListView(_items);

  void add(BreadCrumb breadCrumb) {
    for (final item in _items) {
      item.deactivate();
    }
    _items.add(breadCrumb);
    notifyListeners();
  }

  void reset() {
    _items.clear();
    notifyListeners();
  }
  
  remove(BreadCrumb breadCrumb) {
    int index = _items.indexOf(breadCrumb);
    if(index < 0) return;
    _items.removeRange(index + 1, _items.length);
    _items.last.activate();
    notifyListeners();
  }
}

class BreadCrumbsWidget extends StatelessWidget {
  final UnmodifiableListView<BreadCrumb> breadCrumbs;
  const BreadCrumbsWidget({super.key, required this.breadCrumbs});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: breadCrumbs
          .map((element) => GestureDetector(
            onTap: () => context.read<BreadCrumbProvider>().remove(element),
            child: Text(
                  element.title,
                  style: TextStyle(
                      color: Colors.deepPurple[element.isActive ? 500 : 200], fontSize: 16),
                ),
          ))
          .toList(),
    );
  }
}
