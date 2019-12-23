
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spotify/genre/genre_screen.dart';

void main(){


  testWidgets('genre screen have Container', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: GenreScreen(),));
    var container = find.byType(Container);
    expect(container, findsOneWidget);
    
  });


}