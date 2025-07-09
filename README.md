# FootballAPI

A lightweight and dynamic REST API that provides real-time football data, including team standings and player statistics, by scraping content from a sport websites.

## Overview

**FootballAPI** is a personal project designed to expose football-related data via a RESTful interface. It enables users to retrieve up-to-date information such as league standings, individual team stats, and top scorers across multiple championships.

The API is entirely **dynamic**:  
- **No database is required**  
- **No data is stored locally**  
- All responses are generated **in real time** via web scraping

---

## How It Works

The project is divided into two main components:

1. **FootballScraper**  
   Python-based scrapers located in the `/DataScrapers` folder. They dynamically collects data from [OneFootball](https://onefootball.com/en/) whenever a request is made.

2. **Node.js Server**  
   The `server.js` file sets up the REST API server using Node.js. It routes incoming HTTP requests to the scraper, which fetches and returns live data.

No SQL or persistent storage is used—the API is fully stateless and relies on fresh data at each call.

---

## 💻 Installation and Usage

### Requirements
- [Python 3](https://www.python.org/downloads/)
- [Node.js](https://nodejs.org/)
- Python modules:
  ```bash
  python3 -m pip install -r requirements.txt
  ```
### Steps
1. Clone the repository
2. Start the Node.js server
  ```bash
node server.js
  ```
3. Access the API from your browser or an API Client:
```bash
http://localhost:3000
   ```
## 🗺️ Available API Routes

All endpoints are structured dynamically based on the `:championship` parameter (e.g., `serie-a`, `premier-league`), as defined in the `conf/competitions.txt` file.

### 📊 Squad Information
- `GET /:championship/table`  
  Returns the full league table for the specified competition.

- `GET /:championship/table/squadname/:squadName`  
  Returns statistics for a specific team by name.

- `GET /:championship/table/squadposition/:squadposition`  
  Returns statistics for a team based on its position in the table.

### 📰 News
- `GET /:championship/news/`  
  Returns the latest football news related to the specified championship.

### 🏁 Match Results
- `GET /:championship/results/`  
  Returns recent match results for the specified competition.

### 📅 Fixtures
- `GET /:championship/fixtures/`  
  Returns upcoming fixtures for the selected league.

### 🔄 Transfers
- `GET /:championship/transfers/`  
  Returns recent transfer updates for the specified championship.

### 🌍 Competitions
- `GET /competitions`  
  Returns the list of all available championship identifiers supported by the API.

## Deprecation Notice  
Due to structural changes on the target website (https://onefootball.com/en/), the scraping logic may no longer function as intended.
However, the project remains easily maintainable—by updating the selectors in FootballScraper.py, the API can be restored to full functionality.
  
## Conclusion
This project serves as a lightweight example of how to build a dynamic REST API using Python and Node.js, without relying on persistent storage. It's ideal for learning web scraping, API design, and modular project structuring.

Feel free to fork and adapt it to other data sources or use it as a base for your own APIs.

