import 'package:bookmyshow/profilepage/cardgenerator/screens/orders_screen.dart';
import 'package:flutter/material.dart';

class CardDetails {
  String? text = "";
  String? description = "";
  final icon;
  Function? navigation;
  CardDetails({this.text, this.description, this.icon, this.navigation});
}

List<CardDetails> cards = [
  CardDetails(
      text: 'Restaurant Discounts',
      //description: 'View all your bookings & purchase',
      icon: Icons.discount_outlined),
  CardDetails(
      text: 'Discount Store',
      //description: 'Rented, Purchased and Downloaded movies',
      icon: Icons.store_outlined),
  CardDetails(
      text: 'Rewards',
      description: 'View your rewards & unlock new ones',
      icon: Icons.card_giftcard_outlined),
  CardDetails(
      text: 'Offers',
      //description: 'View commonly asked queries and Chat',
      icon: Icons.local_offer_outlined),
  CardDetails(
      text: 'Gift & Cards',
      //description: 'Location, Payments, Addresses & More',
      icon: Icons.wallet_giftcard_outlined),
  CardDetails(
      text: 'Food & Beverages',
      //description: 'View your rewards & unlock new ones',
      icon: Icons.food_bank_outlined),
  CardDetails(
      text: 'List your Show',
      description: 'Got an event? Partner with us',
      icon: Icons.shop_two_outlined),
];

Future pageNavigation(BuildContext context) {
  return Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => OrdersPage(),
  ));
}

List<CardDetails> card2 = [
  CardDetails(
      text: 'Your Orders',
      description: 'View all your bookings & purchase',
      icon: Icons.shopping_bag_outlined,
      navigation: () {}),
  CardDetails(
      text: 'Stream Library',
      description: 'Rented, Purchased and Downloaded movies',
      icon: Icons.library_add_outlined),
  CardDetails(
      text: 'Play Credit Card',
      description: 'View your Play Credit Card details and offers',
      icon: Icons.support_outlined),
  CardDetails(
      text: 'Help & Support',
      description: 'View commonly asked queries and Chat',
      icon: Icons.discount_outlined),
  CardDetails(
      text: 'Accounts & Settings',
      description: 'Location, Payments, Addresses & More',
      icon: Icons.settings_outlined)
];
