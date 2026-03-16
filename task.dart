// Name: Muhammad Shahaf
// Roll Number: k22-4230

import 'dart:io';

void main() async {

  File file = File('file.txt');

  List<String> lines = await file.readAsLines();

  print("The following words have the highest word frequency per line:\n");

  for (int i = 0; i < lines.length; i++) {

    String line = lines[i].toLowerCase();

    List<String> words = line.split(RegExp(r'\s+'));

    Map<String, int> frequency = {};

    for (String word in words) {
      frequency[word] = (frequency[word] ?? 0) + 1;
    }

    int maxFreq = frequency.values.reduce((a, b) => a > b ? a : b);

    List<String> highestWords = [];

    frequency.forEach((word, count) {
      if (count == maxFreq) {
        highestWords.add(word);
      }
    });

    print("$highestWords (appears in line ${i + 1})");
  }
}
