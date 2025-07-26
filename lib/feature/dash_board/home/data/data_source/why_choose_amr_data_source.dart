import 'package:schoolacademy/core/utils/constant/image_assets.dart';
import 'package:schoolacademy/feature/dash_board/home/data/model/why_choose_amr_model.dart';

class WhyChooseAmrDataSource {
  final List<WhyChooseMrAmy> whyChooseAmr = [
    WhyChooseMrAmy(
        text: "فيديوهات شرح",
        image: ImageAssetsManger.video,
        des: 'محاضرات شرح شيقة ومتميزة واحترافية'),
    WhyChooseMrAmy(
        text: "تدريبات عمـــلية",
        image: ImageAssetsManger.traning,
        des: "أسئلة تغطي كافة أجزاء المنهج و جميع المستويات"),
    WhyChooseMrAmy(
        text: "أختبارات مستمرية ",
        image: ImageAssetsManger.exam,
        des: "أختبارات دورية بشكل مستمر كل حصة لكل المراحل"),
  ];
}
