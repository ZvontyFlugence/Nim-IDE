import nigui

type MenuLabel* = ref object of Label

proc newMenuLabel*(text = ""): MenuLabel =
    result = new MenuLabel
    result.init()
    result.text = text

method handleDrawEvent*(control: MenuLabel, event: DrawEvent) =
    let canvas = event.control.canvas
    canvas.areaColor = rgb(23, 25, 33)
    canvas.textColor = rgb(255, 233, 83)
    canvas.lineColor = rgb(255, 233, 83)
    canvas.drawRectArea(0, 0, control.width, control.height)
    canvas.drawTextCentered(control.text)
    canvas.drawRectOutline(0, 0, control.width, control.height)
