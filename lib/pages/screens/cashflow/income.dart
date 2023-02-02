import 'package:cocreator/pages/screens/cashflow/widgets/card_total_income.dart';
import 'package:cocreator/pages/screens/cashflow/widgets/dropdown_buttons.dart';
import 'package:cocreator/pages/screens/cashflow/widgets/list_tile_income.dart';
import 'package:flutter/material.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CardTotalIncome(),
        SizedBox(
          height: 20,
        ),
        DropButtons(),
        ListtileIncome()
      ],
    );
  }
}
