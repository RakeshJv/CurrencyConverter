class StringUtil{

 static String utf8convert(String text) {
    const int flagOffset = 0x1F1E6;
    const int asciiOffset = 0x41;

    final codeToCountryEmoji = (code) {
      final char1 = code.codeUnitAt(0) - asciiOffset + flagOffset;
      final char2 = code.codeUnitAt(1) - asciiOffset + flagOffset;
      return String.fromCharCode(char1) + String.fromCharCode(char2);
    };

      print(codeToCountryEmoji(text));
    return codeToCountryEmoji(text);
  }
}