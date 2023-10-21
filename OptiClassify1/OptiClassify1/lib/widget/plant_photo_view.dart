import 'dart:io';
import 'package:flutter/material.dart';

import '../styles.dart';

class PlantPhotoView extends StatelessWidget {
  final File? file;
  const PlantPhotoView({super.key, this.file});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      decoration: const BoxDecoration(
          color: Color(0xffFD7901),
          borderRadius:
          BorderRadius.all(Radius.circular(20))),
      child: (file == null)
          ? _buildEmptyView()
          : Image.file(file!, fit: BoxFit.cover),
    );
  }

  Widget _buildEmptyView() {
    return const Center(
        child: Text(
      'Please pick a photo',
      style: TextStyle(
          fontFamily: 'MazzardM',
          fontWeight: FontWeight.w500,
          fontSize: 25.0,
          color: Colors.white,
          decoration: TextDecoration.none),
    ));
  }
}
