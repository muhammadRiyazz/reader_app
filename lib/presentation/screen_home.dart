import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reader_app/infrastructur/get_number.dart';
import 'package:reader_app/presentation/widgets/mianbutton.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  bool scanning = false;
  String extractText = '';
  File? pickedImage;
  final TextRecognizer textRecognizer = TextRecognizer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Scanner'),),
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 238, 238, 238),
                        offset: Offset(0.0, 2.0), // (x, y)
                        blurRadius: 150.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Center(
                            child: Icon(
                          Icons.document_scanner_outlined,
                          size: 166,
                          weight: 33,
                        )),
                        MainButton(
                          ontap: () async {
                            setState(() {
                              scanning = true;
                            });
                            XFile? image = await ImagePicker()
                                .pickImage(source: ImageSource.camera);

                            if (image == null) {
                              setState(() {
                                scanning = false;
                              });
                            } else {
                              final File file = File(image.path);
                              final inputimage = InputImage.fromFile(file);
                              final RecognizedText text =
                                  await textRecognizer.processImage(inputimage);
                              extractText = getnumber(text: text.text);
                            }

                            setState(() {
                              scanning = false;
                            });
                          },
                          title: 'Scan Image',
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
SizedBox(height: 20,)   ,       scanning == true
                ? const Center(child: LinearProgressIndicator())
                : Center(
                    child: Text(
                      extractText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    ));
  }
}
