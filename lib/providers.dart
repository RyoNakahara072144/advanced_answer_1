import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//問１：　カウントの状態を管理するStateProviderを作成。
final counterProvider = StateProvider<int>((ref) => 0);

//問２：　テーマの状態を管理するStateProviderを作成。
final themeProvider = StateProvider<ThemeData>((ref) => ThemeData.light());