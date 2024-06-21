import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:pinkfox/Feature/screen4/presentation/views/widgets/ImageView.dart';
import 'package:pinkfox/core/utils/colors.dart';
import 'package:pinkfox/core/utils/components.dart';
import 'package:pinkfox/core/utils/styles.dart';

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
  bool isloading = false;
  int start = 0;

  Future<void> FerchAssets({required int start}) async {
    print(start);
    images =
        await PhotoManager.getAssetListRange(start: start, end: start + 20);
    assets = images.where((asset) {
      return asset.type == AssetType.image;
    }).toList();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FerchAssets(start: start);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: 16.0, left: 16.0, top: 32.0, bottom: 16.0),
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
                  : Expanded(
                      child: GridView.count(
                        controller: _scrollController,
                        physics: const BouncingScrollPhysics(),
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
                                      navigatorPush(context,
                                          ImageViewer(imageFile: imageFile!));
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
                        start += (assets.length);
                        setState(() {
                          isloading = true;
                        });

                        await FerchAssets(start: start);
                        setState(() {
                          isloading = false;
                        });
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
    );
  }
}
