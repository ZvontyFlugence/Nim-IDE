import nigui
import streams
import strutils
import menu_button
import menu_label

app.init()

var window = newWindow("Nim GUI App")
window.width = 800
window.height = 600

var mainContainer = newLayoutContainer(Layout_Vertical)
mainContainer.backgroundColor = rgb(23, 25, 33)
window.add(mainContainer)

var menuContainer = newLayoutContainer(Layout_Horizontal)
menuContainer.backgroundColor = rgb(23, 25, 33)
mainContainer.add(menuContainer)

var fileName = newMenuLabel("")
fileName.height = 25
mainContainer.add(fileName)

var textArea = newTextArea()
textArea.backgroundColor = rgb(23, 25, 33)
mainContainer.add(textArea)

var newFileBtn = newMenuButton("New File")
menuContainer.add(newFileBtn)
newFileBtn.onClick = proc(event: ClickEvent) =
    textArea.text = ""
    fileName.text= "New File" 
    fileName.width = len(fileName.text) * 10

var openFileBtn = newMenuButton("Open File")
menuContainer.add(openFileBtn)
openFileBtn.onClick = proc(event: ClickEvent) =
    var dialog = newOpenFileDialog()
    dialog.title = "Select File"    
    dialog.multiple = false    
    dialog.directory = "/test"    
    dialog.run()    
    try:        
        var fs = newFileStream(dialog.files[0], fmRead)        
        var line = ""        
        var fileContent = ""        
        if not isNil(fs):            
            while fs.readLine(line):
                add(line, "\n")              
                add(fileContent, line)            
            fs.close()            
            textArea.text = fileContent            
            var pathParts = split(dialog.files[0], "\\")            
            fileName.text= pathParts[len(pathParts)-1]
            fileName.width = len(fileName.text) * 10
    except IndexError:       
        window.alert("Error: Invalid file!")

var saveFileBtn = newMenuButton("Save File")
menuContainer.add(saveFileBtn)
saveFileBtn.onClick = proc(event: ClickEvent) =
    var dialog = newSaveFileDialog()
    dialog.title = "Save File"
    dialog.directory = "/test"
    dialog.run()
    try:
        writeFile(dialog.file, textArea.text)    
    except:        
        window.alert("Error: Save failed!")
        
window.show()
app.run()
