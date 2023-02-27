import 'package:flutter/material.dart';
import 'package:productivity_app/modules/habits/providers/habits_provider.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CreateHabitView extends StatelessWidget {
  late HabitsProvider habitsProvider;

  CreateHabitView({super.key});

  @override
  Widget build(BuildContext context) {
    habitsProvider = Provider.of<HabitsProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ReactiveForm(
            formGroup: habitsProvider.createForm,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [
                const Text('Create a habit'),
                const SizedBox(
                  height: 12,
                ),
                ReactiveTextField(
                  formControlName: 'name',
                  decoration: const InputDecoration(
                    hintText: "Name",
                    prefixIcon: Icon(Icons.person_outline_rounded),
                  ),
                  validationMessages: {'required': (error) => 'Required'},
                ),
                ReactiveTextField(
                  formControlName: 'unit',
                  decoration: const InputDecoration(
                    hintText: "Unit",
                    prefixIcon: Icon(Icons.tapas_rounded),
                  ),
                ),
                ReactiveTextField(
                  formControlName: 'desired',
                  decoration: const InputDecoration(
                    hintText: "Desired",
                    prefixIcon: Icon(Icons.description),
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextButton(
                  child: const Text('Create'),
                  onPressed: () async => await habitsProvider.createHabit(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
