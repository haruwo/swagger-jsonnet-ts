const fs = require('fs');
const raw = fs.readFileSync(0);
const json = JSON.parse(raw);
console.log(JSON.stringify(json.definitions, null, 2));
