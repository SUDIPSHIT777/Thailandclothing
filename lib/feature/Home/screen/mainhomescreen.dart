import 'package:flutter/material.dart';
import 'package:thailand_clothing/feature/Home/widget/silverappbarwidget.dart';

class Mainhomescreen extends StatelessWidget {
  const Mainhomescreen({super.key});

  static const List<Map<String, String>> _categories = [
    {
      'img': 'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=160&h=160&fit=crop',
      'label': 'Beauty of Bikini',
    },
    {
      'img': 'https://images.unsplash.com/photo-1485230895905-ec40ba36b9bc?w=160&h=160&fit=crop',
      'label': 'Traditional',
    },
    {
      'img': 'https://images.unsplash.com/photo-1529139574466-a303027c1d8b?w=160&h=160&fit=crop',
      'label': 'Couple Ware',
    },
    {
      'img': 'https://images.unsplash.com/photo-1539109136881-3be0616acf4b?w=160&h=160&fit=crop',
      'label': 'Couple',
    },
    {
      'img': 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?w=160&h=160&fit=crop',
      'label': 'Hot',
    },
    {
      'img': 'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=160&h=160&fit=crop',
      'label': 'Sharee',
    },
    {
      'img': 'https://images.unsplash.com/photo-1509631179647-0177331693ae?w=160&h=160&fit=crop',
      'label': 'Western Wear',
    },
    {
      'img': 'https://images.unsplash.com/photo-1525507119028-ed4c629a60a3?w=160&h=160&fit=crop',
      'label': 'New Arrivals',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HomeSliverAppBar(categories: _categories),

          SliverToBoxAdapter(
            child: CategoryAvatarSection(categories: _categories),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item $index')),
              childCount: 40,
            ),
          ),
        ],
      ),
    );
  }
}
