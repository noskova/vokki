import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vokki/src/features/account/data/auth_repository.dart';
import 'package:vokki/src/localization/string_hardcoded.dart';
import 'package:vokki/src/routing/app_router.dart';

class Greeting extends ConsumerWidget {
  const Greeting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider).value;

    return TextButton(
        onPressed: () => context.goNamed(
              AppRoute.account.name,
            ),
        child: (user != null && user.email != null)
            ? Text('${'Hello'.hardcoded}, ${user.email!.substring(0, 5)}...!')
            : Text('Hello, Guest!'.hardcoded));
  }
}
