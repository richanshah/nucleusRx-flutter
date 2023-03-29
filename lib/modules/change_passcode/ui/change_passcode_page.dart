
import 'package:otp_text_field/style.dart';

import '../../../utils/exports.dart';

class ChangePasscodePage extends BaseGetView<ChangePasscodeController> {
  const ChangePasscodePage({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(title: 'Change passcode'),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Scrollbar(
            scrollbarOrientation: ScrollbarOrientation.bottom,
            child: Column(
              children: [
                Row(
                  // direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(Assets.images.imgKeyIcon.path),
                      SizedBox(width: Get.width * 0.04),
                      const Expanded(
                        child: Text(
                            maxLines: 2,
                            'A passcode confirms you are authorizing a dispense or removing pills from your Smart Pill Dispenser',
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            )),
                      ),
                    ]),
                SizedBox(height: Get.height * 0.05),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    child: Text('Change Passcode',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.labelGrimGreyColor,
                            fontFamily: 'Roboto',
                            fontSize: 14)),
                  ),
                ),
                SizedBox(height: Get.height * 0.01),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                  child: OTPTextField(
                      controller: controller.passCodeController,
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: 45,
                      fieldStyle: FieldStyle.box,
                      outlineBorderRadius: 15,
                      style: TextStyle(fontSize: 17),
                      onChanged: (pin) {
                        print("Changed: $pin");
                      },
                      onCompleted: (pin) {
                        print("Completed: $pin");
                        controller.otpValue = pin;
                      }),
                ),
                SizedBox(height: Get.height * 0.1),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primaryDarkColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(10.0),
                    textStyle: const TextStyle(fontSize: 14),
                  ),
                  onPressed: () async {
                    /* await loginController.verifyViaOTP();
                    loginController.otpController.clear();*/
                    Get.back();

                    /*     Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                )*/;
                  },
                  child: const Text('Change Now'),
                )
              ],
            ),
          ),
        ));
  }

  @override
  String? getTag() => (ChangePasscodePage).toString();
}
