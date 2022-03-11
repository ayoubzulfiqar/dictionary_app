import 'package:dictionary/cubit/dictionary_cubit.dart';
import 'package:dictionary/repository/dictionary_repository.dart';
import 'package:dictionary/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Dictionary());
}

class Dictionary extends StatelessWidget {
  const Dictionary({Key? key}) : super(key: key);

  final bool _isBannerOff = false;
  final String _title = 'Dictionary';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: _isBannerOff,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark(),
      home: BlocProvider(
        child: const Welcome(),
        create: (context) => DictionaryCubit(DictionaryRepository()),
      ),
    );
  }
}
