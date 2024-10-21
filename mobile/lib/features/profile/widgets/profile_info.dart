import 'package:flutter/material.dart';
import 'package:qismati/common/colors.dart';

class ProfileInfo extends StatelessWidget {
  final String tableName;
  final Map<String, String>? tableData; // tabular data
  final String? data;   // text data

  const ProfileInfo({
    super.key,
    required this.tableName,
    this.tableData,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: CustomColors.primary,
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: CustomColors.primary,
            ),
            child: Text(
              tableName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomColors.textFieldBackground,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: tableData != null
                ? Column(
                    children: tableData!.entries
                        .map((entry) => _buildTableRow(entry.key, entry.value))
                        .toList(),
                  )
                : Text(data!),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
