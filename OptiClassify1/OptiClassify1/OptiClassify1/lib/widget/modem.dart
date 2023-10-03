import 'dart:convert';
import 'dart:io';

import 'package:OptiClassify/widget/process_complete_page.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import '../classifier/classifier.dart';
import '../styles.dart';
import 'plant_photo_view.dart';
import 'package:http/http.dart' as http;

const _labelsFileName = 'assets/labels.txt';
const _modelFileName = 'Modem_model.tflite';

class Modem extends StatefulWidget {
  static String routeName = '/Modem';

  const Modem({super.key});

  @override
  State<Modem> createState() => _ModemState();
}

enum _ResultStatus {
  notStarted,
  notFound,
  found,
}

class _ModemState extends State<Modem> {
  bool _isAnalyzing = false;
  final picker = ImagePicker();
  File? _selectedImageFile;

  // Result
  _ResultStatus _resultStatus = _ResultStatus.notStarted;
  String _plantLabel = ''; // Name of Error Message
  double _accuracy = 0.0;
  int count = 0;
  late Classifier _classifier;

  @override
  void initState() {
    super.initState();
    _loadClassifier();
  }

  Future<void> _loadClassifier() async {
    debugPrint(
      'Start loading of Classifier with '
      'labels at $_labelsFileName, '
      'model at $_modelFileName',
    );

    final classifier = await Classifier.loadWith(
      labelsFileName: _labelsFileName,
      modelFileName: _modelFileName,
    );
    _classifier = classifier!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: _buildTitle(),
          ),
          const SizedBox(height: 20),
          _buildPhotolView(),
          const SizedBox(height: 10),
          _buildResultView(),
          const Spacer(flex: 5),
          _buildPickPhotoButton(
            title: 'Take a Photo',
            source: ImageSource.camera,
          ),
          _buildPickPhotoButton(
            title: 'Check With an Expert',
            source: ImageSource.camera,
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildPhotolView() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        PlantPhotoView(file: _selectedImageFile),
        _buildAnalyzingText(),
      ],
    );
  }

  Widget _buildAnalyzingText() {
    if (!_isAnalyzing) {
      return const SizedBox.shrink();
    }
    return const Text('Analyzing...', style: kAnalyzingTextStyle);
  }

  Widget _buildTitle() {
    return const Text(
      'Modem',
      style: TextStyle(
        fontFamily: kDisplayFont,
        fontWeight: FontWeight.w700,
        fontSize: 50.0,
        color: Colors.black,
        decoration: TextDecoration.none,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildPickPhotoButton({
    required ImageSource source,
    required String title,
  }) {
    return TextButton(
      onPressed: () => _onPickPhoto(source),
      child: Container(
        width: 300,
        height: 60,
        decoration: const BoxDecoration(
            color: Color(0xffFD7901),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(
            child: Text(title,
                style: const TextStyle(
                  fontFamily: kButtonFont,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ))),
      ),
    );
  }

  void _setAnalyzing(bool flag) {
    setState(() {
      _isAnalyzing = flag;
    });
  }

  void _onPickPhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile == null) {
      return;
    }

    final imageFile = File(pickedFile.path);
    setState(() {
      _selectedImageFile = imageFile;
    });

    _analyzeImage(imageFile);
  }

///////////////////////////////////////////////////////////////////////////

  Future<void> uploadImageAndLabel(String image, String label) async {
    final apiUrl = Uri.parse(
        'http://172.20.37.177:8080/image-saver/v1/save'); // Replace with your backend server's URL
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = {
      'image': image,
      'label': label,
    };

    try {
      final response = await http.post(
        apiUrl,
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 201) {
        print('Image and label uploaded successfully');
        // Handle success, e.g., show a success message to the user
      } else {
        print('Failed to upload image and label');
        // Handle failure, e.g., show an error message to the user
      }
    } catch (error) {
      print('Error uploading image and label: $error');
      // Handle error, e.g., show an error message to the user
    }
  }

///////////////////////////////////////////////////////////////////////////
  void _analyzeImage(File image) {
    print('oto2222 image working........................');
    _setAnalyzing(true);

    final imageInput = img.decodeImage(image.readAsBytesSync())!;

    final resultCategory = _classifier.predict(imageInput);

    final result = resultCategory.score >= 0.6
        ? _ResultStatus.found
        : _ResultStatus.notFound;
    final plantLabel = resultCategory.label;
    final accuracy = resultCategory.score;

    _setAnalyzing(false);

    setState(() {
      _resultStatus = result;
      _plantLabel = plantLabel;
      _accuracy = accuracy;
    });

    if (plantLabel == 'Correct') {
      correctLabelCount++;
    }
  }

  Widget _buildResultView() {
    var title = '';

    if (_resultStatus == _ResultStatus.notFound) {
      title = 'Please Retake the Image';
    } else if (_resultStatus == _ResultStatus.found) {
      title = _plantLabel;
    } else {
      title = '';
    }

    //
    var accuracyLabel = '';
    // if (_resultStatus == _ResultStatus.found) {
    //   accuracyLabel = 'Accuracy: ${(_accuracy * 100).toStringAsFixed(2)}%';
    // }
    if (title == 'Incorrect') {
      accuracyLabel = 'Please make sure that the label is applied correctly';
      count++;
      if (count > 3) {
        Future.delayed(Duration(seconds: 3), () async {
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Incorrect!',
                    style: TextStyle(
                      fontFamily: kMainFont,
                      fontWeight: FontWeight.w700,
                      fontSize: 30.0,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    )),
                content: const Text('You reach maximum of tries!',
                    style: TextStyle(
                      fontFamily: kMainFont,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                      color: Colors.orange,
                      decoration: TextDecoration.none,
                    )),
                actions: <Widget>[
                  // Add a button to close the dialog.
                  TextButton(
                    onPressed: () {
                      // Close the dialog when the button is pressed.
                      Navigator.pushNamed(
                          context, ProcessCompletePage.routeName);
                    },
                    child: const Text('Ok'),
                  ),
                ],
              );
            },
          );
        });
      }
    }
    if (title == 'Correct') {
      Future.delayed(Duration(seconds: 3), () async {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Correct',
                  style: TextStyle(
                    fontFamily: kMainFont,
                    fontWeight: FontWeight.w700,
                    fontSize: 30.0,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  )),
              content: const Text('Correct Modem!',
                  style: TextStyle(
                    fontFamily: kMainFont,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                    color: Colors.orange,
                    decoration: TextDecoration.none,
                  )),
              actions: <Widget>[
                // Add a button to close the dialog.
                TextButton(
                  onPressed: () {
                    // Close the dialog when the button is pressed.
                    Navigator.pushNamed(context, ProcessCompletePage.routeName);
                  },
                  child: const Text('Done'),
                ),
              ],
            );
          },
        );
      });
    }

    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title,
            style: const TextStyle(
              fontFamily: kMainFont,
              fontWeight: FontWeight.w700,
              fontSize: 40.0,
              color: Colors.black,
              decoration: TextDecoration.none,
            )),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            accuracyLabel,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: kMainFont,
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }
}
