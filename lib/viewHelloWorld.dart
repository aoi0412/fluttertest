export 'viewHelloWorld.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 値を格納するプロバイダの作成
final helloWorldProvider = Provider((_)=>"Hello world");

class Riverpod extends ConsumerWidget {
  const Riverpod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final String value = ref.watch(helloWorldProvider);

    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(title:const Text("Show Hello World")),
        body:Center(child: 
          Text(value),
        )
      )
    );
  }
}