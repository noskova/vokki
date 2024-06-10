import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vokki/src/common_widgets/alert_dialogs.dart';
import 'package:vokki/src/constants/app_sizes.dart';
import 'package:vokki/src/features/account/data/auth_repository.dart';
import 'package:vokki/src/features/account/domain/app_user.dart';
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
          const SelectLanguage(),
          Center(
            child: ElevatedButton(
              onPressed: state.isLoading
                  ? null
                  : () async {
                      final signOut = await showAlertDialog(
                        context: context,
                        title: 'Are you sure?'.hardcoded,
                        cancelActionText: 'Cancel'.hardcoded,
                        defaultActionText: 'Sign out'.hardcoded,
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
    if (user == null) {
      return const SizedBox.shrink();
    }
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: Text('Email'.hardcoded),
          subtitle: Text(user.email ?? ''),
        ),
        ListTile(
          title: Text('User id'.hardcoded),
          subtitle: Text(user.uid),
        ),
        gapH16,
        ListTile(
          title: EmailVerificationWidget(user: user),
        ),
      ],
    );
  }
}

class EmailVerificationWidget extends ConsumerWidget {
  const EmailVerificationWidget({super.key, required this.user});
  final AppUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(accountScreenControllerProvider);
    if (user.emailVerified == false) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          OutlinedButton(
            onPressed: state.isLoading
                ? null
                : () async {
                    final success = await ref
                        .read(accountScreenControllerProvider.notifier)
                        .sendEmailVerification(user);
                    if (success && context.mounted) {
                      showAlertDialog(
                        context: context,
                        title: 'Sent - now check your email'.hardcoded,
                      );
                    }
                  },
            child: Text(
              'Verify email'.hardcoded,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Verified'.hardcoded,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.green.shade700),
          ),
          gapW8,
          Icon(Icons.check_circle, color: Colors.green.shade700),
        ],
      );
    }
  }
}

class SelectLanguage extends ConsumerWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> languages = ['Spanish', 'Russian'];

    return ListTile(
      title: Text('Select your native language'.hardcoded),
      subtitle: Text('Select language'.hardcoded),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return _languageList(languages: languages);
          },
        );
      },
    );
  }
}

Widget _languageList({required List<String> languages}) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: languages.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(languages[index]),
        onTap: () {
          Navigator.pop(context);
        },
      );
    },
  );
}
