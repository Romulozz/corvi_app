import 'package:corvi_app/src/data/dataSource/remote/services/AuthServices.dart';
import 'package:corvi_app/src/domain/models/Repuestos.dart';
import 'package:corvi_app/src/domain/repository/AuthRepository.dart';
import 'package:corvi_app/src/domain/utils/Resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthServices authServices;

  AuthRepositoryImpl(this.authServices);

  // Implementación del método para obtener la lista de repuestos
  @override
  Future<Resource<List<Repuesto>>> fetchRepuestos() {
    return authServices.fetchRepuestos();  // Llama al método de AuthServices que hace la solicitud GET
  }

  // Implementación del método para obtener los detalles de un repuesto específico
  @override
  Future<Resource<Repuesto>> fetchRepuestoDetail(int partId) {
    return authServices.fetchRepuestoDetail(partId); // Llama al método de AuthServices para obtener el detalle del repuesto
  }
}
