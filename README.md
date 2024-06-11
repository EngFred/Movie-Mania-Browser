# MMB - Movie Mania Browser

MMB (Movie Mania Browser) is a Flutter application designed to fetch and display a list of popular movies using the TMDB (The Movie Database) API. It provides users with an engaging experience to discover, search, and manage their favorite movies. Users can add movies to their watchlist, view detailed information, and watch trailers, all within a robust and scalable app built with clean architecture principles.

## Features

- **Popular Movies:** Fetches and displays a list of popular movies from the TMDB API with seamless pagination.
- **Search Functionality:** Allows users to search for movies based on keywords.
- **Watchlist:** Users can add movies to their watchlist for future viewing.
- **Movie Details:** View detailed information about a movie, including trailers, cast, synopsis, and more.
- **Movie Trailers:** Watch movie trailers directly within the app.

## Architecture

MMB is built using the clean architecture pattern, ensuring a maintainable and scalable codebase. The application is divided into distinct layers:

- **Presentation Layer:** Manages the UI and user interactions using Riverpod for state management.
- **Domain Layer:** Contains the business logic and use cases.
- **Data Layer:** Handles data retrieval, caching, and persistence using Chopper for API communication and Floor for local storage.

## Technologies Used

- **Flutter:** Utilized for building a beautiful and responsive cross-platform UI.
- **Chopper:** Integrated for efficient networking and API communication with the TMDB API.
- **Floor:** Used for local storage to save movies to the watchlist.
- **Riverpod:** State management solution for managing the state of the application.
- **json_serializable:** For serializing and deserializing JSON data.
- **infinite_scroll_pagination:** To implement infinite scrolling for movie lists.

## Setup and Installation

To get started with MMB, follow these steps:

1. **Clone the Repository:**
    ```sh
    git clone https://github.com/EngFred/mmb.git
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


