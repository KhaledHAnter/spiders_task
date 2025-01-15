import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Row(children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text("data"),
              ],
            )),
          ]),
        ),
      ),
    );
  }
}
