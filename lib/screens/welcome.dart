import 'package:dictionary/cubit/dictionary_cubit.dart';
import 'package:dictionary/screens/dictionary_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();
    return BlocListener(
      listener: (context, state) {
        if (state is SearchedState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WordsList(state.words)));
        }
      },
      bloc: cubit,
      child: Scaffold(
        body: cubit.state is SearchedState
            ? searchingWidget()
            : cubit.state is ErrorState
                ? errorWidget()
                : cubit.state is HomeState
                    ? _welcome(context)
                    : Container(),
      ),
    );
  }

  ListView _welcome(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();
    return ListView(
      padding: const EdgeInsets.only(left: 20, right: 20),
      children: [
        const SizedBox(height: 230),
        _title(),
        _slogan(),
        const SizedBox(height: 10),
        _searchBar(context),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Recent",
                    style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Libre Baskerville'),
                  ),
                ],
              ),
              TextButton(
                child: Row(
                  children: const [
                    Text(
                      'Search',
                      style: TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'ABeeZee'),
                    ),
                    SizedBox(width: 3),
                    Icon(
                      Icons.arrow_forward,
                      size: 18,
                    )
                  ],
                ),
                onPressed: () {
                  cubit.getWordsFromDictionary();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Padding _slogan() {
    return const Padding(
      padding: EdgeInsets.only(top: 5, left: 5),
      child: Text(
        'Collection of words according to your needs - Dictionary',
        style: TextStyle(color: Colors.grey, fontFamily: 'ABeeZee'),
      ),
    );
  }

  Text _title() {
    return const Text(
      "Dictionary",
      style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          fontFamily: 'Libre Baskerville'),
    );
  }

  TextField _searchBar(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();
    return TextField(
      style: const TextStyle(fontFamily: 'ABeeZee'),
      controller: cubit.queryController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        hintText: 'search here',
        hintStyle: const TextStyle(color: Colors.grey),
        fillColor: Colors.grey.withOpacity(0.1),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget searchingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget errorWidget() {
    return const Center(
      child: Text('Error'),
    );
  }
}
