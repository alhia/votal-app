import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:votal_app/ui/shared/app_colors.dart';
import 'package:votal_app/ui/shared/ui_helpers.dart';

class AuthenticationLayout extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? mainButtonTitle;
  final Widget? form;
  final bool showTermsText;
  final void Function()? onMainButtonTapped;
  final void Function()? onCreateAccountTapped;
  final void Function()? onForgotPassword;
  final void Function()? onBackPressed;
  final void Function()? onSignInWithFacebook;
  final void Function()? onSignInWithGoogle;
  final String? validationMessage;
  final bool busy;

  const AuthenticationLayout({
    Key? key,
    this.title,
    this.subtitle,
    this.mainButtonTitle,
    this.form,
    this.onMainButtonTapped,
    this.onCreateAccountTapped,
    this.onForgotPassword,
    this.onBackPressed,
    this.onSignInWithFacebook,
    this.onSignInWithGoogle,
    this.validationMessage,
    this.showTermsText = false,
    this.busy = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        children: [
          if (onBackPressed == null) verticalSpaceLarge,
          if (onBackPressed != null) verticalSpaceRegular,
          if (onBackPressed != null)
            IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: onBackPressed,
            ),
          Center(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.deepPurpleAccent[200],
              ),
              child: Icon(Icons.music_note, size: 32),
            ),
          ),
          verticalSpaceSmall,
          Center(
            child: Text(
              title!,
              style: theme.primaryTextTheme.headline4,
            ),
          ),
          verticalSpaceSmall,
          Center(
            child: SizedBox(
              width: screenWidthPercentage(context, percentage: 0.8),
              child: Text(
                subtitle!,
                style: theme.primaryTextTheme.subtitle1,
              ),
            ),
          ),
          verticalSpaceMedium,
          form!,
          verticalSpaceRegular,
          if (onForgotPassword != null)
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: onForgotPassword,
                child: Text(
                  'Forgot your password?',
                ),
              ),
            ),
          verticalSpaceRegular,
          if (validationMessage != null)
            Text(
              validationMessage!,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          if (validationMessage != null) verticalSpaceRegular,
          TextButton(
            onPressed: onMainButtonTapped,
            child: busy
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  )
                : Text(
                    mainButtonTitle!,
                  ),
          ),
          verticalSpaceRegular,
          if (onCreateAccountTapped != null)
            GestureDetector(
              onTap: onCreateAccountTapped,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  horizontalSpaceTiny,
                  Text(
                    'Create an account',
                    style: TextStyle(),
                  )
                ],
              ),
            ),
          if (showTermsText)
            Text(
              'By signing up you agree to our terms, conditions and privacy policy.',
              textAlign: TextAlign.center,
            ),
          verticalSpaceRegular,
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration:
                  BoxDecoration(color: theme.primaryColor.withOpacity(0.1)),
              child: Text(
                'Or continue with',
                style:
                    theme.textTheme.caption!.copyWith(color: AppColors.purple),
              ),
            ),
          ),
          verticalSpaceRegular,
          FacebookAuthButton(
            onPressed: onSignInWithFacebook ?? () {},
            // darkMode: true,
            text: 'CONTINUE WITH FACEBOOK',
            style: AuthButtonStyle(
              iconSize: 24,
              height: 50,
              textStyle: TextStyle(color: Colors.white),
              buttonType: AuthButtonType.secondary,
            ),
          ),
          verticalSpaceRegular,
          GoogleAuthButton(
            onPressed: onSignInWithGoogle ?? () {},
            text: 'CONTINUE WITH GOOGLE',
            style: AuthButtonStyle(
              buttonColor: Color(0xff4285F4),
              iconSize: 24,
              iconBackground: Colors.white,
              buttonType: AuthButtonType.secondary,
              height: 50,
              textStyle: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
