import nigui

type MenuButton* = ref object of Button

proc newMenuButton*(text = ""): MenuButton =
    result = new MenuButton
    result.init()
    result.text = text

method handleDrawEvent*(control: MenuButton, event: DrawEvent) =
    let canvas = event.control.canvas
    canvas.areaColor = rgb(23, 25, 33)
    canvas.textColor = rgb(255, 233, 83)
    canvas.lineColor = rgb(255, 233, 83)
    canvas.drawRectArea(0, 0, control.width, control.height)
    canvas.drawTextCentered(control.text)
    #canvas.drawRectOutline(0, 0, control.width, control.height)
