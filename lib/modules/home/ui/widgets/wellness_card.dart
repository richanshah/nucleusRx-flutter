import '../../../../utils/exports.dart';

/// Creates RichText with clickable Register
/// substring among the whole string(text).
class WellnessCard extends StatelessWidget {
  WellnessCard(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.onTap})
      : super(key: key);
  final void Function() onTap;
  String title;
  String subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: AppColors.primaryColor,
        elevation: 6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ListTile(
              horizontalTitleGap: 8,
              contentPadding: const EdgeInsets.all(8),
              leading: Image.asset(Assets.images.icWellness.path),
              minVerticalPadding: 20,
              title: const Text('Wellness screening',
                  style: TextStyle(color: Colors.white)),
              dense: true,
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                      'Take all your medications on time even if you feel good',
                      style: TextStyle(color: Colors.white)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero, // Set this
                      padding: EdgeInsets.all(4),
                      backgroundColor: AppColors.primaryDarkColor,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 14),
                    ),
                    onPressed: () async {
                      // await controller.loginViaOTP();
                      // controller.phoneController.clear();
                    },
                    child: const Text('Take wellness screening'),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
