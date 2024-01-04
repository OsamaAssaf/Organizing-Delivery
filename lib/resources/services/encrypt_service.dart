// import 'package:encrypt/encrypt.dart' as en;

import '../helpers/all_imports.dart';
import '../helpers/conflict_imports.dart' as conflict;

class EncryptionService {
  EncryptionService._();

  static final EncryptionService instance = EncryptionService._();

  Future<String> encrypt(String plainText) async {
    final conflict.IV iv = _getIv();
    final conflict.Encrypter encrypter = _getEncrypter();
    final conflict.Encrypted encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  Future<String> decrypt(String encryptedText) async {
    final conflict.IV iv = _getIv();
    final conflict.Encrypter encrypter = _getEncrypter();
    final String decrypted = encrypter.decrypt64(encryptedText, iv: iv);
    return decrypted;
  }

  conflict.Encrypter _getEncrypter() {
    final conflict.Key key = conflict.Key.fromBase64(DotenvManager.encryptionKey);
    final conflict.Encrypter encrypter =
        conflict.Encrypter(conflict.AES(key, mode: conflict.AESMode.ecb));
    return encrypter;
  }

  conflict.IV _getIv() {
    final conflict.IV iv = conflict.IV.fromLength(16);
    return iv;
  }
}
