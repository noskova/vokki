// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:vokki/src/common_widgets/vokki_app_bar.dart';
// import 'package:vokki/src/common_widgets/responsive_center.dart';
// import 'package:vokki/src/constants/app_sizes.dart';
// import 'package:vokki/src/features/flashcards/presentation/flash_cards_list/flash_cards_search_text_field.dart';
// import 'package:vokki/src/features/flashcards/presentation/flash_cards_list/sliver_flash_cards_grid.dart';
// import 'package:vokki/src/routing/app_router.dart';

// /// Shows the list of products with a search field at the top.
// class FlashCardsListScreen extends StatefulWidget {
//   const FlashCardsListScreen({super.key});

//   @override
//   State<FlashCardsListScreen> createState() => _FlashCardsListScreenState();
// }

// class _FlashCardsListScreenState extends State<FlashCardsListScreen> {
//   // * Use a [ScrollController] to register a listener that dismisses the
//   // * on-screen keyboard when the user scrolls.
//   // * This is needed because this page has a search field that the user can
//   // * type into.
//   final _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_dismissOnScreenKeyboard);
//   }

//   @override
//   void dispose() {
//     _scrollController.removeListener(_dismissOnScreenKeyboard);
//     super.dispose();
//   }

//   // When the search text field gets the focus, the keyboard appears on mobile.
//   // This method is used to dismiss the keyboard when the user scrolls.
//   void _dismissOnScreenKeyboard() {
//     if (FocusScope.of(context).hasFocus) {
//       FocusScope.of(context).unfocus();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const VokkiAppBar(),
//       body: CustomScrollView(
//         controller: _scrollController,
//         slivers: [
//           const ResponsiveSliverCenter(
//             padding: EdgeInsets.all(Sizes.p16),
//             child: FlashCardsSearchTextField(),
//           ),
//           SliverFlashCardsGrid(
//             onPressed: (context, flashCardId) => context.goNamed(
//               AppRoute.flashCard.name,
//               pathParameters: {'id': flashCardId},
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
