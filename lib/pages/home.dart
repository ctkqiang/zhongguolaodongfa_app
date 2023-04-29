import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zhongguolaodongfa_app/constant/Strings.dart';
import 'package:zhongguolaodongfa_app/controller/laodongfa_controller.dart';
import 'package:zhongguolaodongfa_app/model/laodongfa.dart';
import 'package:zhongguolaodongfa_app/pages/info_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _laodongfaController = LaoDongFaController.instance;

  @override
  void initState() {
    super.initState();

    if (super.mounted) onStart();
  }

  Future<void> onStart() async => await _laodongfaController.getContents();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        elevation: 0.0,
        title: Text(
          appName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: "main",
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info, color: Colors.white),
            onPressed: () => Get.to(() => const InfoPage()),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async => false,
        child: ScrollConfiguration(
          behavior: const MaterialScrollBehavior().copyWith(
            overscroll: false,
          ),
          child: SafeArea(
            child: FutureBuilder<List<LaoDongFa?>?>(
              key: const Key("future::chapter"),
              future: _laodongfaController.getContents(),
              builder: (context, snapshot) {
                if (!(snapshot.hasData)) {
                  return const Center(child: Text("这里好像出了一些问题。"));
                }

                return NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: ListView(
                    // physics: const NeverScrollableScrollPhysics(),
                    children: snapshot.data!.map((item) {
                      return ListTile(
                        title: Text(
                          item!.chapter!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: "main",
                          ),
                        ),
                        hoverColor: Colors.white,
                        onTap: () => _laodongfaController.onTap(
                          laodongfa: item,
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
