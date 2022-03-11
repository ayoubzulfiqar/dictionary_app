import 'package:dictionary/model/dictionary_response.dart';
import 'package:flutter/material.dart';

class WordDetail extends StatelessWidget {
  final DictionaryResponse dictionaryResponse;
  const WordDetail(this.dictionaryResponse, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              "${dictionaryResponse.word}",
              style: const TextStyle(
                  fontSize: 36, fontFamily: 'Libre Baskerville'),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  // final any = dictionaryResponse
                  //     .meanings![index].definitions![index].antonyms;
                  // final sny = dictionaryResponse
                  //     .meanings![index].definitions![index].synonyms;
                  final meaning = dictionaryResponse.meanings![index];
                  final definitions = meaning.definitions;
                  final phonetic = dictionaryResponse.phonetic;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(dictionaryResponse.origin),
                      Text(phonetic!),
                      Text(
                        meaning.partOfSpeech!,
                        style: const TextStyle(
                            fontFamily: 'Libre Baskerville',
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ListView.separated(
                        itemBuilder: (context, index) => Column(
                          children: [
                            // Text(
                            //   "Definitions : " +
                            //       definitions![index].definition!,
                            //   style: TextStyle(
                            //     fontWeight: FontWeight.bold,
                            //     fontFamily: 'ABeeZee',
                            //     fontSize: 15,
                            //   ),
                            // ),
                            Text.rich(
                              TextSpan(
                                  text: 'Definitions : ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Libre Baskerville',
                                      fontSize: 19,
                                      color: Colors.purple),
                                  children: [
                                    TextSpan(
                                      text: definitions![index].definition,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'ABeeZee'),
                                    ),
                                  ]),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            // Text("Sentence  : ${definitions[index].example}",
                            //     style: TextStyle(fontFamily: 'ABeeZee')),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        separatorBuilder: (context, index) {
                          //   return const SizedBox(
                          //   height: 8,
                          // );
                          return const Divider();
                        },
                        itemCount: definitions!.length,
                        shrinkWrap: true,
                      ),
                      // ListView.builder(
                      //   itemBuilder: (context, index) {
                      //     return Row(
                      //       children: [
                      //         Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: <Widget>[
                      //             for (var synonyms in any!)
                      //               Text(
                      //                 synonyms,
                      //                 style: TextStyle(color: Colors.black),
                      //               )
                      //           ],
                      //         ),
                      //         Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: <Widget>[
                      //             for (var antonyms in sny!)
                      //               Text(
                      //                 antonyms,
                      //                 style: TextStyle(color: Colors.black),
                      //               )
                      //           ],
                      //         ),
                      //       ],
                      //     );
                      //   },
                      //   // separatorBuilder: (context, index) {
                      //   //   return const SizedBox(width: 5);
                      //   // },
                      //   itemCount: definitions.length,
                      // ),
                    ],
                  );
                },
                itemCount: dictionaryResponse.meanings!.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 32,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
