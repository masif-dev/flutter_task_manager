# Flutter Task Manager

Flutter Task Manager is a simple task management application that allows users to create, view, and
delete tasks. It demonstrates the use of Clean Architecture principles and the BLoC pattern for
state management, along with SQLite for data storage.

## Features

- Task Listing: Display a list of tasks with a title and delete button.
- Add Task: Add a new task using a simple form with a text field for the task title.
- Delete Task: Delete a task from the list.

## Dependencies

- flutter_bloc: ^8.1.5
- equatable: ^2.0.5
- sqflite: ^2.3.3
- uuid: ^4.4.0
- path: ^1.9.0

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/masif-dev/flutter_task_manager.git

2. Install dependencies:
   flutter pub get

3. Run the application:
   flutter run

## Architecture

The project follows Clean Architecture principles with the following layers:

Presentation: Contains UI components, including widgets and pages.
Domain: Contains business logic and use cases.
Data: Contains implementations of repositories and data sources.
Database
Tasks are stored in a SQLite database using the sqflite package. The DatabaseHelper class provides
methods for database initialization and access.

## Contributors

Muhammad Asif masif.dev@hotmail.com