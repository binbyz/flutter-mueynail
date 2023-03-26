import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mueynail/app/http/server_http.dart';
import 'package:mueynail/app/models/user/user_token_model.dart';
import 'package:mueynail/app/storage/plain_storage.dart';
import 'package:mueynail/app/storage/secure_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Nail Than Yesterday,',
                        style: TextStyle(
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF9E9E9E),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '모두의 네일',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF424242),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '이메일',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF424242),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '이메일을 입력해주세요',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                      ),
                      // TextField password
                      const SizedBox(height: 20),
                      const Text(
                        '비밀번호',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF424242),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '비밀번호를 입력해주세요',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                      ),
                      // login button
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            _login(context);
                          },
                          child: const Text('로그인'),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                          ),
                          child: const Text('회원가입'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _login(BuildContext context) async {
    if (_email == null || _email!.isEmpty) {
      Fluttertoast.showToast(msg: '이메일을 입력해주세요.', backgroundColor: Colors.red);
      return;
    }

    if (_password == null || _password!.isEmpty) {
      Fluttertoast.showToast(msg: '비밀번호를 입력해주세요.', backgroundColor: Colors.red);
      return;
    }

    int? setShopId = await PlainStorage().getSetShopId();

    UserTokenModel tokenModel = await ServerHttp().fetchLogin(_email!, _password!);

    if (tokenModel.token.isNotEmpty && tokenModel.user.email == _email) {
      bool result = await SecureStorage().setToken(tokenModel);
      String routeName = '/home';

      if (setShopId == null) {
        routeName = '/shop/choose';
      }

      Navigator.of(context).pushReplacementNamed(routeName);
    } else {
      Fluttertoast.showToast(msg: '잠시 후 다시 시도해주세요.');
    }
  }
}
