// AppBar logo 

import 'package:flutter/material.dart';

class AppBarBoard extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(centerTitle: false, actions: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset('assets/images/11111-hdpi.png', scale: 2),
      ]),
    ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
