// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:e_commerce/features/auth/presentation/widgets/continue_with_google.dart';
import 'package:e_commerce/features/auth/presentation/widgets/have_or_have_not_account.dart';
import 'package:e_commerce/features/auth/presentation/widgets/logo.dart';
import 'package:e_commerce/features/auth/presentation/widgets/or_divider.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/features/auth/presentation/widgets/custom_bottom.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_text_form_field.dart';
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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context);
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(ECommerceAppTheme.md),
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
                hintText: localization.userName,
                labelText: localization.fullName,
                icon: Icon(Icons.person_outline),
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                hintText: localization.emailhint,
                labelText: localization.email,
                icon: Icon(Icons.email_outlined),
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                hintText: '********',
                labelText: localization.password,
                icon: Icon(Icons.lock_outlined),
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                hintText: "********",
                labelText: localization.confirmPassword,
                icon: Icon(Icons.lock_outlined),
              ),
              Row(
                children: [
                  Checkbox(value: widget.iAgree, onChanged: (value) {
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
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'login');
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
    );
  }
}
