import 'package:flutter/material.dart';
import 'package:zhongguolaodongfa_app/controller/laodongfa_controller.dart';
import 'package:zhongguolaodongfa_app/model/laodongfa.dart';

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
      ),
      body: WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: FutureBuilder<List<LaoDongFa?>?>(
            key: const Key("future::chapter"),
            future: _laodongfaController.getContents(),
            builder: (context, snapshot) {
              if (!(snapshot.hasData)) {
                return const Center(child: Text("这里好像出了一些问题。"));
              }

              return ListView(
                children: snapshot.data!.map((item) {
                  return ListTile(
                    title: Text(
                      item!.chapter!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {},
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
