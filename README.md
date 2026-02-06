# Square Employee Directory (iOS)

**Status:** Complete
**Tech Stack:** Swift 5, UIKit, XCTest, URLSession (No 3rd Party Libraries)

## 🚀 Overview
This application is a native iOS directory that fetches, parses, and displays employee data from a remote JSON endpoint. It was engineered to demonstrate **production-grade architecture**, specifically focusing on robust error handling, memory management, and testability without relying on external dependencies like Alamofire or Kingfisher.

## 🏗 Architecture (MVVM)
I utilized the **Model-View-ViewModel (MVVM)** pattern to strictly separate business logic from UI code.
* **ViewModel:** Owns the state (employee array, loading status, error states). It binds to the View Controller via closures/delegates.
* **Service Layer:** A dedicated `NetworkManager` singleton handles API calls, ensuring the networking logic is decoupled and mockable for unit tests.
* **Dependency Injection:** Services are injected into ViewModels, allowing for easy swapping of mock data during XCTest execution.

## 🛠 Key Engineering Features

### 1. Custom Image Caching System
Instead of using a library, I built a lightweight `ImageCache` utilizing `NSCache`.
* **Why:** To ensure smooth scrolling performance (60fps) by preventing redundant network requests for images that have already been downloaded.
* **Thread Safety:** All cache writes are thread-safe, and image decoding happens on a background queue to keep the main thread unblocked.

### 2. Malformed Data Handling
The API response is treated as "untrusted."
* The parser explicitly filters out incomplete or malformed JSON objects.
* If a single employee record is missing a required field (like `uuid`), the app gracefully discards that specific record rather than crashing the entire batch.

### 3. Unit Testing Strategy
Leveraging `XCTest` to verify business logic correctness:
* **Network Tests:** Verifies successful JSON parsing and failure states (e.g., empty list, timeout).
* **ViewModel Tests:** Ensures the View Model correctly updates its state (e.g., `isLoading` toggles true/false) during the data fetch lifecycle.

## 📱 How to Run
1.  Clone the repository.
2.  Open `SquareEmployeeDirectory.xcodeproj` in Xcode (15.0+ recommended).
3.  Press `Cmd+U` to run the test suite (Verify logic).
4.  Press `Cmd+R` to run the app in Simulator.

## 🧠 Trade-offs & Decisions
* **UIKit vs SwiftUI:** I chose UIKit for this implementation to demonstrate deep understanding of the iOS lifecycle and constraints/anchors, though the architecture is compatible with a SwiftUI migration.
* **No Third-Party Libs:** Deliberate choice to show raw understanding of `URLSession` and `Codable` rather than abstracting it away.

---
*Built by Alexander Adegbenro*
