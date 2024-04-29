# Data Fetching and Rendering App

This iOS app fetches data from a provided API endpoint and displays it in a UITableView component with pagination support.

## Features

1. **Data Fetching and Rendering:**
   - Fetches data from the provided API endpoint `https://jsonplaceholder.typicode.com/posts`
   - Displays fetched data in a UITableView with pagination
   - Each item in the list presents the fetched data, including the `id` and `title` fields
   -

2. **Pagination
   - Implements pagination to fetch and display data in batches
   - Loads more data as the user scrolls through the list

3. **Heavy Computation Optimization:**
   - Implements optimized algorithms to handle heavy computation efficiently for displaying additional details of list items.
   - Logs the time taken for the heavy computation process.

4. **Callback Memorization:**
   - Develops a detailed view for each list item that reveals additional information upon selection.
   - Passes necessary data from the selected item to the detailed view using segues or other appropriate mechanisms.
   - Employ memorization of callback functions to prevent unnecessary re-computation or re-rendering.

## Requirements

- Xcode 12 or later
- Swift 5.0 or later
- iOS 13.0 or later

## Getting Started

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Build and run the app on a simulator or a physical device.

## How to Use

- Upon launching the app, it fetches data from the API endpoint.
- The fetched data is displayed in a UITableView.
- Scroll down to trigger pagination and load more data.
- Each table view cell displays the `id` and `title` fields of the fetched data.
- Selecting a list item reveals additional information in a detailed view.

## Dependencies

This project does not use any third-party dependencies.
