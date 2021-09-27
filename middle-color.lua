-- blend primary and secondary color, gamma aware

local gamma = 2.2
local inverse_gamma = 1 / gamma

local fg_red = (app.fgColor.red / 255) ^ gamma
local fg_green = (app.fgColor.green / 255) ^ gamma
local fg_blue = (app.fgColor.blue / 255) ^ gamma
local bg_red = (app.bgColor.red / 255) ^ gamma
local bg_green = (app.bgColor.green / 255) ^ gamma
local bg_blue = (app.bgColor.blue / 255) ^ gamma

app.fgColor = Color({
    r=math.floor((((fg_red + bg_red) / 2) ^ inverse_gamma) * 255 + 0.5),
    g=math.floor((((fg_green + bg_green) / 2) ^ inverse_gamma) * 255 + 0.5),
    b=math.floor((((fg_blue + bg_blue) / 2) ^ inverse_gamma) * 255 + 0.5),
    a=(app.fgColor.alpha + app.bgColor.alpha) / 2
})
