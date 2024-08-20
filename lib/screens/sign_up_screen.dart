import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_api/cubit/user_cubit.dart';
import 'package:master_api/widgets/already_have_an_account_widget.dart';
import 'package:master_api/widgets/custom_form_button.dart';
import 'package:master_api/widgets/custom_input_field.dart';
import 'package:master_api/widgets/page_header.dart';
import 'package:master_api/widgets/page_heading.dart';
import 'package:master_api/widgets/pick_image_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          child: Form(
            key: context.read<UserCubit>().signUpFormKey,
            child: Column(
              children: [
                const PageHeader(),
                const PageHeading(title: 'Sign-up'),
                //! Image
                const PickImageWidget(),
                const SizedBox(height: 30),
                //! Name
                CustomInputField(
                  hintText: 'Enter Your name',
                  suffixIcon: const Icon(Icons.person),
                  controller: context.read<UserCubit>().signUpName,
                ),
                const SizedBox(height: 20),
                //!Email
                CustomInputField(
                  hintText: 'Enter Your email',
                  suffixIcon: const Icon(Icons.email),
                  controller: context.read<UserCubit>().signUpEmail,
                ),
                const SizedBox(height: 20),
                //! Phone Number
                CustomInputField(
                  hintText: 'Your phone number ex:01234567890',
                  suffixIcon: const Icon(Icons.phone),
                  controller: context.read<UserCubit>().signUpPhoneNumber,
                ),
                const SizedBox(height: 20),
                //! Password
                CustomInputField(
                  hintText: 'Your password',
                  obscureText: true,
                  controller: context.read<UserCubit>().signUpPassword,
                ),
                const SizedBox(height: 20),

                //! Confirm Password
                CustomInputField(
                  hintText: 'Confirm Your password',
                  obscureText: true,
                  controller: context.read<UserCubit>().confirmPassword,
                ),
                const SizedBox(height: 22),
                //!Sign Up Button
                CustomFormButton(
                  innerText: 'Signup',
                  onPressed: () {},
                ),
                const SizedBox(height: 18),
                //! Already have an account widget
                const AlreadyHaveAnAccountWidget(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
