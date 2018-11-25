import 'package:flutter/material.dart';
import 'provider.dart';
import 'Bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: new EdgeInsets.all(20.0),
      child: new Column(
        children: <Widget>[
          emailAddress(bloc),
          password(bloc),
          Container(
            margin: new EdgeInsets.only(bottom: 20.0),
          ),
          button(bloc),
        ],
      ),
    );
  }

  Widget emailAddress(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return new TextField(
          onChanged: (value) {
            bloc.changeEmail(value);
          },
          keyboardType: TextInputType.emailAddress,
          decoration: new InputDecoration(
            labelText: "Email Address",
            hintText: "you@example.com",
            prefixIcon: Icon(Icons.email),
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget password(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return new TextField(
          onChanged: (value) {
            bloc.changePassword(value);
          },
          keyboardType: TextInputType.text,
          decoration: new InputDecoration(
            labelText: "Password",
            prefixIcon: new Icon(Icons.lock_outline),
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget button(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submit,
      builder: (context, snapshot) {
        return new RaisedButton.icon(
          onPressed: snapshot.hasData ? bloc.submitted: null,
          color: Colors.redAccent,
          icon: new Icon(Icons.directions_walk),
          label: new Text(
            "Login",
            style: new TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}
