# x86 assembly repo

## Description
A couple of small x86 assembly programs written for self-education purposes.

## Tools used
* [DOSBox](https://www.dosbox.com/)  
* [flat assembler](https://flatassembler.net/)  
* [CWSDPMI](http://sandmann.dotster.com/cwsdpmi/)  
This one is needed to run fasm in DOSBox as it needs a dpmi server to run in protected mode.
* [Visual Studio Code](https://code.visualstudio.com/)  
With the _x86 and x86-64 Assembly_ extension.

## Setup
### DOSBox
In the DOSBox config file under `~/.dosbox/dosbox-[version].conf` set the path to the `cwsdpmi` and the `fasm` executables.  
Then start `cwsdpmi` with the `-p` flag that makes it stay resident not only for a single dpmi process. It can be unloaded using the `-u` flag.  
```
PATH=C:\SOFTWARE\dpmi\bin;C:\SOFTWARE\fasm  
cwsdpmi -p
```

### Visual Studio Code
Added the following to the workspace settings:  
```
"files.encoding": "cp852",
"files.associations": {
    "*.asm" : "asm"
}
```

## Compile
```
fasm prg.asm
```
Creates a com executable.