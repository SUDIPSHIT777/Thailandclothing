import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thailand_clothing/core/router/approute.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              'My Account',
              style: TextStyle(
                color: AppColors.darkText,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(width: 12),
            Icon(Icons.edit_outlined, color: AppColors.purple, size: 20),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        children: [
          // Profile Header
          Row(
            children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: AppColors.lightPurple,
                child: ClipOval(
                  child: Image.network(
                    'https://i.pravatar.cc/150?img=12',
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(
                        width: 72,
                        height: 72,
                        child: Icon(
                          Icons.person,
                          size: 36,
                          color: AppColors.purple,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Shravan Kumar',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'shravan.kumar@email.com',
                      style: TextStyle(color: AppColors.greyText, fontSize: 13),
                    ),
                    const SizedBox(height: 6),
                    GestureDetector(
                      onTap: () => context.push(AppRouter.editprofile),
                      child: const Text(
                        'Edit profile',
                        style: TextStyle(
                          color: Color(0xFF2196F3),
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // VIP Special Card
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFDF2),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFFDE08D), width: 1.2),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'VIP SPECIAL',
                  style: TextStyle(
                    color: AppColors.purple,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'A little luxury. More rewards.',
                  style: TextStyle(
                    color: AppColors.darkText,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Extra 5% off on your favourite styles',
                  style: TextStyle(color: AppColors.greyText, fontSize: 13),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Explore VIP benefits',
                      style: TextStyle(
                        color: AppColors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward,
                      color: AppColors.purple,
                      size: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Quick Action Cards
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => context.push(AppRouter.myordersScreen),
                  child: const _QuickActionCard(
                    icon: Icons.shopping_bag_outlined,
                    label: 'My Orders',
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () => context.push(AppRouter.wishlistscreen),
                  child: _QuickActionCard(
                    icon: Icons.favorite_border,
                    label: 'Wishlist',
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () => context.push(AppRouter.delivery),
                  child: _QuickActionCard(
                    icon: Icons.location_on_outlined,
                    label: 'Addresses',
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          // Account Section Title
          const Text(
            'YOUR ACCOUNT',
            style: TextStyle(
              color: AppColors.greyText,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.6,
            ),
          ),

          const SizedBox(height: 12),

          // Account Menu Items
          const _AccountTile(
            icon: Icons.person_outline,
            title: 'Personal information',
            subtitle: 'Name, email and mobile number',
          ),
          GestureDetector(
            onTap: () => context.push(AppRouter.delivery),
            child: const _AccountTile(
              icon: Icons.location_on_outlined,
              title: 'Saved addresses',
              subtitle: 'Manage your delivery locations',
            ),
          ),
          const _AccountTile(
            icon: Icons.shopping_bag_outlined,
            title: 'Payment methods',
            subtitle: 'Cards and payment preferences',
          ),
          const _AccountTile(
            icon: Icons.notifications_none_outlined,
            title: 'Notifications',
            subtitle: 'Offers and order updates',
          ),
          const _AccountTile(
            icon: Icons.help_outline,
            title: 'Help & support',
            subtitle: "We're here to help",
          ),

          const SizedBox(height: 5),

          TextButton(
            onPressed: () {
              // Handle logout
            },
            style: TextButton.styleFrom(
              foregroundColor: AppColors.purple,
              padding: const EdgeInsets.symmetric(vertical: 8),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: const Row(
              children: [
                Icon(Icons.logout, size: 24),
                SizedBox(width: 16),
                Text(
                  'Log out',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const _QuickActionCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    // Expanded is intentionally removed from this widget.
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.lightPurple,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.purple, size: 26),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.darkText,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _AccountTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _AccountTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 2),
      leading: Icon(icon, color: AppColors.purple, size: 26),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.darkText,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: AppColors.greyText, fontSize: 12),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: AppColors.greyText,
        size: 24,
      ),
    );
  }
}
