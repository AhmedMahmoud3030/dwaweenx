// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ShareDialogStep2 extends StatelessWidget {
  bool shareTextSelected = false;

  ShareDialogStep2({
    super.key,
    required this.shareTextSelected,
  });

  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    shareTextSelected = true;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                        color: shareTextSelected ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'مشاركة كنص',
                        style: TextStyle(fontFamily: 'Cairo'),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.text_fields),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    shareTextSelected = false;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                        color: !shareTextSelected ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'مشاركة كصورة',
                        style: TextStyle(fontFamily: 'Cairo'),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.image),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            //قائمة الصور
            Visibility(
              visible: !shareTextSelected,
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4, // Replace with the actual number of images
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(),
                        ),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Image.asset(
                            'assets/img/imageShareList$index.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            Screenshot(
              controller: screenshotController,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    //الصورة المختارة
                    Visibility(
                      visible: !shareTextSelected,
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset(
                          'assets/img/imageShareList.jpg',
                          // Replace with actual asset path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'شبكة تراث الفيضة التجارية',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            color: Colors.black54,
                          ),
                        ),

                        Image.asset(
                          'assets/img/splash.png',
                          width: 30,
                          height: 30,
                        ),
                        // Replace with actual asset path
                        const Text(
                          'تطبيق دواوين الشيخ إبراهيم نياس',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                if (shareTextSelected) {
                  shareText();
                } else {
                  captureScreenShot(context);
                }
              },
              child: const Text(
                'مشاركة',
                style: TextStyle(fontFamily: 'Cairo'),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  shareText() async {
    // final box = context.findRenderObject() as RenderBox;
    // await Share.share("\n\n\n\n\n",
    //     subject: "",
    //     sharePositionOrigin:
    //     box.localToGlobal(Offset.zero) &
    //     box.size);
  }

  //التقاط الصورة
  void captureScreenShot(BuildContext context) async {
    final directory = await getTemporaryDirectory();
    Uint8List? imageBytes = await screenshotController.capture();
    String dateTime = DateTime.now().year.toString() +
        DateTime.now().month.toString() +
        DateTime.now().day.toString() +
        DateTime.now().hour.toString() +
        DateTime.now().minute.toString() +
        DateTime.now().second.toString();
    String filePath = '${directory.path}/screenshot$dateTime.png';
    await File(filePath).writeAsBytes(imageBytes!);
    // File tempFile = File(filePath);
    await Share.shareXFiles([XFile(filePath)], text: '', subject: '');
    // saveImageToGallery(context,imageBytes);
  }
}
