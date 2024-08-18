import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vokki/src/features/account/presentation/account_screen.dart';
import 'package:vokki/src/features/authentication/data/auth_repository.dart';
import 'package:vokki/src/features/flashcards/presentation/flash_card_new/flash_card_new_screen.dart';
import 'package:vokki/src/features/flashcards/presentation/flash_card_new/flash_card_text_record_screen.dart';
import 'package:vokki/src/features/flashcards/presentation/flash_card_new/flash_card_text_scan_screen.dart';
import 'package:vokki/src/features/flashcards/presentation/flash_card_screen/flash_card_screen.dart';
import 'package:vokki/src/features/flashcards/presentation/flash_cards_list/flash_cards_list.dart';
import 'package:vokki/src/features/home/presentation/home_screen.dart';
import 'package:vokki/src/features/sign_in/email_password_sign_in_form_type.dart';
import 'package:vokki/src/features/sign_in/email_password_sign_in_screen.dart';
import 'package:vokki/src/routing/go_router_refresh_stream.dart';

part 'app_router.g.dart';

enum AppRoute {
  // flashCard,
  signIn,
  home,
  // account,
  // flashCardNew,
  // flashCardTextScan,
  // flashCardTextRecord,
  // flashCardsList,
}

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    redirect: (context, state) {
      if (authRepository.currentAuthStatus == AuthStatus.authenticated) {
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
        routes: const [
          // GoRoute(
          //   path: 'account',
          //   name: AppRoute.account.name,
          //   builder: (context, state) => const AccountScreen(),
          // ),
          // GoRoute(
          //   path: 'flash-cards-list',
          //   name: AppRoute.flashCardsList.name,
          //   builder: (context, state) => const FlashCardsListScreen(),
          //   routes: [
          //     GoRoute(
          //       path: 'flash-card/:id',
          //       name: AppRoute.flashCard.name,
          //       builder: (context, state) {
          //         final flashCardId = state.pathParameters['id']!;
          //         return FlashCardScreen(flashCardId: flashCardId);
          //       },
          //     ),
          //   ],
          // ),
          // GoRoute(
          //   path: 'flash-card-new',
          //   name: AppRoute.flashCardNew.name,
          //   pageBuilder: (context, state) => const MaterialPage(
          //     fullscreenDialog: true,
          //     child: FlashCardNewScreen(),
          //   ),
          //   routes: [
          //     GoRoute(
          //       path: 'flash-card-text-scan',
          //       name: AppRoute.flashCardTextScan.name,
          //       builder: (context, state) => const FlashCardTextScanScreen(),
          //     ),
          //     GoRoute(
          //       path: 'flash-card-text-record',
          //       name: AppRoute.flashCardTextRecord.name,
          //       builder: (context, state) => const FlashCardTextRecordScreen(),
          //     ),
          //   ],
          // ),
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