import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vokki/src/features/account/data/auth_repository.dart';
import 'package:vokki/src/features/account/presentation/account_screen.dart';
import 'package:vokki/src/features/phrase_cards/presentation/phrase_card_new_screen.dart';
import 'package:vokki/src/features/home/presentation/home_screen.dart';
import 'package:vokki/src/features/sign_in/email_password_sign_in_form_type.dart';
import 'package:vokki/src/features/sign_in/email_password_sign_in_screen.dart';
import 'package:vokki/src/routing/go_router_refresh_stream.dart';

part 'app_router.g.dart';

enum AppRoute {
  signIn,
  home,
  account,
  phraseCardNew,
}

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;
      if (isLoggedIn) {
        if (state.uri.toString() == '/signIn') {
          return '/';
        }
      } else {
        return '/signIn';
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'account',
            name: AppRoute.account.name,
            builder: (context, state) => const AccountScreen(),
          ),
          GoRoute(
            path: 'PhraseCardNew',
            name: AppRoute.phraseCardNew.name,
            pageBuilder: (context, state) => const MaterialPage(
              fullscreenDialog: true,
              child: PhraseCardNewScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/signIn',
        name: AppRoute.signIn.name,
        builder: (context, state) => const EmailPasswordSignInScreen(
          formType: EmailPasswordSignInFormType.signIn,
        ),
      ),
    ],
    //errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
// Path: lib/src/routing/go_router_refresh_stream.dart