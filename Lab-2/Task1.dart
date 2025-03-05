/*
  1. Build a Simple To-Do List App
*/

import 'dart:io';

void main() {
  List<String> tasks = [];

  while (true) {
    print('\n1. Add a task');
    print('2. View tasks');
    print('3. Remove a task');
    print('4. Exit');
    stdout.write('Choose an option: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter the task: ');
        String? task = stdin.readLineSync();
        if (task != null && task.isNotEmpty) {
          tasks.add(task);
          print('Task added.');
        } else {
          print('Task cannot be empty!');
        }
        break;
      case '2':
        if (tasks.isEmpty) {
          print('No tasks available.');
        } else {
          print('\nTo-Do List:');
          for (int i = 0; i < tasks.length; i++) {
            print('${i + 1}. ${tasks[i]}');
          }
        }
        break;
      case '3':
        if (tasks.isEmpty) {
          print('No tasks to remove.');
          break;
        }
        stdout.write('Enter task number to remove: ');
        String? indexInput = stdin.readLineSync();
        int? index = int.tryParse(indexInput ?? '');
        if (index != null && index > 0 && index <= tasks.length) {
          print('Removed: ${tasks.removeAt(index - 1)}');
        } else {
          print('Invalid task number!');
        }
        break;
      case '4':
        print('Exiting...');
        return;
      default:
        print('Invalid option. Please choose again.');
    }
  }
}
