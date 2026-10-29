import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thailand_clothing/core/router/approute.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';

Future<void> showDeliveryLocationBottomSheet(
  BuildContext context, {
  String initialPincode = '721134',
  String savedName = 'Sagar Das',
  String savedAddress = 'Nearby Spencer Road, 142, Yun Road, Dumdum',
  String addressTag = 'OFFICE',
}) async {
  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (sheetContext) {
      return Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(sheetContext).size.height * 0.90,
        ),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Centered close button
              SizedBox(
                height: 34,
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 34,
                      minHeight: 34,
                    ),
                    onPressed: () => Navigator.of(sheetContext).pop(),
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.iconGrey,
                      size: 30,
                    ),
                  ),
                ),
              ),

              // Location permission banner
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.lightPurpleBg,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 23,
                      height: 23,
                      decoration: BoxDecoration(
                        color: AppColors.locationRed,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(
                        Icons.my_location,
                        color: AppColors.white,
                        size: 15,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location permission is off',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.darkText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Granting location permission will ensure accurate address and hassle free delivery',
                            style: TextStyle(
                              fontSize: 11,
                              height: 1.3,
                              color: AppColors.greyText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.locationRed,
                          foregroundColor: AppColors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: const Text(
                          'Grant',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Select delivery location
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select Delivery Location',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkText,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Pincode field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 56,
                  padding: const EdgeInsets.only(left: 22, right: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderGrey, width: 1.4),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          initialPincode,
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.darkText,
                          ),
                        ),
                      ),
                      const Text(
                        'Check Pincode',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.clearBtnGrey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 17),

              // Search location
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: AppColors.locationRed,
                      size: 22,
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () => context.pushReplacement(AppRouter.delivery),
                      child: Text(
                        'Search location',
                        style: TextStyle(
                          color: AppColors.locationRed,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: AppColors.locationRed,
                      size: 20,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // OR divider
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.borderGrey,
                        thickness: 1.2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        'Or',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.darkText,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.borderGrey,
                        thickness: 1.2,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Saved address heading
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select Save Address',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkText,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Saved address card
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderGrey, width: 1.4),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: AppColors.iconGrey,
                        size: 17,
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    '$savedName, $initialPincode',
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: AppColors.textDark,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.tagBg,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    addressTag,
                                    style: const TextStyle(
                                      color: AppColors.tagText,
                                      fontSize: 9,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              savedAddress,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppColors.subtitleGrey,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.task_alt,
                        color: AppColors.tagText,
                        size: 22,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
