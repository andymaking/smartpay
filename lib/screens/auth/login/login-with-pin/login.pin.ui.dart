import 'package:flutter/material.dart';

import '../../../base-ui.dart';
import '../login.vm.dart';

class LoginWithPin extends StatelessWidget {
  const LoginWithPin({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      builder: (context, model, theme, child)=> Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
