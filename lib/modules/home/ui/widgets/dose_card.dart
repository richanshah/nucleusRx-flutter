import '../../../../utils/exports.dart';

/// Creates RichText with clickable Register
/// substring among the whole string(text).
class DoseCard extends StatelessWidget {
  DoseCard(
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
        color: AppColors.white,
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Flexible(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      VerticalSpacer(height: Dimens.padding4.h), //SizedBox
                      Assets.images.icWellness.image(
                        fit: BoxFit.contain,
                        height: Dimens.appBarHeight.h,
                      ),
                      // Image.asset(Assets.images.icWellness.path),
                      // const VerticalSpacer(), //SizedBox
                      const Text(
                        '08:00 PM',
                        style: TextStyle(
                          fontSize: Dimens.fontSize20,
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                        ), //Textstyle
                      ), //Text
                      const Text(
                        'Due Dose',
                        style: TextStyle(
                          fontSize: Dimens.fontSize18,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w400,
                        ), //Textstyle
                      ),
                      VerticalSpacer(
                        height: Dimens.padding4.h,
                      ), //Text
                      const Text(
                        'Your evening dose retrieve by 08:30 PM',
                        style: TextStyle(
                          fontSize: Dimens.fontSize16,
                          color: AppColors.lightGrayColor,
                          fontWeight: FontWeight.w400,
                        ), //Textstyle
                      ),
                      // VerticalSpacer(height: Dimens.padding10.h,), //SizedBox
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Dispense details',
                            style: TextStyle(
                              fontSize: Dimens.fontSize16,
                              color: AppColors.blue,
                              fontWeight: FontWeight.w400,
                            ), //Textstyle
                          ),
                          Icon(
                            Icons.arrow_drop_down_sharp,
                            color: AppColors.blue,
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TextButton(
                            child: const Text('SKIP'),
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                            ),
                            onPressed: () {},
                          ),
                          TextButton(
                            child: const Text('Snooze'),
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                            ),
                            onPressed: () {},
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
                            child: const Text('DISPENSE'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
