import nigui
import nigui/msgbox
import sets
import streams
import strutils
import menu_button
import menu_label
import custom_editor
import cmd

# Initialize NiGui App
app.init()

# Creating the main window, will hold all components
var window = newWindow("Nim GUI App")
window.width = 800
window.height = 600

# Creating the main container, will hold sub-containers
var mainContainer = newLayoutContainer(Layout_Vertical)
mainContainer.backgroundColor = rgb(23, 25, 33)
window.add(mainContainer)

# Creating the menu container, holds all the menu buttons
var menuContainer = newLayoutContainer(Layout_Horizontal)
menuContainer.backgroundColor = rgb(23, 25, 33)
mainContainer.add(menuContainer)

# Creating label to display the current file name
var fileName = newMenuLabel("")
fileName.height = 25
mainContainer.add(fileName)

# Creating editor container to hold the editor and editor-related components
var editorContainer = newLayoutContainer(Layout_Horizontal)
editorContainer.backgroundColor = rgb(23, 25, 33)
mainContainer.add(editorContainer)

# Create new custom editor
var editor = newCustomEditor()
editorContainer.add(editor)

# Create btn to create a new file
var newFileBtn = newMenuButton("New File")
menuContainer.add(newFileBtn)
newFileBtn.onClick = proc(event: ClickEvent) =
    editor.text = ""
    fileName.text= "New File"
    # Dynamically set label width to fit any size filename
    fileName.width = len(fileName.text) * 10
    # Refresh after loading a file
    editor.forceRedraw()

# Create btn to open a file from local storage
var openFileBtn = newMenuButton("Open File")
menuContainer.add(openFileBtn)
openFileBtn.onClick = proc(event: ClickEvent) =
    var dialog = newOpenFileDialog()
    dialog.title = "Select File"
    dialog.multiple = false
    dialog.directory = "/test"
    dialog.run()
    try:
        # Read file contents
        var fs = newFileStream(dialog.files[0], fmRead)
        var line = ""
        var fileContent = ""
        if not isNil(fs):
            # Concat lines into single string with newlines            
            while fs.readLine(line):
                add(line, "\n")
                add(fileContent, line)
            fs.close()  
            # Update editor with file contents
            editor.text = fileContent
            # Get file name from file path
            var pathParts = split(dialog.files[0], "\\")
            fileName.text= pathParts[len(pathParts)-1]
            # Dynamically set label width to fit any size filename
            fileName.width = len(fileName.text) * 10
            # Refresh after loading a file
            editor.forceRedraw()
    except IndexError:       
        window.alert("Error: Invalid file!")

# Create btn to save file
var saveFileBtn = newMenuButton("Save File")
menuContainer.add(saveFileBtn)
saveFileBtn.onClick = proc(event: ClickEvent) =
    var dialog = newSaveFileDialog()
    dialog.title = "Save File"
    dialog.directory = "/test"
    dialog.run()
    try:
        writeFile(dialog.file, editor.text)    
    except:        
        window.alert("Error: Save failed!")

# Function with cmd logic for nim compile+run command
# TODO: Fix everything related to running file in cmd
#[proc nimCommand(ctx: var CmdPrompt, input: seq[string]): void =
    echo(strutils.join(input, " "))]#

# Create Run btn to run application (only works if file is a nim file)
#[var runFileBtn = newMenuButton("Run")
menuContainer.add(runFileBtn)
runFileBtn.onClick = proc(event: ClickEvent) = 
    let foo = cmd.Command(name: "nim", help: "compile nim files", exeCmd: nimCommand)
    var my_commands: HashSet[Command] = [foo].toSet
    var prompt = CmdPrompt(commands: my_commands, promptString: "> ")
    prompt.run()]#

# Handle app close confirmation
window.onCloseClick = proc(event: CloseClickEvent) =
    case window.msgBox("Do you want to quit?", "Quit?", "Quit", "Minimize", "Cancel")
    of 1: window.dispose()
    of 2: window.minimize()
    else: discard

# Handle Text Change
editor.onTextChange = proc(event: TextChangeEvent) =
    editor.forceRedraw()

# Display window on application start        
window.show()

# Start application
app.run()