import 'package:flutter/material.dart';
import 'package:flutter_workshop/core/models/list_model.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
  var textFieldController = TextEditingController().obs;
  final listKey = GlobalKey<AnimatedListState>().obs;

  var model = ListModel(list: []).obs;
}
