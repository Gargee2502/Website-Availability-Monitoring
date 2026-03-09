from flask import Flask, render_template, jsonify
import sqlite3

app = Flask(__name__)

@app.route("/response-data")
def response_data():

    conn = sqlite3.connect("../database/monitor.db")
    cursor = conn.cursor()

    cursor.execute("""
    SELECT website, timestamp, response_time
    FROM monitor
    ORDER BY timestamp ASC
    LIMIT 100
    """)

    rows = cursor.fetchall()
    conn.close()

    data = {}

    for website, timestamp, response_time in rows:
        if website not in data:
            data[website] = {"timestamps": [], "response": []}

        data[website]["timestamps"].append(timestamp)
        data[website]["response"].append(response_time)

    return jsonify(data)

def get_data():
    conn = sqlite3.connect("../database/monitor.db")
    cur = conn.cursor()

    cur.execute("SELECT website,timestamp,http_status,response_time FROM monitor ORDER BY timestamp DESC LIMIT 50")
    data = cur.fetchall()

    conn.close()
    return data

@app.route("/")
def dashboard():

    data = get_data()

    return render_template("index.html", data=data)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
