import 'package:arava/blocs/auth/auth_bloc.dart';
import 'package:arava/blocs/auth/state/auth_state.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/theme/arava_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';


class Login extends StatefulWidget {
  final VoidCallback onSignUpButtonTapped;

  const Login({Key key, this.onSignUpButtonTapped}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginState();
}


class _LoginState extends State<Login> with AutomaticKeepAliveClientMixin {
  static final String _kEmailFormAttribute = "email";
  static final String _kPasswordFormAttribute = "password";

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
          constraints: BoxConstraints(
            minHeight: 600
          ),
          child: FormBuilder(
            autovalidate: false,
            key: _formKey,
            child: BlocBuilder<AuthBloc, AuthState>(
              bloc: Modular.get<AuthBloc>(),
              builder: (context, state) => Column(
                children: <Widget>[
                  Expanded(child: Container()),
                  Image.asset(AravaAssets.Logo, height: 96),
                  Padding(
                    padding: EdgeInsets.all(24),
                    child: Text(
                      AppLocalizations.of(context).auth_LoginTitle(),
                      style: Theme
                        .of(context)
                        .textTheme
                        .display1
                        .copyWith(color: Theme.of(context).primaryColor)
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context).auth_LoginSubtitle(),
                    style: Theme
                      .of(context)
                      .textTheme
                      .display2
                      .copyWith(fontSize: 20)
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: FormBuilderTextField(
                      attribute: _kEmailFormAttribute,
                      keyboardType: TextInputType.emailAddress,
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
                    child: state.whenOrElse(
                      orElse: (_) => Container(),
                      failed: (failedState) => Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).errorColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Theme.of(context).errorColor,
                            width: 0.5
                          )
                        ),
                        child: Text(failedState.exception.getLocalizedMessage(context)),
                      )
                    ) as Widget,
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
                          onPressed: this.widget.onSignUpButtonTapped,
                          child: Text(AppLocalizations.of(context).auth_SignUpTitle()),
                        ),
                        FlatButton(
                          colorBrightness: Brightness.dark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)
                          ),
                          color: Theme.of(context).primaryColor,
                          onPressed: state.whenOrElse(
                            loading: (_) => null,
                            orElse: (anonymousState) => _login
                          ),
                          child: Text(AppLocalizations.of(context).auth_LoginTitle()),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordObscureText() {
    this.setState(() => this._isPasswordTextObscure = !this._isPasswordTextObscure);
  }

  void _login() {
    if (!_formKey.currentState.saveAndValidate()) {
      return;
    }
    final values = _formKey.currentState.value;
    final String email = values[_kEmailFormAttribute];
    final String password = values[_kPasswordFormAttribute];
    Modular.get<AuthBloc>().tryLogin(email, password);
  }
}