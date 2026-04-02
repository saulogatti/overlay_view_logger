import 'dart:io';

import 'package:overlay_view_logger/src/core/errors/disk_storage_error.dart';
import 'package:path/path.dart' as path;

/// Utilitário de persistência simples de arquivos no disco.
///
/// Erros gerados por este utilitário são representados por [DiskStorageError].
///
/// Informações de utilização:
/// - Os métodos são `static` para facilitar chamadas diretas.
/// - Os métodos são assíncronos (retornam `Future`).
/// - As checagens de existência de arquivos/diretórios são feitas antes das
///   operações.
/// - Quando há problemas de caminho/extensão/permissões, o método pode
///   lançar [DiskStorageError] (ou retornar `null`, quando aplicável).
/// - Verifique permissões necessárias antes de executar as operações.
final class DiskStorage {
  DiskStorage._();

  /// Remove um arquivo do disco caso ele exista.
  ///
  /// Parâmetros:
  /// - `directoryPath`: caminho do diretório onde o arquivo está localizado.
  /// - `fileName`: nome do arquivo, incluindo a extensão.
  ///
  /// Observação:
  /// Se os parâmetros forem inválidos, este método pode lançar
  /// [DiskStorageError].
  static Future<void> deleteFile({
    required String directoryPath,
    required String fileName,
  }) async {
    final File file = File(_getFilePath(directoryPath, fileName));
    if (await file.exists()) {
      await file.delete();
    }
  }

  /// Garante que um diretório exista e retorna a referência do diretório.
  ///
  /// Parâmetros:
  /// - `directoryPath`: caminho do diretório a ser garantido.
  ///
  /// Retorna:
  /// Um [Directory] que representa o diretório existente.
  ///
  /// Observação:
  /// Este método valida o formato do caminho e pode lançar
  /// [DiskStorageError] em caso de parâmetros inválidos.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// final directory = await DiskStorage.ensureDirectoryExists('registers\\debug');
  /// print(directory.path); // registers\\debug
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
    if (!directoryPath.contains(Platform.pathSeparator)) {
      throw DiskStorageError(
        message:
            'caminho do diretório não tem separador de caminho $directoryPath',
        errorEnum: DiskStorageErrorEnum.directoryPathNotContainsPathSeparator,
        stackTrace: StackTrace.current,
      );
    }
    final Directory directory = Directory(directoryPath);
    if (await directory.exists()) {
      return directory;
    }
    return await directory.create(recursive: true);
  }

  /// Verifica se um arquivo existe no disco.
  ///
  /// Parâmetros:
  /// - `directoryPath`: caminho do diretório onde o arquivo está localizado.
  /// - `fileName`: nome do arquivo, incluindo a extensão.
  ///
  /// Retorna:
  /// `true` se o arquivo existir, `false` caso contrário.
  ///
  /// Observação:
  /// Se os parâmetros forem inválidos, este método pode lançar
  /// [DiskStorageError].
  static Future<bool> fileExists({
    required String directoryPath,
    required String fileName,
  }) async {
    return await File(_getFilePath(directoryPath, fileName)).exists();
  }

  /// Lê o conteúdo de um arquivo de texto.
  ///
  /// Parâmetros:
  /// - `directoryPath`: caminho do diretório onde o arquivo está localizado.
  /// - `fileName`: nome do arquivo, incluindo a extensão.
  ///
  /// Retorna:
  /// O conteúdo como [String] ou `null` quando o arquivo não existir.
  ///
  /// Observação:
  /// Se os parâmetros forem inválidos, este método pode lançar
  /// [DiskStorageError].
  static Future<String?> readString({
    required String directoryPath,
    required String fileName,
  }) async {
    final File file = File(_getFilePath(directoryPath, fileName));
    if (!await file.exists()) {
      return null;
    }
    return await file.readAsString();
  }

  /// Salva o [content] em um arquivo de texto.
  ///
  /// Parâmetros:
  /// - `directoryPath`: caminho do diretório onde o arquivo será salvo.
  /// - `fileName`: nome do arquivo, incluindo a extensão.
  /// - `content`: conteúdo textual a ser persistido.
  /// - `append`: se `true`, anexa ao arquivo existente; caso contrário,
  ///   substitui.
  ///
  /// Observação:
  /// Se os parâmetros forem inválidos, este método pode lançar
  /// [DiskStorageError].
  ///
  /// Exemplo de uso:
  /// ```dart
  /// await DiskStorage.saveString(
  ///   directoryPath: 'registers\\debug',
  ///   fileName: 'registers.json',
  ///   content: '{"example": true}',
  /// );
  /// final content = await DiskStorage.readString(
  ///   directoryPath: 'registers\\debug',
  ///   fileName: 'registers.json',
  /// );
  /// print(content); // {"example": true}
  /// ```
  static Future<void> saveString({
    required String directoryPath,
    required String fileName,
    required String content,
    bool append = false,
  }) async {
    await ensureDirectoryExists(directoryPath);
    final File file = File(_getFilePath(directoryPath, fileName));
    await file.writeAsString(
      content,
      mode: append ? FileMode.append : FileMode.write,
      flush: true,
    );
  }

  /// Gera o caminho completo do arquivo a partir do diretório e do nome.
  ///
  /// Parâmetros:
  /// - `directoryPath`: caminho do diretório.
  /// - `fileName`: nome do arquivo, incluindo a extensão.
  ///
  /// Retorna:
  /// Caminho completo do arquivo.
  ///
  /// Observação:
  /// Este método valida o `fileName` (por exemplo, presença de extensão) e o
  /// `directoryPath`, e pode lançar [DiskStorageError] em caso de parâmetros
  /// inválidos.
  static String _getFilePath(String directoryPath, String fileName) {
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
