import 'package:flutter/material.dart';
import 'package:mueynail/app/http/server_http.dart';
import 'package:mueynail/app/models/shop/art_model.dart';
import 'package:mueynail/screens/components/common_app_bar.dart';
import 'package:mueynail/screens/home/components/art_detail_modal.dart';

class ArtCollectionScreen extends StatefulWidget {
  const ArtCollectionScreen({Key? key}) : super(key: key);

  @override
  State<ArtCollectionScreen> createState() => _ArtCollectionScreenState();
}

class _ArtCollectionScreenState extends State<ArtCollectionScreen> {
  late Future<List<ArtModel>> _artList;

  @override
  void initState() {
    super.initState();
    _artList = ServerHttp().fetchArtList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: '아트 컬렉션'),
      body: FutureBuilder<List<ArtModel>>(
        future: _artList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                crossAxisCount: 3,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showArtDetailModal(context, snapshot.data![index]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          snapshot.data![index].files.mainImage.fullUrl),
                    )),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
