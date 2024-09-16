import 'package:flutter/material.dart';
import 'package:furniture_app/theme.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  late FToast fToast;
  bool _isObscured = true;
  bool isShowPasswordError = false;
  bool isRememberMe = false;
  bool isLoading = false;

  final emailController = TextEditingController(text: '');

  final passwordController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            children: [
          title(),
          emailinput(),
          passwordInput(),
          CheckBoxButton(),
          loginButton(),
          or(),
          loginWithGoogle(),
          registerButton(),
        ]));
  }

  Widget or() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 24,
        bottom: 21,
      ),
      child: Text(
        'OR',
        style: greyTextStyle.copyWith(
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget errorToast() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: kRedColor, borderRadius: BorderRadius.circular(16)),
      child: Text(
        'Password Salah',
        style: kWhiteTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget loginWithGoogle() {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          bottom: 48,
        ),
        child: TextButton(
            onPressed: () {},
            child: Text(
              'Login With Google',
              style: blackTextStyle.copyWith(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            )));
  }

  Widget registerButton() {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          bottom: 48,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an acoount ?',
              style: greyTextStyle.copyWith(
                fontSize: 15,
                fontWeight: light,
              ),
              textAlign: TextAlign.center,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Register',
                  style: kBlueTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: semibold,
                  ),
                  textAlign: TextAlign.center,
                )),
          ],
        ));
  }

  Widget title() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Login to your\naccount',
            style: blackTextStyle.copyWith(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: 87,
                height: 4,
                margin: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  color: kBlackColor,
                  borderRadius: BorderRadius.circular(
                    4,
                  ),
                ),
              ),
              Container(
                width: 8,
                height: 4,
                decoration: BoxDecoration(
                  color: kBlackColor,
                  borderRadius: BorderRadius.circular(
                    4,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget passwordInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 32),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: kWhiteGreyColor,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: passwordController,
                  obscureText: _isObscured,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Password',
                    hintStyle: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              ),
            ],
          ),
        ),
        if (isShowPasswordError)
          Container(
            margin: const EdgeInsets.only(
              top: 8,
            ),
            child: Text(
              'Password kamu salah',
              style: kRedTextStyle,
            ),
          )
      ],
    );
  }

  Widget emailinput() {
    return Container(
      margin: const EdgeInsets.only(top: 48),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: kWhiteGreyColor,
      ),
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration.collapsed(
          hintText: 'Email',
          hintStyle: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semibold,
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return Container(
      height: 56,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: kBlackColor,
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            isLoading = true;
          });

          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              isLoading = false;
            });
            if (passwordController.text != '123123') {
              setState(() {
                isShowPasswordError = true;
              });
              fToast.showToast(
                child: errorToast(),
                toastDuration: const Duration(seconds: 3),
                gravity: ToastGravity.BOTTOM,
              );
            } else {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/homepage',
                (route) => false,
              );
            }
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? CircularProgressIndicator(
                    color: kWhiteColor,
                    backgroundColor: kGreyColor,
                  )
                : Text(
                    'Login',
                    style: kWhiteTextStyle.copyWith(
                        fontSize: 18, fontWeight: semibold),
                  ),
          ],
        ),
      ),
    );
  }

  Widget CheckBoxButton() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          child: CheckboxMenuButton(
            value: isRememberMe,
            onChanged: (bool? value) {
              setState(() {
                isRememberMe = value!;
              });
            },
            child: const Text('Remember me'),
          ),
        )
      ],
    );
  }
}
