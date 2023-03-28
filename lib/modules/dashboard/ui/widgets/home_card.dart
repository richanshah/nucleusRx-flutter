import '../../../../utils/exports.dart';

/// Creates RichText with clickable Register
/// substring among the whole string(text).
class HomeCard extends StatelessWidget {
   HomeCard({Key? key,required this.title,required this.subTitle, required this.onTap}) : super(key: key);
  final void Function() onTap;
  String title;
  String subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: AppColors.primaryColor,
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
             ListTile(
               horizontalTitleGap: 8,
               contentPadding: EdgeInsets.all(8),
              leading: Image.asset(Assets.images.icWellness.path),
              minVerticalPadding: 20,
              title: const Text('Wellness screening', style: TextStyle(color: Colors.white)),
              dense: true,
              subtitle: Text('Take all your medications on time even if you feel good', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.primaryDarkColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
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
    );
  }
}
