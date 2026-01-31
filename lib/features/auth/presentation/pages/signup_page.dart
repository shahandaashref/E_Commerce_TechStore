// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:e_commerce/features/auth/presentation/widgets/continue_with_google.dart';
import 'package:e_commerce/features/auth/presentation/widgets/have_or_have_not_account.dart';
import 'package:e_commerce/features/auth/presentation/widgets/logo.dart';
import 'package:e_commerce/features/auth/presentation/widgets/or_divider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/core/widgets/custom_bottom.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/l10n/app_localizations.dart';

class SignupPage extends StatefulWidget {
  bool  iAgree;
  SignupPage({
    super.key,
     this.iAgree=false,
  });

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context);
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(ECommerceAppTheme.md),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Logo(),
                SizedBox(height: 20,),
                Text(localization!.createAccount, style: theme.textTheme.displayLarge),
                Text(localization.createAccountSubtitle, style: theme.textTheme.bodyMedium),
                SizedBox(height: 20),
                CustomTextFormField(
                  controller: _fullNameController,
                  hintText: localization.userName,
                  labelText: localization.fullName,
                  icon: Icon(Icons.person_outline),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  controller: _emailController,
                  hintText: localization.emailhint,
                  labelText: localization.email,
                  icon: Icon(Icons.email_outlined),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    //todo: add more complex email validation if needed
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  controller: _passwordController,
                  hintText: '********',
                  labelText: localization.password,
                  icon: Icon(Icons.lock_outlined),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  controller: _confirmPasswordController,
                  hintText: "********",
                  labelText: localization.confirmPassword,
                  icon: Icon(Icons.lock_outlined),
                  validator: (value) {
                    //todo: add password match validation
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Checkbox(
                      value: widget.iAgree, onChanged: (value) {
                      setState(() {
                        widget.iAgree = value!;
                      });
                    }),
                    Text.rich(
                      TextSpan(
                        text: "I agree to the Terms of Service and Privacy Policy",
                        style: theme.textTheme.bodySmall,
                      ),
                      
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: CustomBottom(
                    text: localization.signupButton,
                    
                    onPressed: () async {

                       try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );

                      print("Account Created!");
                      Navigator.pop(context);
                    } on FirebaseAuthException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error: ${e.message}")),
                      );
                    }
                      
                    },
                  ),
                ),
            SizedBox(height: 20),
                // or continue with 
                OrDivider(),
                SizedBox(height: 20),
                ContinueWithGoogle(),
                SizedBox(height: 20,),
                HaveOrHaveNotAcount(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  text: localization.haveAccount,
                  tapText: localization.login,
                ), 
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
