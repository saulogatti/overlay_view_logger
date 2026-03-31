import 'dart:io';

import 'package:overlay_view_logger/src/core/errors/disk_storage_error.dart';
import 'package:path/path.dart' as path;

/// Helper para persistencia simples de arquivos em disco.
/// Erros que acontecem neste helper são do tipo [DiskStorageError].
/// Informções de utilização:
/// - Os metodos são estaticos para facilitar a utilização.
/// - Nenhum metodo trata qualquer tipo de erro, apenas retorna null ou lança uma exceção.
/// - Os metodos são assincronos para facilitar a utilização.
/// - As checagens de existencia de arquivos e diretorios são feitas antes de executar as operações.
/// - Quando tem algum problema que tenha problema, como falta de extensão, falta de permissão, etc, o metodo retorna null ou lança uma exceção.
/// - Qualquer permissão necessaria tem que ser verificada antes de executar as operações.
final class DiskStorage {
  DiskStorage._();

  /// Deleta um arquivo caso exista.
  ///
  /// Lança uma exceção se o caminho do diretório ou o nome do arquivo estiver vazio ou contiver separador de caminho.
  /// Lança uma exceção se o nome do arquivo não tiver extensão.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// await deleteFile('registers', 'registers.json');
  /// ```
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
  ///
  /// Retorna o diretório criado.
  ///
  /// Lança uma exceção se o caminho do diretório estiver vazio ou contiver separador de caminho.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// final directory = await ensureDirectoryExists('registers');
  /// print(directory.path); // registers
  /// ```
  ///
  static Future<Directory> ensureDirectoryExists(String directoryPath) async {
    if (directoryPath.isEmpty) {
      throw DiskStorageError(
        message: 'caminho do diretório está vazio',
        errorEnum: DiskStorageErrorEnum.directoryPathIsEmpty,
        stackTrace: StackTrace.current,
      );
    }
    if (directoryPath.contains(Platform.pathSeparator)) {
      throw DiskStorageError(
        message:
            'caminho do diretório contém separador de caminho $directoryPath',
        errorEnum: DiskStorageErrorEnum.directoryPathContainsPathSeparator,
        stackTrace: StackTrace.current,
      );
    }
    final Directory directory = Directory(directoryPath);
    if (await directory.exists()) {
      return directory;
    }
    return await directory.create(recursive: true);
  }

  /// Verifica se um arquivo existe.
  /// retorna true se o arquivo existe, false caso contrario.
  /// Lança uma exceção se o caminho do diretório ou o nome do arquivo estiver vazio ou contiver separador de caminho.
  /// Lança uma exceção se o nome do arquivo não tiver extensão.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// final exists = await fileExists('registers', 'registers.json');
  /// print(exists); // true
  /// ```
  ///
  static Future<bool> fileExists({
    required String directoryPath,
    required String fileName,
  }) async {
    return await File(_filePath(directoryPath, fileName)).exists();
  }

  /// Recupera o conteudo de um arquivo de texto.
  ///
  /// Retorna `null` quando o arquivo nao existe.
  /// Lança uma exceção se o caminho do diretório ou o nome do arquivo estiver vazio ou contiver separador de caminho.
  /// Lança uma exceção se o nome do arquivo não tiver extensão.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// final content = await readString('registers', 'registers.json');
  /// print(content); // content
  /// ```
  ///
  static Future<String?> readString({
    required String directoryPath,
    required String fileName,
  }) async {
    final File file = File(_filePath(directoryPath, fileName));
    if (!await file.exists()) {
      return null;
    }
    return await file.readAsString();
  }

  /// Salva [content] em um arquivo de texto.
  ///
  /// Se [append] for true, concatena ao arquivo existente.
  /// Lança uma exceção se o caminho do diretório ou o nome do arquivo estiver vazio ou contiver separador de caminho.
  /// Lança uma exceção se o nome do arquivo não tiver extensão.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// final file = await saveString('registers', 'registers.json', 'content');
  /// print(file.path); // registers/registers.json
  /// ```
  ///
  static Future<File> saveString({
    required String directoryPath,
    required String fileName,
    required String content,
    bool append = false,
  }) async {
    await ensureDirectoryExists(directoryPath);
    final File file = File(_filePath(directoryPath, fileName));
    return await file.writeAsString(
      content,
      mode: append ? FileMode.append : FileMode.write,
      flush: true,
    );
  }

  /// Gera o caminho completo do arquivo.
  ///
  /// Retorna o caminho completo do arquivo.
  ///
  /// Lança uma exceção se o nome do arquivo ou o caminho do diretório estiver vazio ou contiver separador de caminho.
  /// Lança uma exceção se o nome do arquivo não tiver extensão.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// final filePath = _filePath('registers', 'registers.json');
  /// print(filePath); // registers/registers.json
  /// ```
  ///
  /// Exemplo de uso:
  /// ```dart
  /// final filePath = _filePath('registers', 'registers.json');
  /// print(filePath); // registers/registers.json
  /// ```
  ///
  static String _filePath(String directoryPath, String fileName) {
    if (fileName.isEmpty) {
      throw DiskStorageError(
        message: 'nome do arquivo está vazio',
        errorEnum: DiskStorageErrorEnum.fileNameIsEmpty,
        stackTrace: StackTrace.current,
      );
    }
    if (directoryPath.isEmpty) {
      throw DiskStorageError(
        message: 'caminho do diretório está vazio',
        errorEnum: DiskStorageErrorEnum.directoryPathIsEmpty,
        stackTrace: StackTrace.current,
      );
    }
    if (fileName.contains(Platform.pathSeparator)) {
      throw DiskStorageError(
        message: 'nome do arquivo contém separador de caminho $fileName',
        errorEnum: DiskStorageErrorEnum.fileNameContainsPathSeparator,
        stackTrace: StackTrace.current,
      );
    }
    if (directoryPath.contains(Platform.pathSeparator)) {
      throw DiskStorageError(
        message:
            'caminho do diretório contém separador de caminho $directoryPath',
        errorEnum: DiskStorageErrorEnum.directoryPathContainsPathSeparator,
        stackTrace: StackTrace.current,
      );
    }
    final extensionFile = path.extension(fileName);
    if (extensionFile.isEmpty) {
      throw DiskStorageError(
        message: 'nome do arquivo sem extensão $fileName',
        errorEnum: DiskStorageErrorEnum.fileNameWithoutExtension,
        stackTrace: StackTrace.current,
      );
    }

    return path.join(directoryPath, fileName);
  }
}
