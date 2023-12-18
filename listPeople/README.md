# People Listing App

This is a simple single-screen app that lists people. The app uses the provided DataSource to fetch people in a paginated manner, displays them in a UITableView, and handles various scenarios like refreshing, error handling, and an empty state.

## Files and Classes

### ListPeopleViewController.swift
- **Description:** This is the main view controller responsible for displaying the list of people.
- **Key Functions:**
    - `setupTableView()`: Configures the table view and sets up a refresh control.
    - `refresh()`: Triggers a refresh when the user pulls down on the table view.
    - `startOverButtonTapped(_:)`: Initiates a fresh fetch of people.
    - Conforms to ListPeopleViewControllerProtocol to handle UI updates.

### ListPeoplePresenter.swift
- **Description:** The presenter class manages the business logic, fetches data from the DataSource, and updates the UI through the view controller.
- **Key Functions:**
    - `fetchPeople()`: Initiates the fetch operation from the DataSource.
    - `handleFetchResponse(_:)`: Handles the response from the fetch operation and updates the UI accordingly.
    - `startOver()`: Resets the state and initiates a fresh fetch.

### DataSource.swift
- **Description:** A simulated data source that provides a paginated list of people with a delay to simulate a backend service.
- **Key Functions:**
    - `fetch(next:_:)`: Fetches a paginated list of people and returns a response or an error with a simulated delay.

### Person
- **Description:** Represents a person with an id and a fullName.
### FetchResponse.swift
- **Description:** Represents the response structure when fetching people from the DataSource.
### FetchError.swift
- **Description:** Represents an error structure when an error occurs during the data fetch.
### RandomUtils.swift and PeopleGen.swift
- **Description:** Utility classes for generating random values and random full names.

## Implementation Overview

1. **Setup:** The `ListPeopleViewController` sets up the table view, refresh control, and initiates the first fetch in its `viewDidLoad` method.

2. **Fetching Data:**
   - The user can trigger a fetch by pulling down on the table view (`refresh()` method) or tapping the "Start Over" button (`startOverButtonTapped(_:)` method).
   - The fetch operation is handled by the `ListPeoplePresenter`, which communicates with the `DataSource`.

3. **Handling Responses:**
   - The `ListPeoplePresenter` receives the response from the `DataSource` and updates the UI accordingly.
   - If there's an error, an alert is displayed with a retry option.

4. **UI Updates:**
   - The UI updates are handled through the `ListPeopleViewControllerProtocol`, ensuring a clean separation between the view controller and presenter.

5. **Pagination:**
   - The `DataSource` supports pagination, and the app fetches the next page when needed.

6. **Empty State:**
   - When there are no people to display, the app shows an empty state with a message and provides a refresh option.

7. **Error Handling:**
   - Errors during the fetch operation trigger an alert with a retry option.

8. **Loading Indicator:**
   - A loading indicator is shown during data fetch operations.
