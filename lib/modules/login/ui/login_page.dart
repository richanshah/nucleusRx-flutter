import '../../../utils/exports.dart';

class LoginPage extends BaseGetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
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
                height: Get.height * 0.5,
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
                            "Sign In",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontFamily: 'Roboto',
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "We will send you a veriifcation code on this mobile number",
                            style: TextStyle(
                                color: AppColors.labelGrimGreyColor,
                                fontFamily: 'Roboto',
                                fontSize: 16),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                                controller: controller.phoneController,
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(color: Colors.blue),
                                    border: UnderlineInputBorder(),
                                    hintText: 'Mobile number',
                                    // errorText: "Please enter a valid number",
                                    errorStyle:
                                    TextStyle(color: Colors.purpleAccent),
                                    focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.purpleAccent)),
                                    errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.purpleAccent))),
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                autovalidateMode: AutovalidateMode.always,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp("[0-9]"))
                                ],
                                onChanged: (inputValue) {
                                  /*  if (inputValue.isEmpty ||
                                      inputValue.characters.length < 10) {
                                    setValidator(true);
                                  } else {
                                    setValidator(false);
                                  }*/
                                }),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.primaryDarkColor,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(10.0),
                              textStyle: const TextStyle(fontSize: 14),
                            ),

                            onPressed: () async {
                              // await controller.loginViaOTP();
                              // controller.phoneController.clear();
                              if (controller.phoneController.text.isEmpty ||
                                  controller
                                      .digitValidator.hasMatch(controller
                                      .phoneController.text) &&
                                      controller.phoneController.text
                                          .characters.length <
                                          10) {
                                showSnackBar(value: 'Please enter valid number');
                              } else {
                                controller.onOtpClick();
                              }
                            },
                            child: const Text('Login'),
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
  String? getTag() {
    return (LoginPage).toString();
  }
}
