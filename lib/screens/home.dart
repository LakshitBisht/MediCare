import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicare/screens/add_medicine.dart';
import 'package:medicare/screens/dashboard.dart';
import 'package:medicare/screens/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MedCare'),
      ),
      body: const DashboardScreen(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.black87),
              currentAccountPicture: const Icon(
                Icons.face,
                size: 48.0,
                color: Colors.white,
              ),
              accountName:
                  Text('${FirebaseAuth.instance.currentUser?.displayName}'),
              accountEmail: Text('${FirebaseAuth.instance.currentUser?.email}'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add_alarm_outlined),
              title: const Text('Add Reminder'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddMedicineScreen(),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  });
                }),
            const Divider(),
            ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete Account'),
                onTap: () {
                  FirebaseAuth.instance.currentUser?.delete().then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  });
                }),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
