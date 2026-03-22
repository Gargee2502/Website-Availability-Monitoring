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
website-monitor/
│
├── dashboard/
│   ├── templates/
│   │   └── index.html
│   └── app.py
│
├── data/
│   ├── websites.txt
│
├── scripts/
│   ├── monitor.sh
│   ├── alert.sh
│   └── analytics.sh
│
├── requirements.txt
├── .gitignore
└── README.md

---

## How the System Works
1. **websites.txt** contains the list of websites to monitor.
2. **monitor.sh** runs periodic health checks:
   - DNS resolution
   - Ping test
   - HTTP status check
3. Monitoring results are:
   - Logged with timestamps
   - Stored in SQLite database
4. If a website goes down, **alert.sh** sends a Telegram notification.
5. **analytics.sh** calculates uptime statistics.
6. **app.py** serves a Flask dashboard to visualize response times and availability trends.

---

## Setup Instructions
**1. Clone the Repository**
git clone https://github.com/YOUR_USERNAME/website-monitor.git
cd website-monitor
**2. Install Dependencies**
pip install -r requirements.txt
**3. Add Websites to Monitor**
Edit the file:
 websites.txt
Example:
 google.com
 github.com
 example.com
**4. Configure Telegram Alerts**
Open:
 scripts/alert.sh
Add your Telegram credentials:
 BOT_TOKEN=your_bot_token
 CHAT_ID=your_chat_id
**5. Run the Monitoring Script**
cd scripts
chmod +x monitor.sh
./monitor.sh
**6. Start the Dashboard**
python app.py
Then open:
 http://localhost:5000
**7. Automate Monitoring Using Cron**
Open crontab:
 crontab -e
Add this line to run the monitor every minute:
 * * * * * /path-to-project/scripts/monitor.sh
**Example Monitoring Output**
2026-03-10 13:04:12 | google.com | UP | 0.44s
2026-03-10 13:04:13 | github.com | UP | 0.22s
2026-03-10 13:04:14 | example.com | DOWN | HTTP 000
**Analytics Output**
google.com | 100% uptime
github.com | 100% uptime
example.com | 0% uptime

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
