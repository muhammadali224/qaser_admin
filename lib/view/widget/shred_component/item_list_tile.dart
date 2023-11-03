import 'package:flutter/material.dart';

import 'popup_edit_delete.dart';

class ItemListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function()? onEditTap;
  final void Function()? onDeleteTap;
  final void Function()? onTap;
  final Widget? trailing;

  const ItemListTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.onEditTap,
    this.onDeleteTap,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Material(
        color: Colors.white,
        elevation: 15,
        child: ListTile(
          onTap: onTap ?? () {},
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
          trailing: trailing ??
              PopMenuEditDelete(
                onEditTap: onEditTap ?? () {},
                onDeleteTap: onDeleteTap ?? () {},
              ),
        ),
      ),
    );
  }
}
