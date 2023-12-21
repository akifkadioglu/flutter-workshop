import 'package:flutter/material.dart';
import 'package:flutter_workshop/core/models/list_model.dart';
import 'package:flutter_workshop/core/storage/manager.dart';
import 'package:flutter_workshop/view/home/view_controller.dart';
import 'package:get/get.dart';

addItem() {
  HomeViewController viewController = Get.put(HomeViewController());
  ListElement item = ListElement(task: "description" + viewController.model.value.list.length.toString());
  StorageManager.instance.addItemToList(item);

  viewController.model.value.list.add(item);
  viewController.model.refresh();
  viewController.listKey.value.currentState?.insertItem(
    viewController.model.value.list.length - 1,
    duration: const Duration(milliseconds: 500),
  );
}

deleteItem(int index) {
  HomeViewController viewController = Get.put(HomeViewController());
  StorageManager.instance.deleteItemToList(index);
  var task = viewController.model.value.list[index].task;
  viewController.model.value.list.removeAt(index);
  viewController.model.refresh();
  viewController.listKey.value.currentState?.removeItem(
    index,
    (context, animation) => SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        subtitle: Text(task, style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.red)),
        trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
      ),
    ),
    duration: const Duration(milliseconds: 200),
  );
}

showList() {
  HomeViewController viewController = Get.put(HomeViewController());
  viewController.model.value = StorageManager.instance.list();
}
