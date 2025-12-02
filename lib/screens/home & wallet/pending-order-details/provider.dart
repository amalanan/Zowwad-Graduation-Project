import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';

class OrderDetailsProvider extends ChangeNotifier {
  String? _selectedReason;
  String? get selectedReason => _selectedReason;
  void setReason(String value) {
    _selectedReason = value;
    notifyListeners();
  }

  final List<Map<String, String>> items = [
    {
      'title': 'Dove Nourishing Secrets Hydrating',
      'price': 'متوفر',
      'imagePath': uniBook,
    },
    {
      'title': 'Pantene Pro-V Smooth & Silky',
      'price': 'غير متوفر',
      'imagePath': uniBook,
    },
    {
      'title': 'Head & Shoulders Classic Clean',
      'price': 'متوفر',
      'imagePath': uniBook,
    },
    {
      'title': 'Herbal Essences Bio:Renew Coconut Milk',
      'price': 'متوفر',
      'imagePath': uniBook,
    },
    {
      'title': 'Garnier Fructis Damage Repair',
      'price': 'غير متوفر',
      'imagePath': uniBook,
    },
    {
      'title': 'L\'Oréal Elvive Total Repair 5',
      'price': 'متوفر',
      'imagePath': uniBook,
    },
    {'title': 'Tresemmé Moisture Rich', 'price': 'متوفر', 'imagePath': uniBook},
    {
      'title': 'Aveeno Pure Renewal',
      'price': 'غير متوفر',
      'imagePath': uniBook,
    },
    {
      'title': 'Sunsilk Shine & Strength',
      'price': 'متوفر',
      'imagePath': uniBook,
    },
    {
      'title': 'OGX Thick & Full Biotin & Collagen',
      'price': 'متوفر',
      'imagePath': uniBook,
    },
    {
      'title': 'John Frieda Frizz Ease',
      'price': 'غير متوفر',
      'imagePath': uniBook,
    },
    {
      'title': 'Neutrogena Anti-Residue Formula',
      'price': 'متوفر',
      'imagePath': uniBook,
    },
    {
      'title': 'Nexxus Therappe Rebalancing',
      'price': 'غير متوفر',
      'imagePath': uniBook,
    },
    {
      'title': 'Matrix Biolage Hydrasource',
      'price': 'متوفر',
      'imagePath': uniBook,
    },
  ];

  final List<Map<String, dynamic>> orderItems = [
    {
      "name": "Physics Book",
      "price": 4.99,
      "quantity": 2,
      "image": uniBook,
    },
    {
      "name": "Engineering Club",
      "price": 4.99,
      "quantity": 3,
      "image": uniBook,
    },
    {
      "name": "How to be Hacker in one Hour",
      "price": 999.99,
      "quantity": 1,
      "image": person,
    },
  ];
}
