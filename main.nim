import nigui
import streams

app.init()

var window = newWindow("Nim GUI App")
window.width = 800
window.height = 600

var mainContainer = newLayoutContainer(Layout_Vertical)
window.add(mainContainer)

var menuContainer = newLayoutContainer(Layout_Horizontal)
mainContainer.add(menuContainer)

var textArea = newTextArea()
mainContainer.add(textArea)

var openFileBtn = newButton("Open File")
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
                add(fileContent, line)
            fs.close()
            textArea.text = fileContent
    except IndexError:
        window.alert("Error: Invalid file!")

var saveFileBtn = newButton("Save File")
menuContainer.add(saveFileBtn)
saveFileBtn.onClick = proc(event: ClickEvent) =
    var dialog = newSaveFileDialog()
    dialog.title = "Save File"
    dialog.directory = "/test"
    dialog.run()
    if dialog.file == "":
        window.alert("Error: Save Failed!")
    else:
        writeFile(dialog.file, textArea.text)

window.show()
app.run()
