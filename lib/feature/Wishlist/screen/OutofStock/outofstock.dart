import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';

class OutOfStockScreen extends StatelessWidget {
  const OutOfStockScreen({super.key});

  final List<Map<String, String>> _products = const [
    {
      'name': 'HIGHLANDER',
      'price': '₹851',
      'image': 'https://images.unsplash.com/photo-1617137968427-85924c800a22?w=500&q=80',
    },
    {
      'name': 'Powerlook',
      'price': '₹728',
      'image': 'https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=500&q=80',
    },
    {
      'name': 'HIGHLANDER',
      'price': '₹851',
      'image': 'https://images.unsplash.com/photo-1617137968427-85924c800a22?w=500&q=80',
    },
    {
      'name': 'Powerlook',
      'price': '₹728',
      'image': 'https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=500&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Color(0xFF252525),
          ),
        ),
        title: const Text(
          'Out of Stock',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF252525),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: Color(0xFFF0F0F0)),
        ),
      ),
      body: Column(
        children: [
          _buildCleanupBar(context),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(14, 6, 14, 16),
              itemCount: _products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 17,
                childAspectRatio: 0.57,
              ),
              itemBuilder: (context, index) {
                return _buildProductCard(context, _products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCleanupBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(9, 13, 9, 13),
      padding: const EdgeInsets.fromLTRB(12, 9, 8, 9),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Clean up out of stock items!',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
              ),
            ),
          ),
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Out of stock items removed')),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Text(
                  'Remove (7)',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Map<String, String> product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Product image with reduced blur.
                ImageFiltered(
                  imageFilter: ui.ImageFilter.blur(sigmaX: 1.2, sigmaY: 1.2),
                  child: Image.network(
                    product['image']!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFFD6D6CE),
                        child: const Icon(
                          Icons.checkroom_outlined,
                          size: 60,
                          color: Colors.white70,
                        ),
                      );
                    },
                  ),
                ),

                // Muted appearance for unavailable products.
                Container(color: Colors.black.withValues(alpha: 0.20)),

                // Out-of-stock label.
                Align(
                  alignment: const Alignment(0, -0.05),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    color: const Color(0xFF9E9E9E).withValues(alpha: 0.88),
                    child: const Text(
                      'OUT OF STOCK',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 0.6,
                      ),
                    ),
                  ),
                ),

                // Similar button.
                Positioned(
                  right: 9,
                  bottom: 9,
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Showing similar items for ${product['name']}',
                            ),
                          ),
                        );
                      },
                      child: const SizedBox(
                        width: 76,
                        height: 34,
                        child: Center(
                          child: Text(
                            'Similar',
                            style: TextStyle(
                              color: AppColors.locationRed,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 9),
        Text(
          product['name']!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Color(0xFF252525),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          product['price']!,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: Color(0xFF252525),
          ),
        ),
      ],
    );
  }
}
