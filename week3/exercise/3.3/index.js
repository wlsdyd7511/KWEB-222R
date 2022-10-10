const express = require('express');
const app = express();
const port = 3000;

const factorial = n => {
    if (n == 0) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

app.get('/factorial/', (req, res) => res.redirect(`/factorial/${req.query.number}`));

app.get('/factorial/:number', (req, res) => res.send(`${factorial(req.params.number)}`));

app.listen(3000, console.log(`Server listening on port ${port}!`));
