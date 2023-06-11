# ZCode APP - IDE GitHub Action

## Usage



```
name: Run tests

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    - name: Start ZCode APP IDE
      uses: zcodeapp/ide-github-action@1.0.0
```