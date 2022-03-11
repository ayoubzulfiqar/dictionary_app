import 'package:dictionary/model/dictionary_response.dart';
import 'package:dictionary/screens/detail_words.dart';
import 'package:flutter/material.dart';

class WordsList extends StatelessWidget {
  final List<DictionaryResponse> words;
  const WordsList(this.words, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 70),
          const Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 5,
            ),
            child: Text(
              "List of Words that we found",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: 'Libre Baskerville',
              ),
            ),
          ),
          // const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Text(
              "click on word to find more about it's details",
              style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  fontFamily: 'ABeeZee'),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 80,
              ),
              color: Colors.grey.withOpacity(0.1),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      words[index].word!,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ABeeZee',
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WordDetail(words[index]),
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: words.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
