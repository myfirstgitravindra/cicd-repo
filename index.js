const express = require('express');
const os = require('os');
const app = express();
const PORT = 3000;

app.get('/health', (req, res) => {
  res.json({
    status: 'UP',
    timestamp: new Date().toISOString(),
    service: 'Node.js/Express',
    hostname: os.hostname()
  });
});

app.get('/', (req, res) => {
  res.send(`
    <h1>Node.js Service</h1>
    <p>Host: ${os.hostname()}</p>
    <p>Time: ${new Date()}</p>
  `);
});

app.listen(PORT, () => {
  console.log(`Running on http://0.0.0.0:${PORT}`);
});
