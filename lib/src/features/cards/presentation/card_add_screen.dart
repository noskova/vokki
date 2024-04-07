import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vokki/src/localization/string_hardcoded.dart';

class CardAddScreen extends ConsumerWidget {
  const CardAddScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add card'.hardcoded),
      ),
      body: const Center(
        child: Text('AddCardScreen'),
      ),
    );
  }
}
