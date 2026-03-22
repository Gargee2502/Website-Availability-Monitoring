# Real-Time Website Monitoring & Alerting System

A lightweight Linux-based website monitoring system that continuously checks website availability, measures response times, stores historical data, and sends real-time Telegram alerts when downtime is detected.
The system integrates Bash automation, SQLite logging, and a Flask dashboard with Chart.js to provide real-time monitoring and analytics.

---

## Features
- Real-time website uptime monitoring
- DNS, ping, and HTTP health checks using Bash and curl
- Response time tracking for performance analysis
- Automated Telegram alerts when a website goes down
- Structured logging with SQLite database
- Historical uptime analytics
- Interactive dashboard using Flask + Chart.js
- Automated monitoring with cron jobs
- Lightweight and efficient for Linux environments

---

## Tech Stack
- Linux / Bash
- Python
- Flask
- SQLite
- Chart.js
- Telegram Bot API
- HTML / CSS
- Cron Jobs

---

## Project Structure
```markdown
website-monitor/
│
├── dashboard/ # Flask dashboard UI
├── templates/ # HTML templates
│ └── index.html
│
├── scripts/ # Monitoring scripts
│ ├── monitor.sh
│ ├── alert.sh
│ └── analytics.sh
│
├── data/
│ └── websites.txt # List of websites to monitor
│
├── app.py # Flask backend server
├── requirements.txt # Python dependencies
├── .gitignore
└── README.md
```
---

## How the System Works
1. `websites.txt` contains the list of websites to monitor.
2. `monitor.sh` runs periodic health checks:
   - DNS resolution
   - Ping test
   - HTTP status check
3. Monitoring results are:
   - Logged with timestamps
   - Stored in SQLite database
4. If a website goes down, `alert.sh` sends a Telegram notification.
5. `analytics.sh` calculates uptime statistics.
6. `app.py` serves a Flask dashboard to visualize response times and availability trends.

---

## Setup Instructions
### 1. Clone Repository
```bash
git clone https://github.com/Gargee2502/Website-Availability-Monitoring.git
cd website-monitor
```
### 2. Install Dependencies
```bash
pip install -r requirements.txt
```
3. Add Websites
Edit:
```markdown
data/websites.txt
```
Example:
```markdown
google.com
github.com
example.com
```
### 4. Configure Telegram Alerts
Edit:
```markdown
scripts/alert.sh
```
Add:
```markdown
BOT_TOKEN=your_bot_token
CHAT_ID=your_chat_id
```
### 5. Run Monitoring Script
```bash
cd scripts
chmod +x monitor.sh
./monitor.sh
```
### 6. Start Dashboard
```bash
python app.py
```
Open:
```markdown
http://localhost:5000
```
### 7. Automate with Cron (Optional)
```bash
crontab -e
```
Add:
```bash
* * * * * /path-to-project/scripts/monitor.sh
```
---

## Dashboard
The dashboard provides:
- Response time visualization
- Website performance comparison
- Historical monitoring data
- Availability metrics

---

## Future Improvements
- Email / Slack alerts
- Docker deployment
- Distributed monitoring
- Public status page

Author: Gargee Rai
