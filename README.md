# erolaffy/easyio

## Introduction
This is a package that encapsulates moonbitlang/x/fs, aiming to make file operations more convenient.

## Usage
`moon.pkg.json`
```json
{
    "is-main": true,
    "import": [
        {"path":"Erolaffy/easyio","alias": "eio"}
    ]
}
```

`main.mbt`
```moonbit
fn main{
    @eio.write("test.txt","txttxttxt")
}
```