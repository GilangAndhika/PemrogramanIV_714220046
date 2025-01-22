import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late SharedPreferences logindata;
  String username = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.home),
            SizedBox(width: 8),
            Text('Home'),
          ],
        ),
      ),

      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome Home'),
              const SizedBox(height: 5),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  username,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade700,
                ),
                onPressed: () {

                  logindata.setBool('login', true);
                  logindata.remove('username');

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },

                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),

            ],
          ),
          
        ),
      ),

    );
  }

  // initState method
  @override
  void initState() {
    super.initState();
    initial();
  }

  // initial method
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username').toString();
    });
  }
}
