import 'package:flutter/material.dart';
import 'package:mueynail/app/models/shop/shop_model.dart';
import 'package:mueynail/app/storage/plain_storage.dart';
import 'package:mueynail/constants/style.dart';

class HomeAppBar extends StatefulWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeAppBarState extends State<HomeAppBar> {
  String _shopName = '';
  String _shopAddress = '';


  @override
  void initState() {
    super.initState();

    _loadShopNameAndAddress();
  }

  void _loadShopNameAndAddress() async {
    final ShopModel shop = await PlainStorage().getShopNameAndAddress();

    setState(() {
      _shopName = shop.name;
      _shopAddress = shop.address;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      titleTextStyle: brandTextStyle.copyWith(fontSize: 18),
      title: Column(
        children: [
          Text(_shopName, style: brandTextStyle.copyWith(fontSize: 18)),
          Text(_shopAddress, style: summaryTextStyle.copyWith(fontWeight: FontWeight.w300)),
        ],
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/shop/choose');
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
            child: Text('샵 선택', style: summaryTextStyle.copyWith(color: Colors.black54, fontWeight: FontWeight.w500)),
          ),
        ),
      ),
    );
  }
}
