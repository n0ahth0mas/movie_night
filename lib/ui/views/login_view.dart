import 'package:flutter/material.dart';
import 'package:movie_night/core/enums.dart';
import 'package:movie_night/core/viewmodels/login_model.dart';
import 'package:movie_night/ui/views/base_view.dart';
import 'package:movie_night/ui/widgets/login_header.dart';

class LoginView extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
        builder: (context, model, child) => Scaffold(
            body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginHeader(
                validationMessage: model.errorMessage,
                controller: controller),
              model.state == ViewState.Busy
                  ? CircularProgressIndicator()
                  : FlatButton(
                      color: Colors.white,
                      child:
                          Text('Login', style: TextStyle(color: Colors.black)),
                      onPressed: () async {
                        var loginSuccess = await model.login(controller.text);
                        if (loginSuccess) {
                          Navigator.pushNamed(context, 'home');
                        }
                      },
                    )
            ],
          ),
        ),
      );
  }
}