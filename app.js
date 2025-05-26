const express = require('express');

const app = express();

app.get('/', (req, res) => {
  res.json({ success: true });
});

app.get('/health', (req, res) => {
  res.json({ success: true });
});

app.listen(4000, () => {
  console.log('Server started on port 4000');
});
