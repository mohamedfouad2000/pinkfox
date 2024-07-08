import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:pinkfox/Feature/screen4/presentation/views/widgets/ImageView.dart';
import 'package:pinkfox/core/utils/colors.dart';
import 'package:pinkfox/core/utils/components.dart';
import 'package:pinkfox/core/utils/styles.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class Screen4ViewBody extends StatefulWidget {
  const Screen4ViewBody({
    super.key,
  });

  @override
  State<Screen4ViewBody> createState() => _Screen4ViewBodyState();
}

class _Screen4ViewBodyState extends State<Screen4ViewBody> {
  final ScrollController _scrollController = ScrollController();
  List<AssetEntity> assets = [];
  List<AssetEntity> images = [];
  List<File> finalImages = [];

  List<String> filesImage = [
    'assets/images/1n.jpg',
    'assets/images/2n.jpg',
    'assets/images/3n.jpg',
    'assets/images/4n.jpg',
    'assets/images/5n.jpg',
    'assets/images/1p.jpg',
    'assets/images/2p.jpg',
    'assets/images/3p.jpg',
    'assets/images/4p.jpg',
    'assets/images/5p.jpg',
  ];
  bool isloading = false;
  int start = 0;

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);
    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer.asUint8List());
    return file;
  }

  Future<void> FerchAssets({required int start}) async {
    print(start);
    images = await PhotoManager.getAssetListRange(start: start, end: start + 6);
    assets = images.where((asset) {
      return asset.type == AssetType.image;
    }).toList();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('X Is $finalImages');
    // filesImage.forEach((element) async {

    //    final file = File('${(await getTemporaryDirectory()).path}/$element');

    //   finalImages.add(file);
    // });

    FerchAssets(start: start).then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: 16.0, left: 16.0, top: 32.0, bottom: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Gallery",
              style: StylesData.font20,
            ),
            Text(
              "Choose Your Image",
              style: StylesData.fontInter15.copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 16.0,
            ),
            isloading
                ? const Center(child: CircularProgressIndicator())
                : assets.isEmpty
                    ? const Center(child: Text("No Image"))
                    : GridView.count(
                        controller: _scrollController,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 30,
                        padding: const EdgeInsets.all(16),
                        children: List.generate(
                            assets.length,
                            (index) => FutureBuilder(
                                future: assets[index]
                                    .thumbnailData
                                    .then((value) => value!),
                                builder: (context, snap) {
                                  final bytes = snap.data;
                                  if (bytes == null) {
                                    return Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: ColorsData.kSecondColor,
                                        border: Border.all(
                                            color: ColorsData.kSecondColor),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: const Center(
                                          child: CircularProgressIndicator()),
                                    );
                                  }
                                  return InkWell(
                                    onTap: () async {
                                      final File? imageFile =
                                          await assets[index].file;
                                      navigatorPush(
                                          context,
                                          ImageViewer(
                                            imageFile: imageFile!,
                                            // image: '',
                                          ));
                                    },
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: ColorsData.kSecondColor,
                                          border: Border.all(
                                              color: ColorsData.kSecondColor),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          image: DecorationImage(
                                            image: MemoryImage(bytes),
                                            fit: BoxFit.cover,
                                          )),
                                      // Image.memory(
                                      //   bytes,
                                      //   fit: BoxFit.cover,
                                      // )
                                    ),
                                  );
                                })),
                      ),
            isloading
                ? const SizedBox()
                : assets.isEmpty
                    ? const SizedBox()
                    : GridView.count(
                        controller: _scrollController,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 30,
                        padding: const EdgeInsets.all(16),
                        children: List.generate(
                            filesImage.length,
                            (index) => InkWell(
                                  onTap: () async {
                                    // final imageFile = File('${(await getTemporaryDirectory()).path}/${filesImage[index]}');
                                    // final File? imageFile =
                                    //     await assets[index].file;
                                  //   File imageFile = File(filesImage[index]);
                                  
                                  //  print(imageFile);
                                    navigatorPush(
                                        context,
                                        ImageViewer(
                                       
                                          image: filesImage[index],
                                        ));
                                  },
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: ColorsData.kSecondColor,
                                        border: Border.all(
                                            color: ColorsData.kSecondColor),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        image: DecorationImage(
                                          image: AssetImage(filesImage[index]),
                                          fit: BoxFit.cover,
                                        )),
                                    // Image.memory(
                                    //   bytes,
                                    //   fit: BoxFit.cover,
                                    // )
                                  ),
                                )),
                      ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: defaultButton(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                        fun: () async {
                          start -= 20;

                          if (start >= 0) {
                            setState(() {
                              isloading = true;
                            });
                            await FerchAssets(start: start);

                            setState(() {
                              isloading = false;
                            });
                          } else {
                            Navigator.pop(context);
                          }

                          // navigatorPush(context, const Screen3View());
                        },
                        textWidget: Center(
                          child: FittedBox(
                              child: Text(
                            "Back",
                            style: StylesData.font20,
                          )),
                        ),
                        c: ColorsData.kMainColor),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: defaultButton(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        fun: () async {
                          // start += (assets.length);
                          // setState(() {
                          //   isloading = true;
                          // });

                          // await FerchAssets(start: start);
                          // setState(() {
                          //   isloading = false;
                          // });
                          // navigatorPush(context, const Screen3View());
                        },
                        textWidget: isloading
                            ? const Center(child: CircularProgressIndicator())
                            : Center(
                                child: FittedBox(
                                    child: Text(
                                  "Next",
                                  style: StylesData.font20,
                                )),
                              ),
                        c: ColorsData.kMainColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
