import 'package:arava/model/user/user.dart';
import 'package:arava/service/session.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:arava/blocs/profile/profile_bloc.dart';
import 'package:arava/blocs/profile/state/profile_state.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/model/update_profile_request/update_profile_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';


class Profile extends StatefulWidget {

  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  static final String _kEmailFormAttribute = "email";
  static final String _kCurrentPasswordFormAttribute = "currentPassword";
  static final String _kNewPasswordFormAttribute = "newPassword";
  static final String _kFirstNameFormAttribute = "firstName";
  static final String _kLastNameFormAttribute = "lastName";

  final ProfileBloc _profileBloc = Modular.get();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey();
  final User _user = Modular.get<Session>().cachedUser;

  bool _isPasswordTextObscure = true;
  bool _isNewPasswordTextObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).more_Profile()),
        centerTitle: true,
        actions: <Widget>[
          BlocBuilder<ProfileBloc, ProfileState>(
            bloc: _profileBloc,
            builder: (context, state) => IconButton(
              icon: Icon(Icons.check),
              onPressed: state.whenOrElse(
                profileUpdateLoadingState: (loadingState) => null,
                orElse: (_) => _submit
              ),
            ),
          )
        ],
      ),
      body: BlocListener<ProfileBloc, ProfileState>(
        bloc: _profileBloc,
        listener: (context, state) {
          state.whenPartial(
            profileUpdateSuccessState: (successState) => FlushbarHelper.createSuccess(
              message: AppLocalizations.of(context).profile_ProfileUpdateSuccessful()
            )..show(context)
          );
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
          bloc: _profileBloc,
          builder: (context, state) {
            return SingleChildScrollView(
              child: FormBuilder(
                autovalidate: false,
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: Container(
                          width: 96, height: 96,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor.withOpacity(0.2),
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 0.5
                            ),
                            borderRadius: BorderRadius.circular(48)
                          ),
                          child: Center(
                            child: Text(
                              "${_user.firstName.substring(0, 1).toUpperCase()}"
                                "${_user.lastName.substring(0, 1).toUpperCase()}",
                              style: Theme
                                .of(context)
                                .textTheme
                                .display1
                                .copyWith(color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.only(right: 6),
                              child: FormBuilderTextField(
                                initialValue: _user.firstName,
                                attribute: _kFirstNameFormAttribute,
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 0.5,
                                    ),
                                  ),
                                  labelText: AppLocalizations.of(context).auth_FirstNameFieldPlaceholder(),
                                ),
                                validators: [
                                  FormBuilderValidators.required(
                                    errorText: AppLocalizations.of(context).general_RequiredField()
                                  ),
                                ],
                              )
                            ),
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.only(left: 6),
                              child: FormBuilderTextField(
                                initialValue: _user.lastName,
                                attribute: _kLastNameFormAttribute,
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 0.5,
                                    ),
                                  ),
                                  labelText: AppLocalizations.of(context).auth_LastNameFieldPlaceholder(),
                                ),
                                validators: [
                                  FormBuilderValidators.required(
                                    errorText: AppLocalizations.of(context).general_RequiredField()
                                  )
                                ],
                              )
                            )
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: FormBuilderTextField(
                        initialValue: _user.email,
                        attribute: _kEmailFormAttribute,
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: AppLocalizations.of(context).auth_EmailFieldPlaceholder(),
                        ),
                        validators: [
                          FormBuilderValidators.email(
                            errorText: AppLocalizations.of(context).auth_InvalidEmailErrorMessage()
                          ),
                          FormBuilderValidators.required(
                            errorText: AppLocalizations.of(context).general_RequiredField()
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: FormBuilderTextField(
                        attribute: _kCurrentPasswordFormAttribute,
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: AppLocalizations.of(context).profile_CurrentPasswordFieldPlaceholder(),
                          suffixIcon: IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              _isPasswordTextObscure ?
                              Icons.visibility :
                              Icons.visibility_off
                            ),
                            onPressed: _togglePasswordObscureText,
                          )
                        ),
                        obscureText: _isPasswordTextObscure,
                        validators: [
                          FormBuilderValidators.required(
                            errorText: AppLocalizations.of(context).general_RequiredField()
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: FormBuilderTextField(
                        attribute: _kNewPasswordFormAttribute,
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: AppLocalizations.of(context).profile_NewPasswordFieldPlaceholder(),
                          suffixIcon: IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              _isNewPasswordTextObscure ?
                              Icons.visibility :
                              Icons.visibility_off
                            ),
                            onPressed: _toggleNewPasswordObscureText,
                          )
                        ),
                        obscureText: _isNewPasswordTextObscure,
                      ),
                    ),
                    state.whenOrElse(
                      profileUpdateFailedState: (failingState) => Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: Container(
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
                            child: Text(failingState.exception.getLocalizedMessage(context)),
                          )
                        ),
                      ),
                      orElse: (_) => Container()
                    )
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  void _togglePasswordObscureText() {
    setState(() {
      _isPasswordTextObscure = !_isPasswordTextObscure;
    });
  }

  void _toggleNewPasswordObscureText() {
    setState(() {
      _isNewPasswordTextObscure = !_isNewPasswordTextObscure;
    });
  }

  void _submit() {
    if (!_formKey.currentState.saveAndValidate()) {
      return;
    }
    final values = _formKey.currentState.value;
    final String email = values[_kEmailFormAttribute];
    final String firstName = values[_kFirstNameFormAttribute];
    final String lastName = values[_kLastNameFormAttribute];
    final String password = values[_kNewPasswordFormAttribute];
    final String currentPassword = values[_kCurrentPasswordFormAttribute];
    _profileBloc.updateProfile(UpdateProfileRequest(
      email: _stringOrNull(email),
      firstName: _stringOrNull(firstName),
      lastName: _stringOrNull(lastName),
      oldPassword: currentPassword,
      password: _stringOrNull(password)
    ));
  }

  String _stringOrNull(String value) {
    return value.isNotEmpty ? value : null;
  }
}