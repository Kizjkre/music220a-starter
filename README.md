# MUSIC 220A Starter Code

## Usage

### 1. Clone the repository

```shell
git clone https://github.com/Kizjkre/music220a-starter
cd music220a-starter
```

### 2. Start the server

First, make sure you have Python 3 installed by running:

```shell
python3 --version
```

Then run:

```shell
./server
```

(**Note:** if there is a permissions error, run `chmod 777 server`)

### 3. Visit the webpage

For unix shells:

```shell
open http://localhost:5000
```

For Powershell:

```shell
start http://localhost:5000
```

### 4. Deploy to the CCRMA server

```shell
scp -r . <username>@ccrma-gate.stanford.edu:/Library/Web/220a/<folder>
```

### 5. Visit the webpage

```shell
open https://ccrma.stanford.edu/~<username>/<folder>
```
