
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/featchers/auth_fetcher/presentation/views/register_view.dart';

import '../../../../utils/app_style.dart';
import '../../../../utils/spacer.dart';
import '../../../home_fetcher/presentation/views/home_view.dart';
import '../widgets/text_form_field.dart';

class LoginView extends StatefulWidget {
  static const String id = 'login_view';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isSecured = true;
  @override
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //on save method
  // Future<void> onSave() async {
  //   final bool isValid = formKey.currentState?.validate() ?? false;
  //   if (!isValid) {
  //     return;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: ListView(
            children: [
              const SizedBox(
                height: 75,
              ),
              Center(
                child:  Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                      borderRadius:const BorderRadius.all( Radius.circular(40.0)),
                      border:
                      Border.all(color: const Color(0xff0a2d40), width: 2)
                   , image:const  DecorationImage(
                      image: AssetImage("asset/images/logo4.jpg",), fit: BoxFit.cover,
                    ),

                ),
                        // color: Colors.black,

                              // color: Colors.black12,
                              ),
                        ),



              spacerH12,
               Center(
                child: Text(
                  "authentication.sign_in_to_continue".tr(),
                  style: AppStyle.thinTextStyle16,
                ),
              ),
              spacerH20,
              CustomTextField(
                hint: "authentication.email_hint".tr(),
                prefixIcon: Icons.email_outlined,
                myController: emailController,
                onSaved: (String? value) {
                  print("onSaved value is : $value");
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? null
                      : "authentication.error_@".tr();
                },
              ),
              spacerH20,
              CustomTextField(
                hint: "authentication.password_hint".tr(),
                prefixIcon: Icons.lock,
                myController: passwordController,
                validator: (String? value) {
                  return (value!.isEmpty || value.length <= 4)
                      ? "authentication.should_be_less_that_4_character".tr()
                      : null;
                },
                isSecure: isSecured,
                suffixIcon: isSecured
                    ? IconButton(
                        onPressed: () {
                          isSecured = false;
                          setState(() {});
                        },
                        icon: const Icon(Icons.visibility_off),
                      )
                    : IconButton(
                        onPressed: () {
                          isSecured = true;
                          setState(() {});
                        },
                        icon: const Icon(Icons.remove_red_eye_outlined),
                      ),
              ),
              spacerH20,
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, HomeView.id);

                    // Navigator.pushNamed(context, DetailsMovieView.id);
                  },
                  child:  Text(
                    "authentication.sign_in".tr(),
                    style: AppStyle.thinColorTextStyle16,
                  ),
                ),
              ),
              spacerH20,
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                 Text("authentication.do_not_have_account".tr(),

                  style: AppStyle.thinTextStyle16,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RegisterView.id);
                  },
                  child:  Text(
                    "authentication.register".tr(),

                    style: AppStyle.boldColorTextStyle22,
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
