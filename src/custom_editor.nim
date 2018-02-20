import nigui

type CustomEditor* = ref object of TextArea

proc newCustomEditor*(text = ""): CustomEditor =
    result = new CustomEditor
    result.init()
    result.text = text

method handleDrawEvent*(control: CustomEditor, event: DrawEvent) =
    let canvas = event.control.canvas
    canvas.areaColor = rgb(40,42,54)
    canvas.textColor = rgb(249, 249, 249)
    canvas.drawRectArea(0, 0, control.width, control.height)
    canvas.drawText(control.text)