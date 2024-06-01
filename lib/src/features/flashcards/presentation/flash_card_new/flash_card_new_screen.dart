import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vokki/src/common_widgets/primary_button.dart';
import 'package:vokki/src/common_widgets/responsive_scrollable_card.dart';
import 'package:vokki/src/constants/app_sizes.dart';
import 'package:vokki/src/features/account/data/auth_repository.dart';
import 'package:vokki/src/features/flashcards/presentation/flash_card_new/flash_card_new_controller.dart';
import 'package:vokki/src/features/flashcards/presentation/flash_card_new/flash_card_new_notifier.dart';
import 'package:vokki/src/localization/string_hardcoded.dart';
import 'package:vokki/src/routing/app_router.dart';
import 'package:vokki/src/utils/async_value_ui.dart';

class FlashCardNewScreen extends StatelessWidget {
  const FlashCardNewScreen({super.key});

  // * Keys for testing using find.byKey()
  static const wordKey = Key('word');
  static const translationKey = Key('translation');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New flashcard'.hardcoded),
      ),
      body: ListView(
        children: const [
          gapH16,
          FlashCardTextInput(),
        ],
      ),
    );
  }
}

class FlashCardTextInput extends ConsumerStatefulWidget {
  const FlashCardTextInput({this.onCardInputAdded, super.key});
  final VoidCallback? onCardInputAdded;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FlashCardTextInputState();
}

class _FlashCardTextInputState extends ConsumerState<FlashCardTextInput> {
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final _wordController = TextEditingController();
  final _translationController = TextEditingController();

  String get word => _wordController.text;
  String get translation => _translationController.text;

  var _submitted = false;

  @override
  void dispose() {
    // * TextEditingControllers should be always disposed
    _node.dispose();
    _wordController.dispose();
    _translationController.dispose();
    super.dispose();
  }

  void translate() {
    final gemini = Gemini.instance;

    try {
      gemini
          .text("Translate to Russian: ${_wordController.text}")
          .then((value) {
        _translationController.text = value?.output ?? '';
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _submit() async {
    setState(() => _submitted = true);
    // only submit the form if validation passes
    if (_formKey.currentState!.validate()) {
      final controller = ref.read(flashCardNewControllerProvider.notifier);

      final authRepository = ref.watch(authRepositoryProvider);

      final user = authRepository.currentUser;

      final success = await controller.submit(
        word: word,
        translation: translation,
        userId: user?.uid ?? '',
      );
      if (success) {
        widget.onCardInputAdded?.call();
      }
    }
  }

  void _wordEditingComplete() {
    _node.nextFocus();
  }

  void _translationEditingComplete() {
    _node.nextFocus();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      flashCardNewControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(flashCardNewControllerProvider);

    _wordController.text = ref.watch(flashCardNewNotifierProvider);

    if (_wordController.text != '') {
      translate();
    }

    return ResponsiveScrollableCard(
      child: FocusScope(
        node: _node,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              gapH8,
              // Email field
              TextFormField(
                key: FlashCardNewScreen.wordKey,
                controller: _wordController,
                decoration: InputDecoration(
                  labelText: 'Word or phrase'.hardcoded,
                  enabled: !state.isLoading,
                  suffixIcon: _wordController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            _translationController.clear();
                            ref
                                .read(flashCardNewNotifierProvider.notifier)
                                .updateState('');
                          },
                          icon: const Icon(Icons.clear),
                        )
                      : null,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (email) =>
                //     !_submitted ? null : emailErrorText(email ?? ''),
                autocorrect: false,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                keyboardAppearance: Brightness.light,
                maxLines: 3,
                onEditingComplete: () => _wordEditingComplete(),
                inputFormatters: const <TextInputFormatter>[
                  // ValidatorInputFormatter(
                  //     editingValidator: EmailEditingRegexValidator()),
                ],
              ),

              gapH8,
              Wrap(
                children: [
                  IconButton(
                    icon: const Icon(Icons.document_scanner, size: Sizes.p40),
                    onPressed: () => context.goNamed(
                      AppRoute.flashCardTextScan.name,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.mic,
                      size: Sizes.p40,
                    ),
                    onPressed: () => context.goNamed(
                      AppRoute.flashCardTextRecord.name,
                    ),
                  ),
                ],
              ),

              gapH8,
              TextFormField(
                key: FlashCardNewScreen.translationKey,
                controller: _translationController,
                decoration: InputDecoration(
                  labelText: 'Translation'.hardcoded,
                  enabled: !state.isLoading,
                  suffixIcon: _translationController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            _translationController.clear();
                          },
                          icon: const Icon(Icons.clear),
                        )
                      : null,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (email) =>
                //     !_submitted ? null : emailErrorText(email ?? ''),
                autocorrect: false,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                keyboardAppearance: Brightness.light,
                maxLines: 3,
                onEditingComplete: () => _translationEditingComplete(),
                inputFormatters: const <TextInputFormatter>[
                  // ValidatorInputFormatter(
                  //     editingValidator: EmailEditingRegexValidator()),
                ],
              ),
              gapH8,
              Wrap(
                children: [
                  IconButton(
                    icon: const Icon(Icons.translate, size: Sizes.p40),
                    onPressed: () => translate(),
                  ),
                ],
              ),
              gapH8,
              PrimaryButton(
                  text: 'Submit'.hardcoded,
                  isLoading: state.isLoading,
                  onPressed: state.isLoading
                      ? null
                      : () {
                          _submit();
                        }),
            ],
          ),
        ),
      ),
    );
  }
}
