import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:open_booking/pages/dashboard/dashboard.dart';
import 'package:open_booking/pages/sales/sales.dart';
import 'package:open_booking/pages/purchases/purchases.dart';
import 'package:open_booking/pages/projects/projects.dart';
import 'package:open_booking/pages/clients/clients.dart';
import 'package:open_booking/pages/settings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Hive
    ..init('open_booking')
    ..registerAdapter(ClientAdapter())
    ..registerAdapter(ProjectAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open Booking',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(title: 'Open Booking'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pageController = PageController();
  final sideMenu = SideMenuController();

  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Open Booking',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SideMenu(
              controller: sideMenu,
              style: SideMenuStyle(
                showTooltip: false,
                displayMode: SideMenuDisplayMode.auto,
                hoverColor: Colors.blue[100],
                selectedHoverColor: Colors.blue[700],
                selectedColor: Colors.lightBlue,
                selectedTitleTextStyle: const TextStyle(color: Colors.white),
                selectedIconColor: Colors.white,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.all(Radius.circular(10)),
                // ),
                // backgroundColor: Colors.blueGrey[700],
              ),
              // Settings button
              footer: SideMenuItem(
                title: 'Settings',
                onTap: (index, _) {
                  print('Open settings');
                },
                icon: const Icon(Icons.settings_rounded),
                tooltipContent: "Settings of the application",
              ),
              items: [
                SideMenuItem(
                  title: 'Dashboard',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.dashboard_rounded),
                  tooltipContent: "Dashboard of current and past history",
                ),
                SideMenuItem(
                  title: 'Sales',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.payment_rounded),
                ),
                SideMenuItem(
                  title: 'Purchases',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.shopping_cart_rounded),
                ),
                SideMenuItem(
                  title: 'Projects',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.folder_copy_rounded),
                ),
                SideMenuItem(
                  title: 'Clients',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.groups_2_rounded),
                ),
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: BorderDirectional(
                    start: BorderSide(width: 1, color: Colors.grey[300]!),
                  ),
                ),
                child: PageView(
                  controller: pageController,
                  children: const [
                    DashboardPage(),
                    SalesPage(),
                    PurchasesPage(),
                    ProjectsPage(),
                    ClientsPage(),
                    SettingsPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
