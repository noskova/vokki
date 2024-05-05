import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:vokki/src/common_widgets/vokki_app_bar.dart';
import 'package:vokki/src/routing/app_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const VokkiAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.goNamed(
          AppRoute.flashCardNew.name,
        ),
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}
