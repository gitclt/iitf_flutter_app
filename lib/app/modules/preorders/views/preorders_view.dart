import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/preorders_controller.dart';

class PreordersView extends GetView<PreordersController> {
  const PreordersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PreordersView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PreordersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
