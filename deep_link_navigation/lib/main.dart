import 'package:flutter/material.dart';

// Model data item
class Item {
  final int id;
  final String name;

  Item({required this.id, required this.name});
}

// Routing Path Class
class RoutePath {
  final bool isHome;
  final bool isSettings;
  final int? id;

  RoutePath.home()
      : isHome = true,
        isSettings = false,
        id = null;

  RoutePath.detail(this.id)
      : isHome = false,
        isSettings = false;

  RoutePath.settings()
      : isHome = false,
        isSettings = true,
        id = null;

  bool get isDetail => !isHome && !isSettings;
}

// Parser untuk URI ke RoutePath
class AppRouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = routeInformation.uri;

    if (uri.pathSegments.isEmpty) {
      return RoutePath.home();
    }

    if (uri.pathSegments.length == 1 && uri.pathSegments[0] == 'settings') {
      return RoutePath.settings();
    }

    if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'detail') {
      final id = int.tryParse(uri.pathSegments[1]);
      if (id != null) {
        return RoutePath.detail(id);
      }
    }

    return RoutePath.home();
  }

  @override
  RouteInformation restoreRouteInformation(RoutePath path) {
    if (path.isHome) {
      return RouteInformation(uri: Uri.parse('/'));
    }
    if (path.isSettings) {
      return RouteInformation(uri: Uri.parse('/settings'));
    }
    if (path.isDetail && path.id != null) {
      return RouteInformation(uri: Uri.parse('/detail/${path.id}'));
    }
    return RouteInformation(uri: Uri.parse('/'));
  }
}

// Router Delegate
class AppRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  int? _selectedItemId;
  bool _isSettings = false;

  final List<Item> _items = [
    Item(id: 1, name: 'Item 1'),
    Item(id: 2, name: 'Item 2'),
    Item(id: 3, name: 'Item 3'),
  ];

  void selectItem(int id) {
    _selectedItemId = id;
    _isSettings = false;
    notifyListeners();
  }

  void goToSettings() {
    _selectedItemId = null;
    _isSettings = true;
    notifyListeners();
  }

  void goHome() {
    _selectedItemId = null;
    _isSettings = false;
    notifyListeners();
  }

  @override
  RoutePath get currentConfiguration {
    if (_isSettings) return RoutePath.settings();
    if (_selectedItemId != null) return RoutePath.detail(_selectedItemId);
    return RoutePath.home();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('HomeScreen'),
          child: HomeScreen(
            items: _items,
            onItemSelected: selectItem,
            onSettingsSelected: goToSettings,
          ),
        ),
        if (_selectedItemId != null)
          MaterialPage(
            key: ValueKey('DetailScreen-$_selectedItemId'),
            child: DetailScreen(
              item: _items.firstWhere((item) => item.id == _selectedItemId),
              onBack: goHome,
            ),
          ),
        if (_isSettings)
          const MaterialPage(
            key: ValueKey('SettingsScreen'),
            child: SettingsScreen(),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        goHome();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RoutePath path) async {
    if (path.isHome) {
      _selectedItemId = null;
      _isSettings = false;
    } else if (path.isSettings) {
      _selectedItemId = null;
      _isSettings = true;
    } else if (path.isDetail && path.id != null) {
      _selectedItemId = path.id;
      _isSettings = false;
    }
  }
}

// Main
void main() {
  runApp(const MyApp());
}

// Root App
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Deep Linking App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      routerDelegate: AppRouterDelegate(),
      routeInformationParser: AppRouteInformationParser(),
    );
  }
}

// Home Screen
class HomeScreen extends StatelessWidget {
  final List<Item> items;
  final Function(int) onItemSelected;
  final VoidCallback onSettingsSelected;

  const HomeScreen({
    super.key,
    required this.items,
    required this.onItemSelected,
    required this.onSettingsSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('ID: ${item.id}'),
                  onTap: () => onItemSelected(item.id),
                  trailing: const Icon(Icons.arrow_forward),
                );
              },
            ),
          ),
          const SizedBox(height: 16), // jarak di atas tombol
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: ElevatedButton(
              onPressed: onSettingsSelected,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Go to Settings'),
            ),
          ),
        ],
      ),
    );
  }
}

// Detail Screen
class DetailScreen extends StatelessWidget {
  final Item item;
  final VoidCallback onBack;

  const DetailScreen({
    super.key,
    required this.item,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail: ${item.name}'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Item: ${item.name}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'ID: ${item.id}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onBack,
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

// Settings Screen
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Ini menu settings.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
