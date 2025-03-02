import 'dart:io';
import 'dart:math';

void main() {
  Vigenere mykey = Vigenere("Hello");
  print("Chave gerada: ${mykey.Key()}");

  String encrypted = mykey.TextEncode("KEY");
  print("Texto criptografado: $encrypted");

  String decrypted = mykey.TextDecode(encrypted, "KEY");
  print("Texto descriptografado: $decrypted");
}

class Vigenere {
  String text;

  Vigenere(this.text);

  String Key() {
    Random random = Random();
    var key = "";

    for (int i = 0; i < text.length; i++) {
      key += String.fromCharCode(65 + random.nextInt(26));
    }
    return key;
  }

  String TextEncode(String key) {
    String encrypted = "";

    for (int i = 0; i < key.length; i++) {
      int textenconde = text.codeUnitAt(i);
      int textkey = key.codeUnitAt(i);

      int Encodechar = ((textenconde - 65 + (textkey - 65)) % 26) + 65;

      encrypted += String.fromCharCode(Encodechar);
    }
    return encrypted;
  }

  String TextDecode(String encryptedText, String key) {
    String decrypted = "";

    for (int i = 0; i < encryptedText.length; i++) {
      int encChar = encryptedText.codeUnitAt(i);
      int keyChar = key.codeUnitAt(i % key.length);

      int decodeChar = ((encChar - keyChar + 26) % 26) + 65;

      decrypted += String.fromCharCode(decodeChar);
    }
    return decrypted;
  }
}
