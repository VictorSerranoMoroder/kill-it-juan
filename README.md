# kill-it-juan

Kill it juan is a wrapper around the kill command, but plays a funny moment of *Aqui No Hay Quien Viva* along while deleting your file. Think of it as just saying please while your are sudoing your kill -9.

## Installation
Clone this repository and execute the install script with sudo:
```
sudo ./install.sh
```

## Usage
Usage is pretty straightforward use it like a kill command:
```
# juankill <SIGNAL> <PID>
juankill -9 12345
```

It will kill your chosen process very politely.