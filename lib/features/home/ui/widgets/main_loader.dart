import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MainLoader extends StatelessWidget {
  const MainLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.waveDots(
          color: Colors.white, size: MediaQuery.sizeOf(context).width / 3),
    );
  }
}
