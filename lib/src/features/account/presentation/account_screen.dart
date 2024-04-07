import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vokki/src/common_widgets/alert_dialogs.dart';
import 'package:vokki/src/features/account/data/auth_repository.dart';
import 'package:vokki/src/features/account/presentation/account/account_screen_controller.dart';
import 'package:vokki/src/localization/string_hardcoded.dart';
import 'package:vokki/src/utils/async_value_ui.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      accountScreenControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(accountScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('My account'.hardcoded),
      ),
      body: Column(
        children: [
          const UserDataList(),
          Center(
            child: ElevatedButton(
              onPressed: state.isLoading
                  ? null
                  : () async {
                      final signOut = await showAlertDialog(
                        context: context,
                        title: 'Are you sure?'.hardcoded,
                        cancelActionText: 'Cancel'.hardcoded,
                        defaultActionText: 'Logout'.hardcoded,
                      );
                      if (signOut == true) {
                        await ref
                            .read(accountScreenControllerProvider.notifier)
                            .signOut();
                      }
                    },
              child: Text('Sign out'.hardcoded),
            ),
          ),
        ],
      ),
    );
  }
}

class UserDataList extends ConsumerWidget {
  const UserDataList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider).value;
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: Text('Name'.hardcoded),
          subtitle: Text(user?.name ?? ''),
        ),
        ListTile(
          title: Text('Email'.hardcoded),
          subtitle: Text(user?.email ?? ''),
        ),
        ListTile(
          title: Text('User id'.hardcoded),
          subtitle: Text(user?.uid ?? ''),
        )
      ],
    );
  }
}
