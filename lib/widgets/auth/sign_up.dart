import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/theme/arava_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class SignUp extends StatefulWidget {
  final VoidCallback onLoginButtonTapped;

  const SignUp({Key key, this.onLoginButtonTapped}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpState();
}


class _SignUpState extends State<SignUp> with AutomaticKeepAliveClientMixin {
  static final String _kEmailFormAttribute = "email";
  static final String _kPasswordFormAttribute = "password";
  static final String _kFirstNameFormAttribute = "firstName";
  static final String _kLastNameFormAttribute = "lastName";

  final GlobalKey<FormBuilderState> _formKey = GlobalKey();

  bool _isPasswordTextObscure = true;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    EdgeInsets safeAreaPadding = MediaQuery.of(context).padding;
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: screenSize.height - safeAreaPadding.top - safeAreaPadding.bottom - (2 * kToolbarHeight),
          child: FormBuilder(
            autovalidate: false,
            key: _formKey,
            child: Column(
              children: <Widget>[
                Expanded(child: Container()),
                Image.asset(AravaAssets.Logo, height: 96),
                Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    AppLocalizations.of(context).auth_SignUpTitle(),
                    style: Theme
                      .of(context)
                      .textTheme
                      .display1
                      .copyWith(color: Theme.of(context).primaryColor)
                  ),
                ),
                Text(
                  AppLocalizations.of(context).auth_SignUpSubtitle(),
                  style: Theme
                    .of(context)
                    .textTheme
                    .display2
                    .copyWith(fontSize: 20)
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(right: 6),
                          child: FormBuilderTextField(
                            attribute: _kFirstNameFormAttribute,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                ),
                              ),
                              labelText: AppLocalizations.of(context).auth_EmailFieldPlaceholder(),
                            ),
                            validators: [
                              FormBuilderValidators.required(
                                errorText: AppLocalizations.of(context).general_RequiredField()
                              ),
                              FormBuilderValidators.email(
                                errorText: AppLocalizations.of(context).auth_InvalidEmailErrorMessage()
                              )
                            ],
                          )
                        ),
                      ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(left: 6),
                          child: FormBuilderTextField(
                            attribute: _kLastNameFormAttribute,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                ),
                              ),
                              labelText: AppLocalizations.of(context).auth_EmailFieldPlaceholder(),
                            ),
                            validators: [
                              FormBuilderValidators.required(errorText: AppLocalizations.of(context).general_RequiredField()),
                              FormBuilderValidators.email(errorText: AppLocalizations.of(context).auth_InvalidEmailErrorMessage())
                            ],
                          )
                        )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: FormBuilderTextField(
                    attribute: _kEmailFormAttribute,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.5,
                        ),
                      ),
                      labelText: AppLocalizations.of(context).auth_EmailFieldPlaceholder(),
                    ),
                    validators: [
                      FormBuilderValidators.required(errorText: AppLocalizations.of(context).general_RequiredField()),
                      FormBuilderValidators.email(errorText: AppLocalizations.of(context).auth_InvalidEmailErrorMessage())
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: FormBuilderTextField(
                    attribute: _kPasswordFormAttribute,
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: AppLocalizations.of(context).auth_PasswordFieldPlaceholder(),
                      suffixIcon: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          this._isPasswordTextObscure ?
                          Icons.visibility :
                          Icons.visibility_off
                        ),
                        onPressed: this._togglePasswordObscureText,
                      )
                    ),
                    obscureText: this._isPasswordTextObscure,
                    validators: [
                      FormBuilderValidators.required(errorText: AppLocalizations.of(context).general_RequiredField())
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)
                        ),
                        textColor: Theme.of(context).primaryColor,
                        onPressed: this.widget.onLoginButtonTapped,
                        child: Text(AppLocalizations.of(context).auth_LoginTitle()),
                      ),
                      FlatButton(
                        colorBrightness: Brightness.dark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)
                        ),
                        color: Theme.of(context).primaryColor,
                        onPressed: _signUp,
                        child: Text(AppLocalizations.of(context).auth_SignUpTitle()),
                      )
                    ],
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordObscureText() {
    this.setState(() => this._isPasswordTextObscure = !this._isPasswordTextObscure);
  }

  void _signUp() {
  }
}