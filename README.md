
# Overview
This project is a simple iOS application that displays airline information fetched from an external API. The app follows the MVVM architecture using closures and provides functionality to mark airlines as favorites, which are persisted for offline access.



https://github.com/user-attachments/assets/b5ca0a66-c322-4a95-b10d-a6e6e55672d9




# Features

## Airline List Screen 
  - Displays a list of airlines with their logos and names.
  - Uses a TabBar to switch between all airlines and favorite airlines, maintaining the same UI with different ViewModels.
  - Caches favorite airlines locally for offline access.

## Airline Details Screen 
  - Displays airline logo, name, website, and phone number.
  - Allows opening the airline's website in an external browser.
  - Simulates dialing the airline's phone number.
  - Enables marking/unmarking airlines as favorites, persisting them across launches.

# Project Structure
The project follows the MVVM architecture using closures for binding.

## Models 
  - "AirlinesModel": Represents an airline with properties like name, logo, website, and phone number.

## ViewModels 
  - "AllAirlinesViewModel": Fetches and manages the full list of airlines.
  - "FavoriteAirlinesViewModel": Manages the list of favorite airlines.
  - "AirlineDetailViewModel": Manages details of a selected airline and favorite status.

## Views (UI) 
  - "AirlinesViewController": Displays a list of airlines with a TabBar to switch between all and favorite airlines.
  - "AirlineDetailViewController": Shows details for a selected airline.

# Services 
  - "NetworkManager": Fetches airline data from the API using “Alamofire”.
  - "LocalStorageManager": Handles caching of favorite airlines using “CoreData”.

  
