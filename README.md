# SwiftUI Pagination & Pull-to-Refresh

A clean and reusable SwiftUI implementation for **pagination (infinite scrolling)** and **pull-to-refresh**, built with modern Swift concurrency (`async/await`). Ideal for lists backed by remote APIs.

---

## ✨ Features

* 🔄 Pull-to-refresh using `.refreshable`
* 📜 Infinite scrolling (pagination)
* ⚡ Async/Await based networking
* 🧠 MVVM architecture
* 🛑 Prevents duplicate API calls
* 🧪 Easy to test and extend

---

## 🛠 Requirements

* iOS 15+
* Xcode 14+
* Swift 5.7+

---

## 📐 Architecture

The project follows **MVVM**:

* **View** → SwiftUI `List`
* **ViewModel** → Handles pagination & refresh logic
* **Service** → API / data source layer

---

## 🚀 Usage

### 1️⃣ ViewModel

Responsibilities:

* Track current page
* Handle loading states
* Fetch next page
* Refresh data


---

### 2️⃣ SwiftUI View

* Uses `List` for displaying data
* Triggers pagination when the last cell appears
* Uses `.refreshable` for pull-to-refresh

**Pagination trigger:**

* Detect last item using `onAppear`

**Pull-to-refresh:**

* Calls refresh method on ViewModel

---

## 🔄 Pull-to-Refresh Flow

1. User pulls down the list
2. `.refreshable` is triggered
3. Page resets to `1`
4. Existing data is cleared
5. Fresh data is loaded

---

## 📜 Pagination Flow

1. User scrolls to bottom
2. Last row appears
3. Next page API is called
4. New data is appended
5. Stops when no more pages

---

## 🧠 Best Practices Used

* Avoids multiple simultaneous API calls
* Handles empty and error states
* Keeps UI responsive with `@MainActor`
* Clean separation of concerns

---

## 📦 Example Use Cases

* Social feeds
* Product listings
* Search results
* Activity logs

---

## 🧪 Possible Enhancements

* Add loading shimmer
* Add retry on failure
* Integrate Combine
* Add unit tests

---

## 📄 License

This project is open-source and free to use for personal or commercial projects.

---

## 🙌 Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you’d like to change.

---

Happy coding 🚀
