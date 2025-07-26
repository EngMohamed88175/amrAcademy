import 'package:flutter/widgets.dart';
import 'package:schoolacademy/core/utils/constant/style_manger.dart';

class ClassesWidget extends StatelessWidget {
  const ClassesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "الصفوف الدراســـــــــــــــــية",
          style: StylesManager.styleBold35Regular(context)
              .copyWith(color: const Color(0xff172b4d)),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
