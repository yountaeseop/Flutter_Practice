import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FileApp extends StatefulWidget {
  const FileApp({Key? key});

  @override
  State<FileApp> createState() => _FileAppState();
}

class _FileAppState extends State<FileApp> {
  List<String> itemList = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    var result = await readListFile(context);
    setState(() {
      itemList.addAll(result);
    });
  }

  void writeFileTest(String str) async {
    var dir = await getApplicationDocumentsDirectory();
    print(dir);
    var file = File('${dir.path}/fileTest.txt');
    String content = await file.readAsString();
    content = content + '\n' + str;
    file.writeAsStringSync(content);
  }

  Future<List<String>> readListFile(BuildContext context) async {
    List<String> items = [];

    var key = 'First';
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? firstCheck = pref.getBool(key);
    var dir = await getApplicationDocumentsDirectory();
    bool fileExist = await File('${dir.path}/fileTest.txt').exists();

    if (firstCheck == null || firstCheck == false || fileExist == false) {
      pref.setBool(key, true);
      try {
        var file = await DefaultAssetBundle.of(context).loadString('repo/fileTest.txt');
        File('${dir.path}/fileTest.txt').writeAsStringSync(file);
        var array = file.split('\n');
        for (var item in array) {
          print(item);
          items.add(item);
        }
      } catch (e) {
        print(e);
      }
      return items;
    } else {
      var file = await File('${dir.path}/fileTest.txt').readAsString();
      var array = file.split('\n');
      for (var item in array) {
        print(item);
        items.add(item);
      }
      return items;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Example'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: controller,
              keyboardType: TextInputType.text,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Center(
                      child: Text(
                        itemList[index],
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                  );
                },
                itemCount: itemList.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          writeFileTest(controller.text);
          setState(() {
            itemList.add(controller.text);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}