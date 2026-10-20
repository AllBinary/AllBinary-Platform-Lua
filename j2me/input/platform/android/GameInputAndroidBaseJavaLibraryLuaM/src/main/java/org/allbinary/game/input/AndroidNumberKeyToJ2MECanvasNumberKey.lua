-- Generated Code Do Not Modify
-- package org.allbinary.game.input

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local KeyEvent = require("android.view.KeyEvent")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AndroidNumberKeyToJ2MECanvasNumberKey = {}
AndroidNumberKeyToJ2MECanvasNumberKey.__index = AndroidNumberKeyToJ2MECanvasNumberKey
AndroidNumberKeyToJ2MECanvasNumberKey.className = "AndroidNumberKeyToJ2MECanvasNumberKey"


function AndroidNumberKeyToJ2MECanvasNumberKey.init()
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_0 + 1] = Canvas.KEY_NUM0
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_1 + 1] = Canvas.KEY_NUM1
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_2 + 1] = Canvas.KEY_NUM2
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_3 + 1] = Canvas.KEY_NUM3
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_4 + 1] = Canvas.KEY_NUM4
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_5 + 1] = Canvas.KEY_NUM5
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_6 + 1] = Canvas.KEY_NUM6
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_7 + 1] = Canvas.KEY_NUM7
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_8 + 1] = Canvas.KEY_NUM8
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_9 + 1] = Canvas.KEY_NUM9
end


function AndroidNumberKeyToJ2MECanvasNumberKey.new()
    local self = setmetatable({}, AndroidNumberKeyToJ2MECanvasNumberKey)
    return self
end


function AndroidNumberKeyToJ2MECanvasNumberKey.getKey(key)
        if key < (AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap.n or #AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap) then
            local value = AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[key + 1]
            if value ~= 0 then
                return value
            end
        end
        return key
end

AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap = java_new_array(0, 17)

return AndroidNumberKeyToJ2MECanvasNumberKey

