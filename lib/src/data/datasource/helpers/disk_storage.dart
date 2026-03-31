import 'dart:io';

/// Helper para persistencia simples de arquivos em disco.
final class DiskStorage {
  DiskStorage._();

  /// Deleta um arquivo caso exista.
  static Future<void> deleteFile({
    required String directoryPath,
    required String fileName,
  }) async {
    final File file = File(_filePath(directoryPath, fileName));
    if (await file.exists()) {
      await file.delete();
    }
  }

  /// Garante que um diretorio exista.
  static Future<Directory> ensureDirectoryExists(String directoryPath) async {
    final Directory directory = Directory(directoryPath);
    if (await directory.exists()) {
      return directory;
    }
    return directory.create(recursive: true);
  }

  /// Verifica se um arquivo existe.
  static Future<bool> fileExists({
    required String directoryPath,
    required String fileName,
  }) {
    return File(_filePath(directoryPath, fileName)).exists();
  }

  /// Recupera o conteudo de um arquivo de texto.
  ///
  /// Retorna `null` quando o arquivo nao existe.
  static Future<String?> readString({
    required String directoryPath,
    required String fileName,
  }) async {
    final File file = File(_filePath(directoryPath, fileName));
    if (!await file.exists()) {
      return null;
    }
    return file.readAsString();
  }

  /// Salva [content] em um arquivo de texto.
  ///
  /// Se [append] for true, concatena ao arquivo existente.
  static Future<File> saveString({
    required String directoryPath,
    required String fileName,
    required String content,
    bool append = false,
  }) async {
    await ensureDirectoryExists(directoryPath);
    final File file = File(_filePath(directoryPath, fileName));
    return file.writeAsString(
      content,
      mode: append ? FileMode.append : FileMode.write,
      flush: true,
    );
  }

  static String _filePath(String directoryPath, String fileName) {
    return '$directoryPath${Platform.pathSeparator}$fileName';
  }
}
