const express = require("express");

const app = express();
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
    res.send("Hello from Printo CI/CD Project - Version 2!");
});

app.get("/health", (req, res) => {
    res.status(200).send("OK");
});

app.listen(PORT, () => {
    console.log(`Application running on port ${PORT}`);
});