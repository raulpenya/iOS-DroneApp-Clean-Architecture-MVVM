# drone
This is just a sample project to test new technologies :)

This project is built under SOLID principles, clean architecture and MVVM. It uses SwiftUI for presentation and Combine framework to communicate between the different layers.

The layers that compose this project are:
- Presentation Layer:
    - It uses MVVM for presentation layer.
    - Also it uses dependency injection to inject dependencies to the view and the view model (for example: use cases, custom objects, etc.)
    - The presentation layer has its own view entities different than domain entities.
- Domain layer:
    - Business logic layer.
    - Each use case is a reusable and independent component that executes an specific business logic.
    - Domain layer does not know anything about other layers, just fetches data from a repository defined as a protocol and returns the result.
    - Domain layer has its own domain entities different than view o data entities. 
- Data layer:
    - It uses the repository pattern. The repository pattern adds an abstraction layer over the the data sources from which the use cases get the data. With repository pattern, you can query your model objects from different data sources (Core Data, Realm, web server, etc.) with a only single-entry point.
    - Business logic shouldn’t know where the data comes from.
    - Data layer has its own data entities different than domain entities. 

I've also created a framework called "Tracker". 
- Tracker:
    - This framework is only accessible from the data layer and it's who calculates the final position of the drone.
    - The "Tracker" framework is another source of data for the app (as it could be an API or other external libraries). I've taken this decision to isolate this logic from the rest of the app and this way this logic could be available to migrate it to a server, or even to share this logic with other future apps.

## Architecture scheme:

![drone_architecture_scheme_v2](https://user-images.githubusercontent.com/28446011/216027660-bff8a8b0-651c-4b14-934e-fdb2b8d5ce64.png)

## Data source
So far, the source of the data is a json located inside of the bundle called "input.json". In order to change the input params just edit this json.


## Testing coverage:

<img width="859" alt="Screen Shot 2023-01-26 at 17 57 03" src="https://user-images.githubusercontent.com/28446011/214899516-e7b8628e-2791-404b-b0f5-d2abe2535f72.png">

This project only contains unit tests so far.

## Next steps:
- Add UI tests
- Improve UI design
- Add the possibility to introduce input params from the UI, not only from the json file.
- Improve "MissionResultViewModel.executeMission()" introducing await/async.
- ...
