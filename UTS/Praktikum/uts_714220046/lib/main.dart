import 'package:uts_714220046/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:uts_714220046/input_form.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const DynamicBottomNavbar(),
    );
  }
}

class MyInput extends StatefulWidget {
  const MyInput({super.key});

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  final TextEditingController _controller = TextEditingController();
  bool lightOn = false;
  String? language;
  bool agree = false;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            '714220046',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          backgroundColor: Colors.blueAccent,
        ),

        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.blue.shade900],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),

          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const SizedBox(height: 50), // Memberikan spasi di atas
                Center(
                  child: Column(
                    children: [

                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'images/ulbi.png',
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'Selamat Datang di Contact List',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 10),
                      const Text(
                        'Explore more and enjoy your journey',
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.white70,
                        ),
                      ),

                    ],
                  ),
                ),

                const SizedBox(height: 40), // Spasi antara elemen
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyInputForm(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.info_outline,
                    color: Colors.blue.shade900,
                    ),
                  label: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      ),
                    ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background warna tombol
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),

                const Spacer(),
                const Text(
                  'Powered by ULBI',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                
              ],
            ),
          ),
        ),
      );
    }

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$language selected'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void_dispose() {
    _controller.dispose();
    super.dispose();
  }
}

