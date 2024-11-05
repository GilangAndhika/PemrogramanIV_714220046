import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 23, 23, 23),
          title: const Text('Tugas Pertemuan 4'),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                width: 250,
                height: 80,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Box 1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    width: 80,
                    height: 180,
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        'Box 2',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),
                  Container(
                    width: 80,
                    height: 180,
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        'Box 3',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )

                ],
              ),

            ],
          ),
        ),

      ),
    );
  }
}