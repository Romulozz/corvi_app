import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final VoidCallback
      onTap; // Añadimos una función de callback para manejar el clic

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.onTap, // Requerimos el callback como parámetro
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Ejecutamos la función callback cuando se hace clic
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200, // Ancho de la tarjeta
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), // Bordes redondeados
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4), // Sombra suave
                spreadRadius: 2,
                blurRadius: 7,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Ajuste dinámico de altura
            crossAxisAlignment: CrossAxisAlignment
                .stretch, // Aseguramos que ocupe todo el ancho
            children: [
              Expanded(
                // Usamos Expanded para que la imagen ocupe el espacio disponible
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(20), // Redondeamos la imagen
                  child: Image.network(
                    imagePath, // Imagen del producto
                    fit: BoxFit
                        .cover, // Ajuste de la imagen para cubrir el espacio disponible
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons
                          .error); // Icono en caso de error al cargar la imagen
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10), // Espacio entre la imagen y el texto
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0), // Padding para el texto
                child: Text(
                  productName, // Nombre del producto
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 16, // Tamaño del texto
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center, // Centrar el texto
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
