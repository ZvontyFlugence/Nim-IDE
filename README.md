# Nim-IDE
Experimental Nim standalone IDE developed purely in Nim, using [NimGui](https://github.com/trustable-code/NiGui).
However, many current features are dependent on my forked version of NiGui which contains custom modules, like Editor. I would recommend to use my version of [NiGui](https://github.com/ZvontyFlugence/NiGui), until my merge requests are accepted in the official version of NiGui. I would also like to note that this is an incomplete, experimental application that is still in its development phase, there are many features which have either not yet been implemented, or may not work. I would not recommend attempting to use this application for any practical uses in its current form.

## Current Features
- Create New File
- Open File
- Edit File* (Currently, only certain keys are supported!)
- Save File

### How to Run
- Go to my version of [NiGui](https://github.com/ZvontyFlugence/NiGui) and follow the manual installation instructions.
- Go to a directory where you'd like to store the application
- Run `git clone https://github.com/ZvontyFlugence/Nim-IDE.git` command within a command prompt or terminal
- Navigate to the "/src" folder
- Run command `nim c -r main.nim` in command prompt or terminal
- Enjoy!
