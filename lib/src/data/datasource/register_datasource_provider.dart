import 'package:overlay_view_logger/src/core/type_register.dart';
import 'package:overlay_view_logger/src/data/models/list_type_registers_model.dart';

/// Fonte de dados de registros por [TypeRegister].
///
/// Implementações devem persistir e recuperar dados de [ListTypeRegistersModel]
/// para o tipo informado, garantindo que o repositório possa encapsular
/// falhas em [Result] sem propagar exceções para a UI.
abstract interface class RegisterDataSourceProvider {
  /// Obtém os registros persistidos para o [typeRegister] informado.
  ///
  /// Parâmetros:
  /// - `typeRegister`: tipo de registros a consultar.
  ///
  /// Retorna:
  /// Um [ListTypeRegistersModel] contendo os registros daquele tipo.
  Future<ListTypeRegistersModel> getData(TypeRegister typeRegister);

  /// Persiste os [data] fornecidos.
  ///
  /// Parâmetros:
  /// - `data`: lista de registros e metadados do tipo a ser salva.
  ///
  /// Retorna:
  /// Um [Future] concluído quando a persistência terminar.
  Future<void> saveData(ListTypeRegistersModel data);
}
