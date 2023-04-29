import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final item = [
      "谁创建了此应用程序？",
      "版本 1.0.0",
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: ListView(
        children: item.map((n) {
          return ListTile(
            title: Text(
              n,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: "main",
              ),
            ),
            onTap: () async {
              final index = item.indexOf(n);

              if (index == 0) {
                Get.showSnackbar(
                  const GetSnackBar(
                    icon: Icon(Icons.info, color: Colors.green, size: 30),
                    duration: Duration(seconds: 10),
                    snackPosition: SnackPosition.TOP,
                    message:
                        "关注我的微信(@ctkqiang)， 钉钉(@chengtzekeong) 和 QQ(3072486255)",
                  ),
                );
              }
            },
          );
        }).toList(),
      ),
    );
  }
}
