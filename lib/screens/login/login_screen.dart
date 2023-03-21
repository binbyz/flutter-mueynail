import 'package:flutter/material.dart';
import 'package:mueynail/app/http/api.dart';
import 'package:mueynail/app/models/shop/shop_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<ShopModel> _shops = [];
  int? _selectedShopId = null;

  @override
  void initState() {
    super.initState();

    fetchShop().then(
      (value) => setState(() {
        print(value);
        _shops = value;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      '매장',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF424242),
                      ),
                    ),
                    const SizedBox(height: 5),
                    DropdownButton(
                      isExpanded: true,
                      value: _selectedShopId,
                      items: _shops.map((shop) {
                        return DropdownMenuItem(
                          value: shop.id,
                          child: Row(
                            children: [
                              Text(shop.name, style: const TextStyle(color: Colors.black, fontSize: 14)),
                              Text(' (${shop.address})', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedShopId = value as int;
                        });
                      },
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      '아이디',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF424242),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '아이디를 입력해주세요',
                      ),
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
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '비밀번호를 입력해주세요',
                      ),
                    ),
                    // login button
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('로그인'),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                        },
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
    );
  }
}
