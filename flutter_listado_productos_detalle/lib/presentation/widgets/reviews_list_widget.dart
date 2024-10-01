import 'package:flutter/material.dart';

class ReviewsListWidget extends StatelessWidget {
  const ReviewsListWidget({
    super.key,
    required this.productoSel,
  });

  final Map<String, dynamic> productoSel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount:
            productoSel["reviews"].length, // Número total de ítems en la lista
        itemBuilder: (BuildContext context, int index) {
          String reviewerName = productoSel["reviews"][index]["reviewerName"];
          String initial = reviewerName.toUpperCase().substring(0, 1);
          return ListTile(
            leading: CircleAvatar(child: Text(initial)),
            title: Text(productoSel["reviews"][index]["comment"]),
            subtitle: Text(productoSel["reviews"][index]["reviewerEmail"]),
          );
        });
  }
}
