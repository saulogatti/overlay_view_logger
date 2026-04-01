final class DiskStorageError implements Exception {
  final String message;
  final DiskStorageErrorEnum errorEnum;
  final StackTrace stackTrace;

  /// Exceção lançada para indicar erros relacionados à persistência de arquivos em disco.
  ///
  /// Utilize [DiskStorageError] para capturar e tratar falhas nas operações de leitura, escrita,
  /// deleção ou criação de diretórios/arquivos realizadas pelo helper de armazenamento em disco.
  ///
  /// Cada erro é especificado pelo tipo [DiskStorageErrorEnum] e pode conter uma mensagem
  /// explicativa e o [StackTrace] do momento da exceção.
  const DiskStorageError({
    required this.message,
    required this.errorEnum,
    required this.stackTrace,
  });

  @override
  String toString() {
    return 'DiskStorageErrors: $message - $errorEnum - ${stackTrace.toString()}';
  }
}

/// Enumeração dos tipos de erro possíveis ao manipular arquivos e diretórios em disco.
///
/// - [directoryPathIsEmpty]: O caminho do diretório fornecido está vazio.
/// - [directoryPathNotContainsPathSeparator]: O caminho do diretório não contém separador de caminho.
/// - [fileNameIsEmpty]: O nome do arquivo fornecido está vazio.
/// - [fileNameContainsPathSeparator]: O nome do arquivo contém separador de caminho.
/// - [fileNameWithoutExtension]: O nome do arquivo não possui extensão.
/// - [fileDoesNotExist]: O arquivo solicitado não existe.
/// - [fileExists]: O arquivo já existe.
enum DiskStorageErrorEnum {
  directoryPathIsEmpty,
  fileNameIsEmpty,
  fileNameContainsPathSeparator,
  fileNameWithoutExtension,
  fileDoesNotExist,
  fileExists,
  directoryPathNotContainsPathSeparator,
}
