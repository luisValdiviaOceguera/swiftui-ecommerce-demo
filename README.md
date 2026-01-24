## 🚧 Work in Progress — actively evolving as part of my iOS job applications portfolio.

This project is part of my personal iOS portfolio.
Currently focused on building core screens and architecture using SwiftUI + MVVM.

### Overview
This project simulates a modern e-commerce iOS application built with SwiftUI and MVVM architecture.
The main goal is to showcase code structure, state management, and UI composition, rather than delivering a fully finished product.
The app currently focuses on:
  - Product catalog visualization
  - Product detail experience
  - Clean separation between UI, business logic, and data layer
  - Mocked backend services using local JSON files

### Architecture
The app follows MVVM (Model–View–ViewModel) with a clear separation of concerns:
View (SwiftUI)
   ↓
ViewModel (ObservableObject)
   ↓
Service (Mocked API)
   ↓
Local JSON

### Key Features Implemented
  - Product Catalog
    - Grid and List layouts
    - Reusable product card components
    - Dynamic layout switching
    - State-driven UI updates
    
  - Product Detail
    - Detailed product information
    - Image gallery support
    - Clean layout using SwiftUI stacks
    - Navigation-ready structure

  - Mocked Backend
    - Simulated API services
    - Local JSON files acting as backend responses
    - Async-style data fetching to mirror real network calls
    - Easy to replace with real APIs later

### Tech Stack
  - Language: Swift
  - UI: SwiftUI
  - Architecture: MVVM
  - State Management: @StateObject, @Published
  - Async Data: Mock services with JSON
  - Navigation: SwiftUI NavigationStack

### Project Status
This project is intentionally not “finished”.
It is designed to demonstrate:
  - Architectural decisions
  - Code organization
  - SwiftUI best practices
  - Realistic app structure

### Next steps
- Favorites persistence
- Navigation improvements
- Unit tests
- design improvement
- UX

### About Me
iOS Developer with experience in:
  - Swift & SwiftUI
  - MVVM architecture
  - Clean, maintainable code
  - Real-world app structure
  - This project is part of my professional portfolio.
