# Nim-IDE
Experimental Nim standalone IDE developed purely in Nim, using [NimGui](https://github.com/trustable-code/NiGui).
However, many current features are dependent on my forked version of NiGui which contains custom modules, like Editor. I would recommend using my version of [NiGui](https://github.com/ZvontyFlugence/NiGui), until my merge requests are accepted in the official version of NiGui.

* Currently Nim-IDE only works on Windows. Do not attempt to use on Linux or macOS until support for those systems are added*

## Current Features
- Create New File
- Open File
- Edit File
- Save File
- Run File

## Planned Features
- Syntax Highlighting
- Code Suggestions (nimsuggest)
- Read console output into embedded console within editor
- Add line numbers
- Calculate and display cursor position

### How to Run
- Go to my version of [NiGui](https://github.com/ZvontyFlugence/NiGui) and follow the manual installation instructions.
- Go to a directory where you'd like to store the application
- Run `git clone https://github.com/ZvontyFlugence/Nim-IDE.git` command within a command prompt or terminal
- Navigate to the "/src" folder
- Run command `nim c -r main.nim` in command prompt or terminal
- Enjoy!
