// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'id_provider.dart';

void main() {
  runApp(const ProviderScope( child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
     
      home:  Router(routerDelegate: AppRouterDelegate(ref)),
    );
  }
}

final _navigatorKey = GlobalKey<NavigatorState>();

class AppRouterDelegate extends RouterDelegate<Empty> with ChangeNotifier,PopNavigatorRouterDelegateMixin<Empty>{


  AppRouterDelegate(this.ref);

  final WidgetRef ref;

  @override 
  final GlobalKey<NavigatorState>? navigatorKey=_navigatorKey;

  //値を監視
  String get id => ref.watch(idProvider);
  //
  StateController<String> get provider => ref.read(idProvider.notifier);

  @override 
  Widget build(BuildContext context){
    return Navigator(
      key:navigatorKey,
      pages:  [
        const  MaterialPage(child: HogeScreen()),
        if(id.isNotEmpty) const MaterialPage(child: FugaScreen()),
      ],

      onPopPage: (route,result){
        provider.state = "";
        return route.didPop(result);
      },
    );
  }
  //Web用
  @override 
  Future<void> setNewRoutePath(Empty configuration) async {}
}

class Empty {}

class HogeScreen extends ConsumerWidget {
  const HogeScreen({Key? key}):super(key: key);

  @override 
  Widget build(BuildContext context, WidgetRef ref){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hogee"),
      ),
      body:Center(
        child: ElevatedButton(child: const Text("次へ"),onPressed: ()=> ref.read(idProvider.notifier).state = "Fuga" ,),
      ),
    );
  }
}

class FugaScreen extends StatelessWidget {
  const FugaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fugaaaaa'),
        backgroundColor: Colors.redAccent, // わかりやすいように色付け
      ),
      body: null,
    );
  }
}
