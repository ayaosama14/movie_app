
import 'package:flutter/material.dart';


import '../../../../utils/app_style.dart';
import '../../../../utils/spacer.dart';
import '../../../home_fetcher/presentation/views/home_view.dart';
import '../widgets/text_form_field.dart';
import 'login_view.dart';

class RegisterView extends StatefulWidget {
  static const String id = 'register_view';

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isSecured = true;
  bool isLoading = false;
  @override
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // Regex Reguler experission

  //on save method
  Future<void> onSave() async {
    final bool isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
  }

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
              const Center(
                child: Text(
                  "Register to continue",
                  style: AppStyle.thinTextStyle16,
                ),
              ),
              spacerH20,
              CustomTextField(hint: "name", prefixIcon: Icons.person),
              spacerH20,
              CustomTextField(
                hint: 'email',
                prefixIcon: Icons.email_outlined,
                myController: emailController,
                onSaved: (String? value) {
                  print("onSaved value is : $value");
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? null
                      : 'Oops! end with @ char.com';
                },
              ),
              spacerH20,
              CustomTextField(
                hint: 'password',
                prefixIcon: Icons.lock,
                myController: passwordController,
                validator: (String? value) {
                  return (value!.isEmpty || value.length <= 4)
                      ? 'should be less that 4 charachter'
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
                  },
                  child: const Text(
                    "Register",
                    style: AppStyle.thinColorTextStyle16,
                  ),
                ),
              ),
              spacerH20,
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  'Don\'t have account? ',
                  style: AppStyle.thinTextStyle16,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, LoginView.id);
                  },
                  child: const Text(
                    ' Login',
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
//.bat configure