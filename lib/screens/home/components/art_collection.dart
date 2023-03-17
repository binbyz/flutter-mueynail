import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:mueynail/app/http/api.dart';
import 'package:mueynail/app/models/shop/art_model.dart';
import 'package:mueynail/screens/home/art_collection_screen.dart';
import 'package:mueynail/screens/home/components/art_detail_modal.dart';

class ArtCollection extends StatefulWidget {
  const ArtCollection({Key? key}) : super(key: key);

  @override
  State<ArtCollection> createState() => _ArtCollectionState();
}

class _ArtCollectionState extends State<ArtCollection> {
  late Future<List<ArtModel>> _artList;

  @override
  void initState() {
    super.initState();
    _artList = fetchArtCollection();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _artList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: [
              SizedBox(
                height: 200,
                child: InfiniteCarousel.builder(
                  itemCount: snapshot.data!.length,
                  itemExtent: 200,
                  loop: true,
                  anchor: 0.0,
                  velocityFactor: 0.2,
                  itemBuilder: (context, index, realIndex) {
                    return makeCarouselItem(
                        context: context, art: snapshot.data![index]);
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ArtCollectionScreen()),
                    );
                  },
                  child: const Icon(Icons.more_horiz_rounded),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget makeCarouselItem(
      {required BuildContext context, required ArtModel art}) {
    return GestureDetector(
      onTap: () {
        showArtDetailModal(context, art);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(art.files.mainImage.fullUrl,
                  fit: BoxFit.cover, height: 200),
            ),
            Positioned(
              right: 5,
              top: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                ),
                child: Text(art.name,
                    style: const TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
