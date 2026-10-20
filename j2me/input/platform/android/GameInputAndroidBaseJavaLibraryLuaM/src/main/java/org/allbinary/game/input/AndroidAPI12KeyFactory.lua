-- Generated Code Do Not Modify
-- package org.allbinary.game.input

local KeyEvent = require("android.view.KeyEvent")
local NullUtil = require("org.allbinary.logic.NullUtil")
local AndroidAPI9KeyFactory = require("org.allbinary.game.input.AndroidAPI9KeyFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AndroidAPI12KeyFactory = {}
AndroidAPI12KeyFactory.__index = AndroidAPI12KeyFactory
AndroidAPI12KeyFactory.className = "AndroidAPI12KeyFactory"
setmetatable(AndroidAPI12KeyFactory, {__index = AndroidAPI9KeyFactory})


function AndroidAPI12KeyFactory.getAPI12Instance()
        if AndroidAPI12KeyFactory.instance12 == NullUtil.getInstance().NULL_OBJECT then
            AndroidAPI12KeyFactory.instance12 = AndroidAPI12KeyFactory.new()
        end
        return AndroidAPI12KeyFactory.instance12
end


function AndroidAPI12KeyFactory.new()
    local self = setmetatable(AndroidAPI9KeyFactory.new(), AndroidAPI12KeyFactory)
        self.KEYCODE_BUTTON_1 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_1, "BUTTON 1")
        self.KEYCODE_BUTTON_10 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_10, "BUTTON 10")
        self.KEYCODE_BUTTON_11 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_11, "BUTTON 11")
        self.KEYCODE_BUTTON_12 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_12, "BUTTON 12")
        self.KEYCODE_BUTTON_13 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_13, "BUTTON 13")
        self.KEYCODE_BUTTON_14 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_14, "BUTTON 14")
        self.KEYCODE_BUTTON_15 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_15, "BUTTON 15")
        self.KEYCODE_BUTTON_16 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_16, "BUTTON 16")
        self.KEYCODE_BUTTON_2 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_2, "BUTTON 2")
        self.KEYCODE_BUTTON_3 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_3, "BUTTON 3")
        self.KEYCODE_BUTTON_4 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_4, "BUTTON 4")
        self.KEYCODE_BUTTON_5 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_5, "BUTTON 5")
        self.KEYCODE_BUTTON_6 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_6, "BUTTON 6")
        self.KEYCODE_BUTTON_7 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_7, "BUTTON 7")
        self.KEYCODE_BUTTON_8 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_8, "BUTTON 8")
        self.KEYCODE_BUTTON_9 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_9, "BUTTON 9")
    return self
end

AndroidAPI12KeyFactory.instance12 = NullUtil.getInstance().NULL_OBJECT

return AndroidAPI12KeyFactory

