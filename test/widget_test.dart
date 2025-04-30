// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_bottom_bar/main.dart';

void main() {
  testWidgets('BottomNavigationBar menampilkan halaman yang sesuai saat diklik',
      (WidgetTester tester) async {
    // Jalankan aplikasi
    await tester.pumpWidget(MyApp());

    // Pastikan halaman awal adalah Home
    expect(find.text('Home Page'), findsOneWidget); // Sesuaikan dengan widget di HomePage

    // Tap ikon Favorite
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pumpAndSettle();

    // Pastikan FavoritePage tampil
    expect(find.text('Favorite Page'), findsOneWidget); // Sesuaikan dengan widget di FavoritePage

    // Tap ikon Profile
    await tester.tap(find.byIcon(Icons.account_circle_sharp));
    await tester.pumpAndSettle();

    // Pastikan ProfilePage tampil
    expect(find.text('Profile Page'), findsOneWidget); // Sesuaikan dengan widget di ProfilePage
  });
}
