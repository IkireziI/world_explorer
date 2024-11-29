🌍 World Explorer
World Explorer is a mobile application built using Flutter that allows users to explore detailed information about countries around the world. It leverages the REST Countries API to provide data about countries, including flags, population, languages, and more. The app features seamless navigation, intuitive design, and user-friendly functionality.

✨ Features
Country List: Browse a list of all countries, displayed vertically in a clean and organized manner with country flags and regions.
Search Functionality: Search for any country and view detailed information, including:
Flag
Name (Full and short forms, e.g., "USA" for "United States of America")
Population
Languages spoken
Region and subregion
Favorites: Mark countries as favorites using a heart icon. Favorites are saved and displayed in a separate screen for quick access.
Comparison: Compare two countries side by side to view their details and similarities.
Dark Mode Design: Features a visually appealing black background for better readability and modern aesthetics.

🚀 Installation
Follow these steps to set up the project on your local machine:
Prerequisites
Flutter SDK installed.
Android Studio or Visual Studio Code with Flutter extension.
A device or emulator to run the app.
Steps
Clone the repository:

git clone https://github.com/IkireziI/world_explorer.git


Navigate to the project directory:

cd world-explorer


Fetch dependencies:

flutter pub get


Run the app:

flutter run



🛠️ Tech Stack
Flutter: UI framework for building the app.
Dart: Programming language used in Flutter.
REST Countries API: API for country data.

📱 Screenshots
Home Screen
Displays countries vertically, with flags, names, and regions.
Search Screen
Allows users to search for a country and view its details.
Favorites Screen
Displays a list of countries the user has marked as favorites.
Compare Screen
Allows comparison between two countries.

📂 Project Structure


lib/
├── main.dart               # Entry point of the app
├── screens/
│   ├── home_screen.dart    # Main screen displaying all countries
│   ├── search_screen.dart  # Screen for searching countries
│   ├── favorites_screen.dart # Screen for displaying favorites
│   ├── compare_screen.dart # Screen for comparing countries
│   ├── details_screen.dart # Screen for showing country details
├── widgets/
│   ├── country_card.dart   # Custom widget for displaying a country card
│   ├── favorites_list.dart # Custom widget for displaying favorites


⚙️ Configuration
Permissions
Ensure the following permissions are added to android/app/src/main/AndroidManifest.xml:


<uses-permission android:name="android.permission.INTERNET" />


🌐 API Information
This project uses the REST Countries API for fetching country data. You can view the API documentation here.

🚨 Known Issues and Fixes
App crashes on API calls: Ensure you’ve enabled cleartext traffic in AndroidManifest.xml.
Slow response from API: Test the API URL in Postman to verify response times.

🙌 Acknowledgments
Flutter
REST Countries API

💡 Future Enhancements
Offline Mode: Cache country data for offline access.
Localization: Support multiple languages for the app UI.
Theming: Add light and dark mode toggling.

🤝 Contributing
Contributions are welcome! Please fork the repository and submit a pull request with your changes.


💌 Contact
For any inquiries or suggestions, feel free to reach out:
Email: i.ikirezi@alustudent.com
GitHub: IkireziI

