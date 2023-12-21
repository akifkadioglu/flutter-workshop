import 'package:flutter/material.dart';
import 'package:flutter_workshop/view/home/controller.dart';
import 'package:flutter_workshop/view/home/view_controller.dart';
import 'package:get/get.dart';

class HomeViewExample extends StatefulWidget {
  const HomeViewExample({super.key});

  @override
  State<HomeViewExample> createState() => _HomeViewExampleState();
}

class _HomeViewExampleState extends State<HomeViewExample> {
  HomeViewController viewController = Get.put(HomeViewController());
  @override
  void initState() {
    showList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: viewController.textFieldController.value,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(),
                    border: OutlineInputBorder(),
                    hintText: "Buraya görev ekle",
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: addItem,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: AnimatedList(
                  physics: const BouncingScrollPhysics(),
                  key: viewController.listKey.value,
                  initialItemCount: viewController.model.value.list.length,
                  itemBuilder: (context, index, animation) => SizeTransition(
                    sizeFactor: animation,
                    child: ListTile(
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => deleteItem(index),
                      ),
                      subtitle: Text(viewController.model.value.list[index].task),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
