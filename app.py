from flask import Flask, jsonify
import socket
from datetime import datetime

app = Flask(__name__)

@app.route('/health')
def health():
    return jsonify(
        status="UP",
        timestamp=datetime.utcnow().isoformat(),
        service="Python/Flask",
        hostname=socket.gethostname()
    )

@app.route('/')
def home():
    return f"""
    <h1>Python Service</h1>
    <p>Host: {socket.gethostname()}</p>
    <p>Time: {datetime.now()}</p>
    """

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
