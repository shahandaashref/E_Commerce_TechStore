
  import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

Padding featureTable() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(3)},
        border: TableBorder.symmetric(
          inside: BorderSide(color: ECommerceAppTheme.border, width: 1.0),
          outside: BorderSide(color: ECommerceAppTheme.border, width: 1.0),
        ),

        children: [
          buildTableRow(feature: "Feature 1", value: "Value 1"),
          buildTableRow(feature: "Feature 1", value: "Value 1"),
          buildTableRow(feature: "Feature 1", value: "Value 1"),
        ],
      ),
    );
  }

  
  TableRow buildTableRow({required String feature, required String value}) {
    return TableRow(
      children: [
        Padding(padding: const EdgeInsets.all(8.0), child: Text(feature)),
        Padding(padding: const EdgeInsets.all(8.0), child: Text(value)),
      ],
    );
  }

