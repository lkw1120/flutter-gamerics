# Gamerics

🎮 A Flutter app for discovering and managing your favorite games using the RAWG API.

## Screenshots

<!-- Add screenshots here -->
<img src="https://github.com/lkw1120/flutter-gamerics/blob/main/assets/images/snapshot_1.png" width="270" height="480"/><img src="https://github.com/lkw1120/flutter-gamerics/blob/main/assets/images/snapshot_2.png" width="270" height="480"/><img src="https://github.com/lkw1120/flutter-gamerics/blob/main/assets/images/snapshot_3.png" width="270" height="480"/>
</br>
<img src="https://github.com/lkw1120/flutter-gamerics/blob/main/assets/images/snapshot_4.png" width="270" height="480"/><img src="https://github.com/lkw1120/flutter-gamerics/blob/main/assets/images/snapshot_5.png" width="270" height="480"/><img src="https://github.com/lkw1120/flutter-gamerics/blob/main/assets/images/snapshot_6.png" width="270" height="480"/>

## Overview

Gamerics is a mobile application built with Flutter that helps you discover, search, and manage your favorite games. The app integrates with the RAWG API to provide comprehensive game information including details, screenshots, and trailers.

## Getting Started

Create a `.env` file in the root directory with your RAWG API key:

```env
RAWG_API_KEY=your_api_key_here
```

Get your API key from [RAWG.io](https://rawg.io/apidocs)

## Architecture

The project follows **Clean Architecture** principles with clear separation of concerns:

- **Domain Layer**: Core business entities and repository interfaces
- **Data Layer**: Data sources, repository implementations, and data models
- **Presentation Layer**: UI screens, viewmodels, and reusable widgets

The architecture includes:
- **13 Use Cases** for business logic encapsulation
- **Riverpod** for state management and dependency injection
- **Material3** UI design system

### Project Structure

- **`application/`** - Use cases containing business logic
- **`core/`** - Core utilities, theme configuration, and error handling
- **`data/`** - Data sources, repository implementations, and data models
- **`domain/`** - Domain entities and repository interfaces
- **`presentation/`** - UI screens, viewmodels, and reusable widgets
- **`providers/`** - Riverpod providers for dependency injection

## Tech Stack

- **Flutter** with Material3
- **Riverpod** for state management
- **Drift** (SQLite) for local database
- **Dio** for HTTP requests
- **GoRouter** for navigation
- **SharedPreferences** for simple key-value storage
- **Freezed** for immutable data classes

## Features

- **Game Discovery**: Browse games by categories, platforms, genres, and more
- **Search**: Search for games with real-time results
- **Collections**: Save favorites and track play status (Want to Play, Playing, Completed, Dropped)
- **Game Details**: View detailed information, screenshots, and trailers
- **Recent Searches**: Quick access to your recent search queries
- **Dark Mode**: Automatic theme switching based on system settings

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

```
Copyright 2026 lkw1120

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
