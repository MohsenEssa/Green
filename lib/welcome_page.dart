import 'package:flutter/material.dart';
import 'package:green/Customer_signup.dart';

import 'login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: const Icon(
                  Icons.arrow_back,
                  size: 35,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Image(
              image: AssetImage('img/back4.png'),
              height: 250,
              width: 400,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Are you a customer or a gardener?',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 83, 150, 6),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(500, 62),
                ),
                child: const Text('Customer', style: TextStyle(fontSize: 20)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(500, 62),
                ),
                child: const Text('Gardener', style: TextStyle(fontSize: 20)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
