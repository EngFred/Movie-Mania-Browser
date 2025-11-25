# MMB - Movie Mania Browser 🎬

![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0%2B-0175C2?logo=dart)
![Architecture](https://img.shields.io/badge/Architecture-Clean-success)
![State Management](https://img.shields.io/badge/State-Riverpod-purple)
![License](https://img.shields.io/badge/License-MIT-yellow)

**Movie Mania Browser (MMB)** is a robust, scalable Flutter application designed to provide a seamless movie discovery experience. Built with **Clean Architecture** principles, MMB fetches real-time data from the [TMDB API](https://www.themoviedb.org/) to allow users to explore popular films, search for favorites, and manage a local watchlist.

This project demonstrates modern Android/iOS development practices, including separation of concerns, dependency injection via Riverpod, and offline caching with Floor.

---

## 📱 App Screenshots

<p align="center">
  <img src="https://github.com/EngFred/Movie-Mania-Browser/assets/136785545/9f174e28-bda4-42da-ad94-f61b450c9327" alt="MMB App Screenshots" width="100%">
</p>

---

## ✨ Key Features

- **🚀 Popular Movies:** Fetches and displays a curated list of popular movies from the TMDB API with seamless infinite scrolling (pagination).
- **🔍 Smart Search:** Instantly find specific movies by title or keyword.
- **💾 Persistent Watchlist:** Users can save movies to a local watchlist using **Floor** database, allowing access to favorites even when offline.
- **🎞️ Rich Media:** View high-resolution posters, synopses, cast details, and watch trailers directly within the app.
- **🎨 Responsive Design:** A polished UI that adapts to different screen sizes.

---

## 🛠️ Architecture

MMB is built using the **Clean Architecture** pattern to ensure the codebase remains testable, maintainable, and scalable. The app is divided into three distinct layers:

### 1. Presentation Layer
- **Responsibility:** Manages the UI and user interactions.
- **State Management:** Utilizes **Riverpod** to manage state reactively and separate business logic from UI widgets.

### 2. Domain Layer (The Core)
- **Responsibility:** Contains the business logic, Entities, and Use Cases.
- **Independence:** This layer is completely isolated from external libraries, frameworks, or data sources.

### 3. Data Layer
- **Responsibility:** Handles data retrieval and storage.
- **Components:**
  - **Remote:** Uses **Chopper** for efficient API communication with TMDB.
  - **Local:** Uses **Floor** (SQLite abstraction) for caching and persisting the watchlist.
  - **Models:** Handles JSON serialization/deserialization via `json_serializable`.

---

## 🧰 Technologies & Libraries

| Category | Technology | Description |
| :--- | :--- | :--- |
| **Core** | [Flutter](https://flutter.dev/) | UI Toolkit for building natively compiled applications. |
| **State Management** | [Riverpod](https://riverpod.dev/) | A reactive caching and data-binding framework. |
| **Networking** | [Chopper](https://pub.dev/packages/chopper) | HTTP client generator for Dart. |
| **Local Storage** | [Floor](https://pub.dev/packages/floor) | A clear and concise SQLite abstraction for Flutter. |
| **Serialization** | [json_serializable](https://pub.dev/packages/json_serializable) | Automates JSON serialization code. |
| **Pagination** | [infinite_scroll_pagination](https://pub.dev/packages/infinite_scroll_pagination) | Lazily load and display data in chunks. |

---

## 🚀 Setup and Installation

To get a local copy up and running, follow these simple steps.

### 1. Clone the Repository
```bash
git clone [https://github.com/EngFred/mmb.git](https://github.com/EngFred/mmb.git)
cd mmb
```

2. **Open the Project:**
    Open the project in your preferred IDE (e.g., VSCode, Android Studio).

3. **Install Dependencies:**
    ```sh
    flutter pub get
    ```

4. **Configure TMDB API Key:**
    - Obtain an API key from [TMDB](https://www.themoviedb.org/).
    - Add the API key to your project (e.g., in a `.env` file or directly in the code).

5. **Build and Run:**
    - Run the app on an emulator or a physical device:
      ```sh
      flutter run
      ```

## Usage

- **Browsing Movies:** Navigate through the list of popular movies, with automatic pagination as you scroll.
- **Searching Movies:** Use the search feature to find specific movies by title.
- **Adding to Watchlist:** Add movies to your watchlist for easy access later.
- **Viewing Details:** Click on a movie to see detailed information and watch trailers.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Special thanks to [TMDB](https://www.themoviedb.org/) for providing access to their extensive movie database.
- Thanks to the Flutter community for their contributions and support.
- Inspired by clean architecture principles to create a maintainable and scalable application.

---

Explore the world of movies with MMB! Discover popular films, keep track of your watchlist, and enjoy a seamless movie-browsing experience.


