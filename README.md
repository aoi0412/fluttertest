# Riverpod

riberpod を理解するためのブランチ

## プロバイダの作成

Flutter のアプリのルートに要記述

    void main(){
    runApp(ProviderScope(child:MyApp()))
    }

    final myProvider = Provider((ref) {
    return MyValue();
    });

final myProvider:変数の宣言

Provider:プロバイダの種類（どのようなオブジェクトでも生成可能）

## プロバイダを使用

StatelessWidget や StatefulWidget ではプロバイダに必要な ref を取得できないので

### StatelessWidget の場合

    class MyApp extends ConsumerWidget {
    const MyApp({key? key}):super(key:key);

        @override
        Widget build(BuildContext context, WidgetRef ref){
            return Container();
        }

    }

### StatefulWidget の場合

    class MyApp extends ConsumerStatefulWidget {
    const MyApp({key? key}):super(key:key);

        @override
        ConsumerState<ConsumerStatefulWidget> createState()=> _MyAppState();

    }
    class _MyAppState extends ConsumerState<MyApp> {
    @override
    Widget build(BuildContext context){
    return Container
    }
    }

のように記述する

プロバイダの値を取得するには
final hello = ref.watch(helloProvider)

のように記述する

## プロバイダの種類

### Provider:

外部からは変更できない値を公開する基本的なプロバイダ

#### 例 String 型のプロバイダ

    final aiueoProvider = Provider((ref)=> "aiueo");

### StateProvider:

外部から変更可能な状態を公開する

emun,String,bool,number 型のデータを外部から変更可能。

List,map,varidation には不向き

count++より高度なロジックには向いてない
より高度なロジックを使用する際には StateNotifierProvider を使用する


#### 外部から StateProvider の値を変更

ref.read(プロバイダ名.notifier).state = 値;

read の部分を watch にしても可能だが、read は変更、watch は取得が好ましい

#### 例カウントするステートを格納したプロバイダ

    final counterProvider = StateProvider((ref)=>0);
    

### StateNotifierProvider:

外部から変更可能な状態と状態変更メソッドクラスを公開


### FutureProvider:

非同期で取得した値を公開


### StreamProvider:



### ChangeNotifierProvider

変更可能な状態を持つクラスを公開
