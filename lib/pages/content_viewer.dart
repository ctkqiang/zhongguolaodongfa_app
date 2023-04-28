import 'package:flutter/material.dart';
import 'package:zhongguolaodongfa_app/controller/laodongfa_controller.dart';
import 'package:zhongguolaodongfa_app/model/laodongfa.dart';

class ContentViewer extends StatefulWidget {
  const ContentViewer({super.key, required this.laoDongFa});

  final LaoDongFa? laoDongFa;

  @override
  State<ContentViewer> createState() => _ContentViewerState();
}

class _ContentViewerState extends State<ContentViewer> {
  final _laodongfaController = LaoDongFaController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          widget.laoDongFa!.chapter!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: "main",
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: widget.laoDongFa!.body!.map((item) {
            return Container(
              constraints: const BoxConstraints(maxHeight: double.infinity),
              child: ListTile(
                hoverColor: Colors.white,
                title: Text(
                  "\n$item\n",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: "main",
                  ),
                ),
                onTap: () => _laodongfaController.screenShot(item),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
