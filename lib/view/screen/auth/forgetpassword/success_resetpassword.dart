import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/forgetpassword/successresetpassword_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/custombuttonauth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
    Get.put(SuccessResetPasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'Success',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              )),
          Text(
            "Congratulations",
            style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 30),
          ),
          Text("Password reset successfully"),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButtomAuth(
                text: "Go to login",
                onPressed: () {
                  controller.goToPageLogin();
                }),
          ),
          SizedBox(height: 30)
        ]),
      ),
    );
  }
}
