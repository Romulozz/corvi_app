import 'package:corvi_app/src/domain/models/Repuestos.dart';
import 'package:corvi_app/src/domain/repository/AuthRepository.dart';
import 'package:corvi_app/src/domain/utils/Resource.dart';

class RepuestosUseCase {
  final AuthRepository repository;

  RepuestosUseCase(this.repository);

  // Método para obtener todos los repuestos
  Future<Resource<List<Repuesto>>> getRepuestos() {
    return repository.fetchRepuestos();
  }

  // Método para obtener los detalles de un repuesto específico
  Future<Resource<Repuesto>> getRepuestoDetail(int partId) {
    return repository.fetchRepuestoDetail(partId); // Asume que el método existe en el repositorio
  }
}
