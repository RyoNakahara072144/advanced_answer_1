import 'package:advanced_exercise_1/providers.dart';
import 'package:advanced_exercise_1/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  //問１：　runAppで囲むのを忘れないようにしましょう。
  runApp(const ProviderScope(child: MyApp()));
}

//問２：　MyAppをConsumerWidgetに書き換えます。
class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //問２：　ref.watchで状態を監視。
    final theme = ref.watch(themeProvider.state);

    return MaterialApp(
      title: 'Riverpod Demo',
      //問２：　themeProviderはThemeDataを返します。
      theme: theme.state,
      home: const MyHomePage(),
    );
  }
}

//問１：　MyHomePageをStatefulWidgetからConsumerWidgetに書き換えます。
class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //問１：　ref.watchで状態を監視。
    final counter = ref.watch(counterProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Exercise 1'),
        actions: [
          IconButton(onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Setting())), icon: const Icon(Icons.settings))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              //問１：　stateで状態を取得。リアルタイムで変更が反映される。
              '${counter.state}',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    //問１：　状態を更新
                    counter.state--;
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                  ),
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20,),
                ElevatedButton(
                  onPressed: (){
                    //問１：　状態を更新
                    counter.state = 0;
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                  ),
                  child: const Text('Reset', style: TextStyle(color: Colors.white),),
                ),
                const SizedBox(width: 20,),
                ElevatedButton(
                  onPressed: (){
                    //問１：　状態を更新
                    counter.state++;
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                  ),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
