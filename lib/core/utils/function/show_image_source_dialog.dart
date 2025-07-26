// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:schoolacademy/feature/dash_board_desktop/add_quiz/logic/cubit/add_quiz_cubit.dart';

// void showImageSourceDialog(BuildContext context , AddQuizCubit cubit) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text("اختر مصدر الصورة"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.photo_library),
//                 title: const Text("المعرض"),
//                 onTap: () {
//                   Navigator.pop(context);
//                 cubit.  getImage(ImageSource.gallery);
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.camera_alt),
//                 title: const Text("الكاميرا"),
//                 onTap: () {
//                   Navigator.pop(context);
//                 cubit.  getImage(ImageSource.camera);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }