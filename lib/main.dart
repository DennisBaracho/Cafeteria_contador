import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
    print('Decrement: $count');
  }

  void increment() {
    setState(() {
      count++;
    });
    print('Increment: $count');
  }

  bool get IsEmpty => count == 0;
  bool get IsFull => count == 20;

  @override
  Widget build(BuildContext context) {
    print('Build');

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/img.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              IsFull ? 'Lotado' : 'Pode entrar!',
              style: TextStyle(
                fontSize: 30,
                color: IsFull? Colors.red : Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Text('$count',
                  style: const TextStyle(
                    fontSize: 100,
                    color: Colors.white,
                  )),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextButton(
                onPressed: IsEmpty ? null : decrement,
                style: TextButton.styleFrom(
                  backgroundColor: IsEmpty? Colors.white.withOpacity(0.2) : Colors.white,
                  fixedSize: const Size(100, 100),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text('Saiu',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    )),
              ),
              const SizedBox(width: 32),
              TextButton(
                onPressed: IsFull ? null : increment,
                style: TextButton.styleFrom(
                  backgroundColor: IsFull ? Colors.white.withOpacity(0.2) : Colors.white,
                  fixedSize: const Size(100, 100),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text('Entrou',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    )),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
