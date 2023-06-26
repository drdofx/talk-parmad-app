import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talk_parmad/controllers/auth_controller.dart';
import 'package:talk_parmad/controllers/home_controller.dart';
import 'package:talk_parmad/screens/auth_page.dart';
import 'package:talk_parmad/screens/create_forum_page.dart';
import 'package:talk_parmad/screens/create_thread_page.dart';
import 'package:talk_parmad/screens/forum_discovery_page.dart';
import 'package:talk_parmad/screens/forum_list_page.dart';
import 'package:talk_parmad/screens/forum_page.dart';
import 'package:talk_parmad/screens/home_page.dart';
import 'package:talk_parmad/screens/profile_page.dart';
import 'package:talk_parmad/screens/thread_page.dart';
import 'package:talk_parmad/services/auth_service.dart';
import 'package:talk_parmad/services/home_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences _sharedPreferences;
  late AuthService _authService;
  late AuthController _authController;
  late HomeController _homeController;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeDependencies();
    _homeController = HomeController(
      homeService: HomeService(baseUrl: 'http://localhost:8080/api/v1'),
    );
  }

  Future<void> initializeDependencies() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _authService = AuthService(baseUrl: 'http://localhost:8080/api/v1');
    _authController = AuthController(
      authService: _authService,
      sharedPreferences: _sharedPreferences,
      // context: context,
    );
    setState(() {
      _isInitialized = true;
    });
  }

  int _selectedIndex = 0;

  late final List<Widget> _screens = [
    HomePage(),
    ForumDiscoveryPage(),
    CreateForumPage(),
    ForumListPage(),
    ProfilePage(authController: _authController),
  ];

  void _onItemTapped(int index) {
    if (index == 0) {
      // Refresh data when the home bar is clicked
      _homeController.refreshData();
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  void _loginUser(String username, String password) async {
    final bool loginSuccessful =
        await _authController.login(username, password);

    if (loginSuccessful) {
      _homeController.refreshData();
      setState(() {
        _selectedIndex = 0; // Move to the home page after login
      });
    } else {
      // Handle login failure
    }
  }

  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/createThread':
        return MaterialPageRoute(builder: (context) => CreateThreadPage());
      case '/forum':
        // Retrieve the forum ID from the arguments
        final args = settings.arguments as Map<String, dynamic>;
        final forumId = args['forumId'] as int;
        return MaterialPageRoute(
          builder: (context) => ForumPage(forumId: forumId),
        );
      case '/thread':
        // Retrieve the forum ID from the arguments
        final args = settings.arguments as Map<String, dynamic>;
        final threadId = args['threadId'] as int;
        return MaterialPageRoute(
          builder: (context) => ThreadPage(threadId: threadId),
        );
      default:
        return null;
    }
  }

  Scaffold buildScaffold(Widget body, int index) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color(0xFFCBE0FF),
        title: const Text('Talk Parmad', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _selectedIndex = 4; // Profile
              });
            },
            icon: const Icon(Icons.person),
          ),
        ],
        elevation: 0.0,
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFCBE0FF),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 36.0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, size: 36.0),
            label: 'Forum Discovery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, size: 36.0),
            label: 'Create Thread',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted, size: 36.0),
            label: 'Forum List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 36.0),
            label: 'Profile',
          ),
        ],
        currentIndex: index,
        selectedItemColor: const Color(0xFF70A6F5),
        unselectedItemColor: const Color(0xFFFFFFFF),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return CircularProgressIndicator(); // Show a loading indicator until dependencies are initialized
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>.value(
          value: _authController,
        ),
        ChangeNotifierProvider<HomeController>.value(
          value: _homeController,
        ),
      ],
      child: MaterialApp(
        title: 'Talk Parmad',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xFFCBE0FF),
        ),
        home: Consumer<AuthController>(
          builder: (context, authController, _) {
            final bool isLoggedIn = authController.isLoggedIn;

            Widget initialScreen;

            if (isLoggedIn) {
              initialScreen = buildScaffold(
                IndexedStack(
                  index: _selectedIndex,
                  children: _screens,
                ),
                _selectedIndex,
              );
            } else {
              initialScreen = AuthPage(loginUser: _loginUser);
            }

            return initialScreen;
          },
        ),
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }
}
