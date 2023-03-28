import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../base/base_responsive_view.dart';
import '../../../gen/assets.gen.dart';
import '../../utils/exports.dart';
import 'otp_controller.dart';

/// always use BaseGetView or BaseGetResponsiveView for the pages or screens

class OtpPage extends BaseGetView<OtpController> {
  OtpPage({Key? key}) : super(key: key);

  @override
  String getTag() {
    return (OtpController).toString();
  }


  late final VoidCallback onSubmit;

  Widget _phoneAndTablet() {
    return Scaffold(
      body: Container(
        color: AppColors.primaryDarkColor,
        child: Column(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Image.asset(Assets.images.icSplash.path)),
                )),
            SizedBox(
                height:Get.height * 0.5,
                width: double.infinity,
                //square box; equal height and width so that it won't look like oval
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    //set border radius more than 50% of height and width to make circle
                  ),
                  color: Colors.white,
                  elevation: 10,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            "Verification",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontFamily: 'Roboto',
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: Get.height * 0.02),
                          Text(
                            "Please enter the 6 digit verification code sent to your mobile number",
                            style: TextStyle(
                                color: AppColors.labelGrimGreyColor,
                                fontFamily: 'Roboto',
                                fontSize: 16),
                          ),
                          SizedBox(height: Get.height * 0.02),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: OTPTextField(
                                controller: controller.otpController,
                                length: 6,
                                width: Get.size.width,
                                textFieldAlignment:
                                MainAxisAlignment.spaceAround,
                                fieldWidth: 45,
                                fieldStyle: FieldStyle.box,
                                outlineBorderRadius: 15,
                                style: const TextStyle(fontSize: 17),
                                onChanged: (pin) {
                                  print("Changed: $pin");
                                },
                                onCompleted: (pin) {
                                  print("Completed: $pin");
                                  controller.otpValue=pin;
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
                              // await loginController.verifyViaOTP();
                              controller.otpController.clear();
                              Get.offAndToNamed(AppPaths.dashboard);
                              /*  Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DemoScreen(),
                                ),
                              );*/
                              SharedPref.setValue(PrefsKey.isLoggedIn, true);

                            },
                            child: const Text('Verify & Sign In'),
                          )
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget buildView(BuildContext context) {
    return _phoneAndTablet();
  }
}
