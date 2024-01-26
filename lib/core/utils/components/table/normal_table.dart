import 'package:flutter/material.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

class CustomTable extends StatelessWidget {
  const CustomTable({super.key, required this.rows, required this.columns});

  final List<CustomTableRow> rows;
  final List<String> columns;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Theme(
        data: theme.copyWith(
            dataTableTheme: DataTableThemeData(
                headingRowColor:
                    const MaterialStatePropertyAll(AppColors.gray200),
                headingRowHeight: 48,
                columnSpacing: 16,
                dataRowMinHeight: 48,
                dividerThickness: 0,
                dataRowColor: const MaterialStatePropertyAll(Colors.white),
                headingTextStyle: theme.textTheme.bodyMedium,
                dataTextStyle: theme.textTheme.bodyMedium)),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: AppColors.gray200,
              height: 48,
            ),
            DataTable(
                columns: columns
                    .map((column) => DataColumn(label: Text(column)))
                    .toList(),
                rows: rows
                    .map((row) => DataRow(
                        cells: row.children
                            .map((cell) => DataCell(cell))
                            .toList()))
                    .toList()),
          ],
        ));
  }
}

class CustomTableRow {
  const CustomTableRow({required this.children});

  final List<Widget> children;
}
