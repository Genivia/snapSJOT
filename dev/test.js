var snapSJOT = require("snapsjot");

var data =
[
  {
    "name":    "SJOT",
    "v":       "1.3.7",
    "tags":    [ "JSON", "SJOT", "validator" ],
    "package": { "id": 1, "name": "sjot" }
  },
  {
    "name":    "SNAPSJOT",
    "v":       1.3,
    "tags":    [ "JSON", "SJOT", "converter" ],
    "package": { "id": 2, "name": "snapsjot", "opt": true }
  }
];

snapSJOT.convert(data);
console.log("OK!");
