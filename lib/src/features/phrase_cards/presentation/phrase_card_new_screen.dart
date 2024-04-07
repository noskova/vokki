import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vokki/src/common_widgets/primary_button.dart';
import 'package:vokki/src/common_widgets/responsive_scrollable_card.dart';
import 'package:vokki/src/constants/app_sizes.dart';
import 'package:vokki/src/features/phrase_cards/presentation/phrase_card_new/phrase_card_new_controller.dart';
import 'package:vokki/src/localization/string_hardcoded.dart';
import 'package:vokki/src/utils/async_value_ui.dart';

class PhraseCardNewScreen extends StatelessWidget {
  const PhraseCardNewScreen({super.key});

  // * Keys for testing using find.byKey()
  static const phraseKey = Key('phrase');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New card'.hardcoded),
      ),
      body: ListView(
        children: const [
          gapH16,
          PhraseCardTextInput(),
        ],
      ),
    );
  }
}

class PhraseCardTextInput extends ConsumerStatefulWidget {
  const PhraseCardTextInput({this.onCardInputAdded, super.key});
  final VoidCallback? onCardInputAdded;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PhraseCardTextInputState();
}

class _PhraseCardTextInputState extends ConsumerState<PhraseCardTextInput> {
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final _phraseController = TextEditingController();

  String get phrase => _phraseController.text;

  var _submitted = false;

  @override
  void dispose() {
    // * TextEditingControllers should be always disposed
    _node.dispose();
    _phraseController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() => _submitted = true);
    // only submit the form if validation passes
    if (_formKey.currentState!.validate()) {
      final controller = ref.read(phraseCardNewControllerProvider.notifier);
      final success = await controller.submit(
        phrase: phrase,
      );
      if (success) {
        widget.onCardInputAdded?.call();
      }
    }
  }

  void _phraseEditingComplete() {
    _node.nextFocus();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      phraseCardNewControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(phraseCardNewControllerProvider);
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
                key: PhraseCardNewScreen.phraseKey,
                controller: _phraseController,
                decoration: InputDecoration(
                  labelText: 'Phrase'.hardcoded,
                  enabled: !state.isLoading,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (email) =>
                //     !_submitted ? null : emailErrorText(email ?? ''),
                autocorrect: false,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                keyboardAppearance: Brightness.light,
                onEditingComplete: () => _phraseEditingComplete(),
                inputFormatters: const <TextInputFormatter>[
                  // ValidatorInputFormatter(
                  //     editingValidator: EmailEditingRegexValidator()),
                ],
              ),
              gapH8,
              // Password field
              PrimaryButton(
                text: 'Submit'.hardcoded,
                isLoading: state.isLoading,
                onPressed: state.isLoading ? null : () => _submit(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
