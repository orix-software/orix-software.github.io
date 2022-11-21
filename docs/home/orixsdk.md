# Orix SDK

It provides macro to help assembly coding for Orix :

https://github.com/assinie/orix-sdk/

The main way to handle orix-sdk is to add it as gitmodules (for example in a "dependencies folder")

## Install in a project

```bash
mkdir myasmproject
cd  myasm_project
mkdir dependencies && cd dependencies
git clone https://github.com/assinie/orix-sdk.git

```

## Load Orix SDK

you just need to load macro file in your code (and telestrat.inc from cc65):

```ca65
.include "telestrat.inc"
.include "dependencies/orix-sdk/macros/SDK.mac"
```

