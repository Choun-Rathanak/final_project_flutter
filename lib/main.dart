import 'package:flutter/material.dart';

void main() {
  runApp(const AdminDashboardApp());
}

class AdminDashboardApp extends StatelessWidget {
  const AdminDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey[100],
        fontFamily: 'Roboto',
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardColor = Colors.white;
    final iconColor = Colors.green[400];
    final cardShadow = [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 2,
        blurRadius: 6,
        offset: const Offset(0, 3),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Welcome, Admin',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.green[400]),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Status Indicator
            Row(
              children: [
                Icon(Icons.wifi_off, color: Colors.redAccent, size: 20),
                const SizedBox(width: 8),
                const Text(
                  'System Offline',
                  style: TextStyle(color: Colors.redAccent),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Dashboard Cards (2x2 Grid)
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.0,
                children: [
                  DashboardCard(
                    icon: Icons.bar_chart,
                    text: 'View system analytics',
                    color: iconColor!,
                    shadow: cardShadow,
                  ),
                  DashboardCard(
                    icon: Icons.bed,
                    text: 'Manage room status',
                    color: iconColor,
                    shadow: cardShadow,
                  ),
                  DashboardCard(
                    icon: Icons.build,
                    text: 'Handle guest requests',
                    color: iconColor,
                    shadow: cardShadow,
                  ),
                  DashboardCard(
                    icon: Icons.history,
                    text: 'Review activity logs',
                    color: iconColor,
                    shadow: cardShadow,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Quick Actions Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                QuickActionCard(
                  icon: Icons.notifications,
                  text: 'Send Alert',
                  color: iconColor,
                  shadow: cardShadow,
                ),
                QuickActionCard(
                  icon: Icons.sync,
                  text: 'Sync Data',
                  color: iconColor,
                  shadow: cardShadow,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green[400],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Users'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final List<BoxShadow> shadow;

  const DashboardCard({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    required this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: shadow,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 12),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final List<BoxShadow> shadow;

  const QuickActionCard({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    required this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: shadow,
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 30, color: color),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
