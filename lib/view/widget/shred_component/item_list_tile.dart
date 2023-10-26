import 'package:flutter/material.dart';

import 'popup_edit_delete.dart';

class ItemListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function() onEditTap;
  final void Function() onDeleteTap;

  const ItemListTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onEditTap,
      required this.onDeleteTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      title: Container(
        margin: const EdgeInsets.all(10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      subtitle: Container(
        margin: const EdgeInsets.all(10),
        child: Text(
          subtitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      trailing: PopMenuEditDelete(
        onEditTap: onEditTap,
        onDeleteTap: onDeleteTap,
      ),
    );
  }
}
