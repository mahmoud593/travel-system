import 'package:flutter/material.dart';

BottomAppBar bottomNavigationBarWidget() {
  return BottomAppBar(
    shape: const CircularNotchedRectangle(),
    notchMargin: 5,
    child: SizedBox(
      height: 60,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
    ),
  );
}