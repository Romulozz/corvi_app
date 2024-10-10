import 'package:flutter/material.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 4, // Número de productos en el carrito
                itemBuilder: (context, index) {
                  return _buildCartItem();
                },
              ),
            ),
            Divider(thickness: 1, color: Colors.grey[300]),
            _buildSummarySection(),
            SizedBox(height: 10),
            _buildPayButton(),
          ],
        ),
      ),
    );
  }

  // Widget para construir cada producto en el carrito
  Widget _buildCartItem() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: const Color.fromARGB(
          255, 233, 233, 233), // Color del fondo con sombreado
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              'https://via.placeholder.com/80', // Imagen de ejemplo, reemplazar con la imagen real del producto
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nombre de Repuestos',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '220.0 V',
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          Color(0xFF7A7A7A), // Color gris oscuro para el texto
                    ),
                  ),
                  Text(
                    'S/. 20.00',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.amber[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    // Lógica para disminuir la cantidad
                  },
                ),
                Text(
                  '3', // Cantidad del producto
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: Icon(Icons.add_circle_outline),
                  onPressed: () {
                    // Lógica para aumentar la cantidad
                  },
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                // Lógica para eliminar el producto del carrito
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget para construir la sección de resumen de la compra
  Widget _buildSummarySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          _buildSummaryRow('Subtotal:', 'S/. 2098.00'),
          _buildSummaryRow('Envío:', 'S/. 18.00'),
          _buildSummaryRow(
            'Total:',
            'S/. 2116.00',
            isTotal: true,
          ),
        ],
      ),
    );
  }

  // Widget para construir cada fila en el resumen (Subtotal, Envío, Total)
  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  // Widget para construir el botón de pagar
  Widget _buildPayButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Lógica para proceder al pago
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey, // Color del botón
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          'Pagar',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
