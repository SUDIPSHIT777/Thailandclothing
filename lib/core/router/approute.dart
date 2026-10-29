import 'package:go_router/go_router.dart';
import 'package:thailand_clothing/feature/Bottomnav/bottomnavbar.dart';
import 'package:thailand_clothing/feature/Deliveryaddress/deliveryaddress.dart';
import 'package:thailand_clothing/feature/Home/screen/mainhomescreen.dart';
import 'package:thailand_clothing/feature/Notification/notification.dart';
import 'package:thailand_clothing/feature/Profile/screen/CancleOrder/cancleorder.dart';
import 'package:thailand_clothing/feature/Profile/screen/Confirmcancel/confirmcancel.dart';
import 'package:thailand_clothing/feature/Profile/screen/DeliveredOrder/deliveredorder.dart';
import 'package:thailand_clothing/feature/Profile/screen/Editprofile/editprofile.dart';
import 'package:thailand_clothing/feature/Profile/screen/FinalCancelled/finalcancelledscreen.dart';
import 'package:thailand_clothing/feature/Profile/screen/Myorders/myordersScreen.dart';
import 'package:thailand_clothing/feature/Profile/screen/Orderdetails/orderdetails.dart';
import 'package:thailand_clothing/feature/Profile/screen/ProfileScreen/profilescreen.dart';
import 'package:thailand_clothing/feature/Profile/screen/Refunddetails/refunddetails.dart';
import 'package:thailand_clothing/feature/Profile/screen/ReturnExchnage/returnexchangescreen.dart';
import 'package:thailand_clothing/feature/Profile/screen/ReturnRequest/returnrequest.dart';
import 'package:thailand_clothing/feature/Profile/screen/ReturnStatus/returnstatus.dart';
import 'package:thailand_clothing/feature/Profile/screen/TrackOrder/trackorder.dart';
import 'package:thailand_clothing/feature/Profile/screen/WriteandReview/writeandreview.dart';
import 'package:thailand_clothing/feature/ShoppingBag/shoppingbag.dart';
import 'package:thailand_clothing/feature/Wishlist/screen/CollectionScreen/collectionnotavilablescreen.dart';
import 'package:thailand_clothing/feature/Wishlist/screen/CollectionScreen/collectionscreen.dart';
import 'package:thailand_clothing/feature/Wishlist/screen/Createcollection/createcollection.dart';
import 'package:thailand_clothing/feature/Wishlist/screen/OutofStock/outofstock.dart';
import 'package:thailand_clothing/feature/Wishlist/screen/Wishlistscreen/wishlistscreen.dart';

class AppRouter {
  AppRouter._();
  static const String bottomnavbar = '/';
  static const String homescreen = '/Homescreen';
  static const String delivery = '/delivery';
  static const String notification = "/NotificationsScreen";
  static const String profile = "/Profilescreen";
  static const String editprofile = "/EditProfileScreen";
  static const String myordersScreen = "/MyOrdersScreen";
  static const String orderdetails = "/Orderdetails";
  static const String trackOrderScreen = "/TrackOrderScreen";
  static const String deliveredorderScreen = "/DeliveredOrderScreen";
  static const String cancelorderScreen = "/CancelOrderScreen";
  static const String confirmcancelOrderScreen = "/ConfirmcanCelOrderScreen";
  static const String finalordercancel = "/OrderCancelledScreen";
  static const String returnexchangeScreen = "/ReturnExchangeScreen";
  static const String returnreasonScreen = "/ReturnReasonScreen";
  static const String returnprogressScreen = "/ReturnProgressScreen";
  static const String refunddetailsScreen = "/RefundDetailsScreen";
  static const String ratereviewScreen = "/RateReviewScreen";
  static const String wishlistscreen = "/Wishlistscreen";
  static const String outOfstockScreen = "/OutOfStockScreen";
  static const String collectionnotavilablescreen =
      "/Collectionnotavilablescreen";
  static const String createCollectionSheet = "/CreateCollectionSheet";
  static const String collectionscreen = "/Collectionscreen";
  static const String shoppingBagScreen = "/ShoppingBagScreen";

  static final GoRouter router = GoRouter(
    initialLocation: bottomnavbar,
    routes: [
      GoRoute(
        path: bottomnavbar,
        builder: (context, state) => const BottomNavBar(),
      ),
      GoRoute(
        path: homescreen,
        builder: (context, state) => const Mainhomescreen(),
      ),
      GoRoute(
        path: delivery,
        builder: (context, state) => const SelectDeliveryAddressScreen(),
      ),
      GoRoute(
        path: notification,
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: profile,
        builder: (context, state) => const Profilescreen(),
      ),
      GoRoute(
        path: editprofile,
        builder: (context, state) => EditProfileScreen(),
      ),
      GoRoute(
        path: myordersScreen,
        builder: (context, state) => MyOrdersScreen(),
      ),
      GoRoute(path: orderdetails, builder: (context, state) => Orderdetails()),
      GoRoute(
        path: trackOrderScreen,
        builder: (context, state) => TrackOrderScreen(),
      ),
      GoRoute(
        path: deliveredorderScreen,
        builder: (context, state) => DeliveredOrderScreen(),
      ),
      GoRoute(
        path: cancelorderScreen,
        builder: (context, state) => CancelOrderScreen(),
      ),
      GoRoute(
        path: confirmcancelOrderScreen,
        builder: (context, state) => ConfirmCancelOrderScreen(),
      ),
      GoRoute(
        path: finalordercancel,
        builder: (context, state) => FinalOrderCancelledScreen(),
      ),
      GoRoute(
        path: returnexchangeScreen,
        builder: (context, state) => ReturnExchangeScreen(),
      ),
      GoRoute(
        path: returnreasonScreen,
        builder: (context, state) => ReturnReasonScreen(),
      ),
      GoRoute(
        path: returnprogressScreen,
        builder: (context, state) => ReturnProgressScreen(),
      ),
      GoRoute(
        path: refunddetailsScreen,
        builder: (context, state) => RefundDetailsScreen(),
      ),
      GoRoute(
        path: ratereviewScreen,
        builder: (context, state) => RateReviewScreen(),
      ),
      GoRoute(
        path: wishlistscreen,
        builder: (context, state) => WishlistScreen(),
      ),
      GoRoute(
        path: outOfstockScreen,
        builder: (context, state) => OutOfStockScreen(),
      ),
      GoRoute(
        path: collectionnotavilablescreen,
        builder: (context, state) => Collectionnotavilablescreen(),
      ),
      GoRoute(
        path: createCollectionSheet,
        builder: (context, state) => CreateCollectionSheet(),
      ),
      GoRoute(
        path: collectionscreen,
        builder: (context, state) => Collectionscreen(),
      ),
      GoRoute(
        path: shoppingBagScreen,
        builder: (context, state) => ShoppingBagScreen(),
      ),
    ],
  );
}
