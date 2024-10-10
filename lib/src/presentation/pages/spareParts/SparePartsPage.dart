import 'package:corvi_app/src/presentation/pages/spareParts/bloc/RepuestosBloc.dart';
import 'package:corvi_app/src/presentation/pages/spareParts/bloc/RepuestosState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:corvi_app/src/presentation/widgets/FilterChipWidget.dart';
import 'package:corvi_app/src/presentation/widgets/ProductCard.dart';
import 'package:corvi_app/src/presentation/widgets/SectionTitle.dart';

class SparePartsPage extends StatelessWidget {
  const SparePartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Bloque que escucha el estado de RepuestosBloc
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              // Cabecera con título y perfil
              _buildHeader(context),
              const SizedBox(height: 20),
              // Campo de búsqueda y botón de filtro
              _buildSearchAndFilterRow(),
              const SizedBox(height: 20),
              // Chips de filtro de categorías
              _buildFilterChips(),
              const SizedBox(height: 20),
              // Lista horizontal de repuestos
              SectionTitle(title: 'Repuestos'),
              const SizedBox(height: 10),
              BlocBuilder<RepuestosBloc, RepuestosState>(
                builder: (context, state) {
                  if (state is RepuestosLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is RepuestosLoaded) {
                    return _buildHorizontalListView(state.repuestos);
                  } else if (state is RepuestosError) {
                    return Center(child: Text('Error al cargar repuestos'));
                  }
                  return Container(); // Estado inicial
                },
              ),
              const SizedBox(height: 20),
              // Sección de Maquinaria
              SectionTitle(title: 'Reservar Maquinaria'),
              const SizedBox(height: 10),
              _buildHorizontalListView([]), // Temporariamente vacío
            ],
          ),
        ),
      ),
      // Barra de navegación inferior
    );
  }

  // Widget para construir el encabezado (logo y perfil)
  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CorviTrack',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: 'Oswald',
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
              Text(
                'Maquinaria a tu alcance, siempre.',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF7A7A7A),
                    ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Icon(
            Icons.account_circle,
            color: Colors.grey,
            size: 70,
          ),
        ),
      ],
    );
  }

  // Widget para construir el TextField de búsqueda y el botón de filtro
  Widget _buildSearchAndFilterRow() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 15,
                  offset: Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search, color: Colors.black, size: 30),
                hintText: 'Buscar',
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Oswald',
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFC107),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(10),
          child: Icon(Icons.tune, color: Colors.black, size: 30),
        ),
      ],
    );
  }

  // Widget para construir los Filter Chips
  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilterChipWidget(label: 'All', isSelected: true),
          FilterChipWidget(label: 'Excavación'),
          FilterChipWidget(label: 'Transporte'),
          FilterChipWidget(label: 'Cargadores'),
        ],
      ),
    );
  }

  // Widget para construir la lista horizontal
  Widget _buildHorizontalListView(List<dynamic> repuestos) {
    return SizedBox(
      height: 400, // Ajustamos el tamaño de las tarjetas
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: repuestos.length,
        itemBuilder: (context, index) {
          final repuesto = repuestos[index];
          return ProductCard(
            imagePath: repuesto.imagen,
            productName: repuesto.nombre,
            onTap: () {
              // Navegar a la página de descripción al hacer clic en la tarjeta
              Navigator.pushNamed(
                context,
                'descriptionParts',
                arguments:
                    repuesto.idRepuestos, // Asegúrate de pasar el id aquí
              );
            },
          ); // Suponiendo que tienes una imagen en el modelo
        },
      ),
    );
  }
}
