import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vokki/src/routing/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () => context.goNamed(
              AppRoute.account.name,
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}
