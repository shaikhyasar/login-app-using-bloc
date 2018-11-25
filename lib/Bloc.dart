import 'dart:async';
import 'package:rxdart/rxdart.dart';


class Bloc {

  final _emailController = new BehaviorSubject<String>();
  final _passwordController = new BehaviorSubject<String>();

    Function(String)  get changeEmail => _emailController.sink.add;

    Function(String)  get changePassword => _passwordController.sink.add;

  Stream<String>   get password => _passwordController.stream.transform(validatePassword);

  Stream<String>   get email => _emailController.stream.transform(validateEmail);

  Stream<bool> get submit => Observable.combineLatest2(email, password, (email , pass) =>true);



  final validateEmail = new StreamTransformer<String,String>.fromHandlers(
    handleData: (emailData , sink) {
      if(emailData.contains('@') && emailData.contains('.com')) {
        sink.add(emailData);
      }
      else {
        sink.addError('Please enter a valid email');
      }
    }
  );

  final validatePassword = new StreamTransformer<String,String>.fromHandlers(
      handleData: (passwordData ,sink) {
        if(passwordData.length > 6 ) {
          sink.add(passwordData);
        }
        else {
          sink.addError('Password should be more than 6 character');
        }
      }
  );

  submitted() {
    final _email = _emailController.value;
    final _password = _passwordController.value;

    print(_email);
    print(_password);
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }

}