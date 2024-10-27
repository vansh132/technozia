# Technozia - College Fest Registration Portal (Web, Android & iOS)

**Technozia** is a multi-platform application developed for managing college fest registrations. It features secure authentication, real-time data handling, and a dynamic dashboard to streamline the registration process.

## Tech Stack

- **Flutter**: Cross-platform development for Web, Android, and iOS.
- **Node.js**: Backend runtime environment.
- **Express.js**: Backend framework for building REST APIs.
- **MongoDB**: NoSQL database for storing registration data.

## Features

- **JWT-Based Authentication**: 
  - Developed secure authentication using JSON Web Tokens (JWT) to authorize users, ensuring data integrity and access control across the app.
  
- **State-Managed Access Control**: 
  - Implemented user authentication in the front-end using the **Provider** package for seamless and efficient state management.
  
- **Dynamic Dashboard**: 
  - Designed a flexible and interactive dashboard to manage registrations, complete with:
    - **Filtering and Sorting** options for better data management.
    - **Registration Verification** feature to streamline the validation of participant registrations.
   
## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/vansh132/technozia.git
    cd technozia
    ```

2. Install frontend dependencies:
    ```bash
    flutter pub get
    ```

3. Install backend dependencies:
    ```bash
    cd backend
    npm install
    ```

4. Run the backend server:
    ```bash
    npm start
    ```

5. Run the frontend:
    ```bash
    flutter run
    ```
