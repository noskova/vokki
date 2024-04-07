import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:vokki/src/features/account/data/auth_repository.dart';
import 'package:vokki/src/features/account/domain/app_user.dart';
import 'package:vokki/src/localization/string_hardcoded.dart';
import 'package:vokki/src/routing/app_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider).value;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Greeting(user: user),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () => context.goNamed(
              AppRoute.account.name,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.goNamed(
          AppRoute.cardAdd.name,
        ),
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}

class Greeting extends StatelessWidget {
  const Greeting({this.user, super.key});
  final AppUser? user;

  @override
  Widget build(BuildContext context) {
    return (user != null && user!.email != null)
        ? Text('${'Hello'.hardcoded}, ${user!.email!.substring(0, 5)}...!')
        : Text('Hello, Guest!'.hardcoded);
  }
}
