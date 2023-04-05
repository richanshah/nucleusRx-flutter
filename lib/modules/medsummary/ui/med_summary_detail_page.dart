import '../../../utils/exports.dart';

class MedSummaryDetailPage extends BaseGetView<MedSummaryController> {
  const MedSummaryDetailPage({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomAppBar(
            title: 'Medication summary',
            onBackPressed: controller.onBackPressed,
          ),
             Padding(
               padding: const EdgeInsets.all(12.0),
               child: MedSummaryDetailsScrollablePart(),
             ),
        ],
      ),
    );
  }


  @override
  String? getTag() => (MedSummaryDetailPage).toString();
}
