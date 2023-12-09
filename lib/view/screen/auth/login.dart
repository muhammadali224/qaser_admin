import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller/login_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/exit_alert.dart';
import '../../../core/function/valid_input.dart';
import '../../widget/auth/auth_button.dart';
import '../../widget/auth/body_text.dart';
import '../../widget/auth/herder_text.dart';
import '../../widget/auth/logo.dart';
import '../../widget/shred_component/input_form_field.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            "signin".tr,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: PopScope(
            canPop: true,
            onPopInvoked: (didPop) {
              exitAlert();
              return;
            },
            child: GetBuilder<LoginControllerImp>(
                builder: (controller) => HandlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        child: Form(
                          key: controller.formState,
                          child: ListView(
                            children: [
                              const LogoAuth(),
                              const CustomHeader(headerText: 'authHeader'),
                              const SizedBox(height: 10),
                              const CustomBody(bodyText: 'authLoginBody'),
                              const SizedBox(height: 20),
                              InputFormField(
                                validate: (val) {
                                  return validInput(val!, 7, 50, 'email');
                                },
                                labelString: 'email',
                                hintTitle: 'enterEmail',
                                icon: Icons.email_outlined,
                                controller: controller.email,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              GetBuilder<LoginControllerImp>(
                                builder: (controller) => InputFormField(
                                  validate: (val) {
                                    return validInput(val!, 5, 50, 'password');
                                  },
                                  onSubmit: (val) {
                                    controller.login();
                                  },
                                  isPassword: controller.isVisiblePassword,
                                  onIconTap: () => controller.showPassword(),
                                  labelString: 'password',
                                  hintTitle: 'enterPassword',
                                  icon: Icons.lock_outline,
                                  controller: controller.password,
                                ),
                              ),
                              CustomAuthButton(
                                  text: 'signin',
                                  onPressed: () {
                                    controller.login();
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ))));
  }
}
