# SwiftUI-Assignment
UI designed with SwiftUI, API integrated with Combine, local database used SwiftData, Local search history managed via UserDefaults, Location displayed in AppleMap


<img width="270" height="584" alt="Simulator Screenshot - iPhone 16e - 2026-01-25 at 14 34 56" src="https://github.com/user-attachments/assets/5bc9c76f-2f63-460f-b26d-7c4de95e20af" />
<img width="270" height="584" alt="Simulator Screenshot - iPhone 16e - 2026-01-25 at 14 34 39" src="https://github.com/user-attachments/assets/6ff624a4-aeb2-4da5-915f-f2fb6d0bbb70" />
<img width="270" height="584" alt="Simulator Screenshot - iPhone 16e - 2026-01-25 at 14 34 43" src="https://github.com/user-attachments/assets/0289a47d-87bd-4aaa-bbbc-ba74c32eb3c3" />


GeoPlaces Tracker 📍
A modern iOS 19 application built with SwiftUI, SwiftData, and MapKit that fetches geographical data from the GeoDB API and persists it locally for offline access.

🚀 Features
Real-time API Integration: Utilizes a custom APIRouter with Swift Concurrency (async/await/Combine) to fetch global city data.
SwiftData Persistence: Local storage using the latest @Model macros with automatic schema migration.
Interactive Mapping: Displays saved locations on Apple Maps using the native MapKit integration for SwiftUI.
Modern Networking: Type-safe URL construction via URLComponents for robust API communication.

🛠 Tech Stack
Framework: SwiftUI (iOS 17+)
Database: SwiftData
Networking: URLSession & Codable
Map Engine: MapKit
Language: Swift 6 (Strict Concurrency Enabled)

🏗 Project Structure
Models/: Contains the @Model definitions (e.g., GEOPlacesLocalData.swift) and API DTOs (GEOPlacesData.swift).
Networking/: The APIRouter instance class managing endpoint logic.
ViewModels/: @MainActor driven logic for bridging the API and SwiftData context.
Views/: SwiftUI views and MapKit implementation.
