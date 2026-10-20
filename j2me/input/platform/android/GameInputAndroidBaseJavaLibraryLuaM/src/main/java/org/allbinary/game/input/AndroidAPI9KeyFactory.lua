-- Generated Code Do Not Modify
-- package org.allbinary.game.input

local KeyEvent = require("android.view.KeyEvent")
local NullUtil = require("org.allbinary.logic.NullUtil")
local AndroidKeyFactory = require("org.allbinary.game.input.AndroidKeyFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AndroidAPI9KeyFactory = {}
AndroidAPI9KeyFactory.__index = AndroidAPI9KeyFactory
AndroidAPI9KeyFactory.className = "AndroidAPI9KeyFactory"
setmetatable(AndroidAPI9KeyFactory, {__index = AndroidKeyFactory})


function AndroidAPI9KeyFactory.getInstance()
        if AndroidAPI9KeyFactory.instance == NullUtil.getInstance().NULL_OBJECT then
            AndroidAPI9KeyFactory.instance = AndroidAPI9KeyFactory.new()
        end
        return AndroidAPI9KeyFactory.instance
end


function AndroidAPI9KeyFactory.new()
    local self = setmetatable(AndroidKeyFactory.new(), AndroidAPI9KeyFactory)
        self.KEYCODE_BUTTON_L1 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_L1, "BUTTON L1")
        self.KEYCODE_BUTTON_R1 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_R1, "BUTTON R1")
        self.KEYCODE_BUTTON_THUMBR = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_THUMBR, "BUTTON THUMBR")
        self.KEYCODE_BUTTON_THUMBL = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_THUMBL, "BUTTON THUMBL")
        self.KEYCODE_BUTTON_START = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_START, "BUTTON START")
        self.KEYCODE_BUTTON_MODE = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_MODE, "BUTTON MODE")
        self.KEYCODE_BUTTON_B = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_B, "BUTTON B")
        self.KEYCODE_BUTTON_A = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_A, "BUTTON A")
        self.KEYCODE_BUTTON_X = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_X, "BUTTON X")
        self.KEYCODE_BUTTON_Y = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_Y, "BUTTON Y")
        self.KEYCODE_BUTTON_L2 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_L2, "BUTTON L2")
        self.KEYCODE_BUTTON_R2 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_R2, "BUTTON R2")
        self.KEYCODE_BUTTON_SELECT = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_SELECT, "BUTTON SELECT")
        self.KEYCODE_BUTTON_C = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_C, "BUTTON C")
        self.KEYCODE_BUTTON_Z = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_Z, "BUTTON Z")
    return self
end

AndroidAPI9KeyFactory.instance = NullUtil.getInstance().NULL_OBJECT

return AndroidAPI9KeyFactory

