import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/snack_bar.dart';

import '../../../../utils/app_style.dart';
import '../../../../utils/const.dart';
import '../../../../utils/spacer.dart';
import '../../../home_fetcher/presentation/views/home_view.dart';
import '../widgets/text_form_field.dart';
import 'login_view.dart';
import 'manger/validation_cubit.dart';

class RegisterView extends StatefulWidget {
  static const String id = 'register_view';

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isSecured = true;
  bool isLoading = false;

  @override

  // Future<void> onSave() async {
  //   final bool isValid = formKey.currentState?.validate() ?? false;
  //   if (!isValid) {
  //     return;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
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
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(40.0)),
                      border:
                          Border.all(color: const Color(0xff0a2d40), width: 2),
                      image: const DecorationImage(
                        image: AssetImage(
                          "asset/images/logo4.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // color: Colors.black,

                    // color: Colors.black12,
                  ),
                ),
                spacerH12,
                Center(
                  child: Text(
                    "register_to_continue".tr(),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                spacerH20,
                CustomTextField(
                    hint: "name_hint".tr(),
                    prefixIcon: Icons.person,
                    myController: nameController),
                spacerH20,
                CustomTextField(
                  hint: "email_hint".tr(),
                  prefixIcon: Icons.email_outlined,
                  myController: emailController,
                  onSaved: (String? value) {
                    // print("onSaved value is : $value");
                  },
                  validator: (String? value) {
                    return (value != null &&
                            AppConst.emailRegExp.hasMatch(value))
                        ? null
                        : "error_@".tr();
                  },
                ),
                spacerH20,
                CustomTextField(
                  hint: "password_hint".tr(),
                  prefixIcon: Icons.lock,
                  myController: passwordController,
                  validator: (String? value) {
                    return (value!.isEmpty || value.length <= 4)
                        ? "should_be_less_that_4_character".tr()
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
                BlocBuilder<AuthCubit, AuthStates>(
                  builder: (context, state) {
                    return SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          /////////////////////////////////////////////////////////////////////
                          //send create user to Fire Base
                          context.read<AuthCubit>().createUser(
                                formKey: formKey,
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              );
                          AppSnackBar.success(context);
                          Navigator.pushNamed(context, LoginView.id);
                        },
                        child: Text(
                          "register".tr(),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    );
                  },
                ),
                spacerH20,
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "do_not_have_account".tr(),
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, HomeView.id);
                    },
                    child: Text(
                      " Login".tr(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
