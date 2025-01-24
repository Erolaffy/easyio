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
//init method f_o
  let f_o = @eio.open("a","w")
//unwarp if f_o is Ok() else print Err()
  guard f_o.is_ok() else { println(f_o) }

  let f = f_o.unwrap()
  f.write("test")
}
```