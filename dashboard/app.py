from flask import Flask, render_template
import sqlite3

app = Flask(__name__)

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
    app.run(debug=True)
