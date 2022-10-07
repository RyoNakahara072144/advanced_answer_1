import 'package:advanced_exercise_1/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<ThemeData> list = [ThemeData.light(), ThemeData.dark()];

class Setting extends ConsumerWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final theme = ref.watch(themeProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        centerTitle: true,
      ),
      body: Center(

        //問２：　ドロップダウンメニューでテーマを切り替える。
        child: DropdownButton<ThemeData>(
          value: theme.state,
          elevation: 16,
          underline: Container(
            height: 2,
          ),
          onChanged: (ThemeData? value) {
            // This is called when the user selects an item.
            theme.state = value!;
          },
          items: list.map<DropdownMenuItem<ThemeData>>((ThemeData value) {
            return DropdownMenuItem<ThemeData>(
              value: value,
              child: Text(value==ThemeData.light()?'ライトテーマ':'ダークテーマ'),
            );
          }).toList(),
        ),
      )
    );
  }
}
