# FootballAPI

A lightweight and dynamic REST API that provides real-time football data, including team standings and player statistics, by scraping content from Italian sports websites.

## 📌 Table of Contents

- [Overview](#clipboard-overview)
- [How It Works](#gear-how-it-works)
- [Installation and Usage](#computer-installation-and-usage)
- [Deprecation Notice](#warning-deprecation-notice)
- [Conclusion](#checkered_flag-conclusion)

---

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
   A Python-based scraper located in the `/FootballScraper` folder. It dynamically collects data from [La Gazzetta dello Sport](https://www.gazzetta.it/) whenever a request is made.

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
  python3 -m pip install beautifulsoup4 requests
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
## Deprecation Notice  
Due to structural changes on the target website (gazzetta.it), the scraping logic may no longer function as intended.
However, the project remains easily maintainable—by updating the selectors in FootballScraper.py, the API can be restored to full functionality.
  
## Conclusion
This project serves as a lightweight example of how to build a dynamic REST API using Python and Node.js, without relying on persistent storage. It's ideal for learning web scraping, API design, and modular project structuring.

Feel free to fork and adapt it to other data sources or use it as a base for your own APIs.

