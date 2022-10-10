const express = require('express');
const app = express();
const port = 3000;

app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => res.sendFile(`${__dirname}/index.html`));

app.post('/login', (req, res) => res.send(`username: ${req.body.username}\npassword: ${req.body.password}`))

app.listen(3000, console.log(`Server listening on port ${port}!`));
