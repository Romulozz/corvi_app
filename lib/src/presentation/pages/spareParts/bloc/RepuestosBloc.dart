import 'package:corvi_app/src/domain/models/Repuestos.dart';
import 'package:corvi_app/src/domain/utils/Resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:corvi_app/src/domain/useCases/auth/AuthUseCases.dart'; // Usando AuthUseCases como en LoginBloc
import 'RepuestosEvent.dart';
import 'RepuestosState.dart';

class RepuestosBloc extends Bloc<RepuestosEvent, RepuestosState> {
  final AuthUseCases authUseCases; // Casos de uso

  RepuestosBloc(this.authUseCases) : super(RepuestosInitial()) {
    on<FetchRepuestos>(_onFetchRepuestos);
  }

  // Manejar el evento FetchRepuestos
  Future<void> _onFetchRepuestos(
      FetchRepuestos event, Emitter<RepuestosState> emit) async {
    emit(RepuestosLoading());

    // Llamar a AuthUseCases para obtener los repuestos
    final response = await authUseCases.repuestos.getRepuestos();

    // Registrar el contenido de la respuesta para depuración
    print(
        'Respuesta del backend: $response'); // Esto imprimirá la respuesta completa

    // Verificar si la respuesta es un éxito
    if (response is Success<List<Repuesto>>) {
      // Registrar los repuestos recibidos
      print(
          'Repuestos recibidos: ${response.data}'); // Esto imprimirá los datos específicos de los repuestos

      emit(RepuestosLoaded(response.data)); // Accedemos a 'data' si es Success
    } else if (response is Error) {
      // Registrar el error
      print(
          'Error al obtener repuestos: ${(response as Error).message}'); // Esto imprimirá el mensaje de error

      emit(RepuestosError((response as Error).message)); // Manejar el error
    }
  }
}
