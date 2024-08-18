import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vokki/src/constants/app_sizes.dart';
import 'package:vokki/src/routing/app_router.dart';

class VokkiAppBar extends StatelessWidget implements PreferredSizeWidget {
  const VokkiAppBar({
    super.key,
    this.showLogo,
  });
  final bool? showLogo;

  @override
  Widget build(BuildContext context) {
    return AppBar();
    // return AppBar(
    //   leading: (showLogo ?? false)
    //       ? Padding(
    //           padding: const EdgeInsets.only(left: Sizes.p16),
    //           child: Image.asset('lib/assets/images/vokki_logo.png'),
    //         )
    //       : null,
    //   actions: [
    //     //const Greeting(),
    //     IconButton(
    //       icon: const Icon(Icons.type_specimen, size: Sizes.p40),
    //       onPressed: () => context.goNamed(
    //         AppRoute.flashCardsList.name,
    //       ),
    //     ),
    //     IconButton(
    //       icon: const Icon(Icons.account_circle, size: Sizes.p40),
    //       onPressed: () => context.goNamed(
    //         AppRoute.account.name,
    //       ),
    //     ),
    //   ],
    // );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
