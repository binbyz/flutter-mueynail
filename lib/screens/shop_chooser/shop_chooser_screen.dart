import 'package:flutter/material.dart';
import 'package:mueynail/app/http/server_http.dart';
import 'package:mueynail/app/models/shop/shop_model.dart';
import 'package:mueynail/app/storage/plain_storage.dart';
import 'package:mueynail/screens/components/common_app_bar.dart';

class ShopChooserScreen extends StatefulWidget {
  const ShopChooserScreen({Key? key}) : super(key: key);

  @override
  State<ShopChooserScreen> createState() => _ShopChooserScreenState();
}

class _ShopChooserScreenState extends State<ShopChooserScreen> {
  @override
  Widget build(BuildContext context) {
    // PlainStorage().getShopList().then((value) {
    //   print(value);
    // });

    return Scaffold(
      appBar: const CommonAppBar(title: '샵 선택하기'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            FutureBuilder<List<ShopModel>>(
              future: ServerHttp().fetchShopList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          PlainStorage().setShop(
                            snapshot.data![index].id,
                            snapshot.data![index].name,
                            snapshot.data![index].address,
                          ).then((_) {
                            Navigator.of(context).pushReplacementNamed('/home');
                          });
                        },
                        child: ListTile(
                          title: Text(snapshot.data![index].name),
                          subtitle: Text(snapshot.data![index].address),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
