import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:e_commerce/features/auth/presentation/widgets/continue_with_google.dart';
import 'package:e_commerce/core/widgets/custom_bottom.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/features/auth/presentation/widgets/have_or_have_not_account.dart';
import 'package:e_commerce/features/auth/presentation/widgets/logo.dart';
import 'package:e_commerce/features/auth/presentation/widgets/or_divider.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ECommerceAppTheme.md),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Logo(),
              SizedBox(height: 20),
              Text(localization!.welcomeBack, style: theme.textTheme.displayLarge),
              Text(
                localization.welcomeBackSubtitle,
                style: theme.textTheme.bodyMedium,
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
                  // You can add more complex email validation here if needed
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
              
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    //todo: implement forgot password
                  },
                  child: Text(localization.forgotPassword,style: theme.textTheme.headlineSmall,),
                ),
              ),
              SizedBox(height: 20),
          
              Center(
                child: CustomBottom(
                  text: localization.loginButton,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
              ),
          
              //or continue with
              SizedBox(height: 20),
              OrDivider(),
              SizedBox(height: 20),
              //continue with google button
              Center(
                child: ContinueWithGoogle(),
              ),
          
              SizedBox(height: 20),
            HaveOrHaveNotAcount(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/register');
                },
                text: localization.noAccount,
                tapText: localization.signUp,
              ), 
              
            ],
          ),
        ),
      ),
    );
  }
}



