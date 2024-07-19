import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../controller/forgetpassword/verifycode_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'Account Verification',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<VerifyCodeControllerImp>(
          builder: (controller) => HandlingDataViewRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: ListView(children: [
                const SizedBox(height: 20),
                const CustomTextTitleAuth(text: "Verification Code"),
                const SizedBox(height: 10),
                const CustomTextBodyAuth(
                    text:
                    "Please enter the verification code sent to your email"),
                const SizedBox(height: 15),
                OtpTextField(
                  fieldWidth: 50.0,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 5,
                  borderColor: const Color(0xFF512DA8),
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                  },
                  onSubmit: (String verificationCode) {
                    controller.goToRestPassword(verificationCode);
                  },
                ),
                const SizedBox(height: 40),
              ]),
            ),
          )),
    );
  }
}