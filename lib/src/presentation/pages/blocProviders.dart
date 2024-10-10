import 'package:corvi_app/src/presentation/pages/spareParts/bloc/RepuestosBloc.dart';
import 'package:corvi_app/src/presentation/pages/spareParts/bloc/RepuestosEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:corvi_app/injection.dart'; // Importa tu archivo de inyección de dependencias
import 'package:corvi_app/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:corvi_app/src/presentation/pages/descriptionParts/bloc/DescriptionPartsBloc.dart';
import 'package:corvi_app/src/presentation/pages/descriptionParts/bloc/DescriptionPartsEvent.dart';

// Aquí defines todos los BlocProviders de tu aplicación
List<BlocProvider> blocProviders = [
  // Proveedor del RepuestosBloc
  BlocProvider<RepuestosBloc>(
    create: (context) => RepuestosBloc(locator<AuthUseCases>())..add(FetchRepuestos()),
  ),
  // Proveedor del DescriptionPartsBloc
  BlocProvider<DescriptionPartsBloc>(
    create: (context) => DescriptionPartsBloc(locator<AuthUseCases>())..add(FetchPartDescription(1)), // Reemplaza '1' con el id del repuesto que corresponda
  ),
];
