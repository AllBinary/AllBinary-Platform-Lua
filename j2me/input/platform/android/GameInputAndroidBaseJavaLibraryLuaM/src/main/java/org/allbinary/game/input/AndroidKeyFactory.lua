-- Generated Code Do Not Modify
-- package org.allbinary.game.input

local KeyEvent = require("android.view.KeyEvent")
local ActivityFractureUtil = require("org.allbinary.android.ActivityFractureUtil")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AndroidKeyFactory = {}
AndroidKeyFactory.__index = AndroidKeyFactory
AndroidKeyFactory.className = "AndroidKeyFactory"
setmetatable(AndroidKeyFactory, {__index = ActivityFractureUtil})

function AndroidKeyFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.UNKNOWN = AndroidGameKey.new(KeyEvent.KEYCODE_UNKNOWN, "UNKNOWN")
    self.KEYCODE_BUTTON_L1 = self.UNKNOWN
    self.KEYCODE_BUTTON_R1 = self.UNKNOWN
    self.KEYCODE_BUTTON_THUMBR = self.UNKNOWN
    self.KEYCODE_BUTTON_THUMBL = self.UNKNOWN
    self.KEYCODE_BUTTON_START = self.UNKNOWN
    self.KEYCODE_BUTTON_MODE = self.UNKNOWN
    self.KEYCODE_BUTTON_B = self.UNKNOWN
    self.KEYCODE_BUTTON_A = self.UNKNOWN
    self.KEYCODE_BUTTON_X = self.UNKNOWN
    self.KEYCODE_BUTTON_Y = self.UNKNOWN
    self.KEYCODE_BUTTON_L2 = self.UNKNOWN
    self.KEYCODE_BUTTON_R2 = self.UNKNOWN
    self.KEYCODE_BUTTON_SELECT = self.UNKNOWN
    self.KEYCODE_BUTTON_C = self.UNKNOWN
    self.KEYCODE_BUTTON_Z = self.UNKNOWN
    self.KEYCODE_BUTTON_1 = self.UNKNOWN
    self.KEYCODE_BUTTON_10 = self.UNKNOWN
    self.KEYCODE_BUTTON_11 = self.UNKNOWN
    self.KEYCODE_BUTTON_12 = self.UNKNOWN
    self.KEYCODE_BUTTON_13 = self.UNKNOWN
    self.KEYCODE_BUTTON_14 = self.UNKNOWN
    self.KEYCODE_BUTTON_15 = self.UNKNOWN
    self.KEYCODE_BUTTON_16 = self.UNKNOWN
    self.KEYCODE_BUTTON_2 = self.UNKNOWN
    self.KEYCODE_BUTTON_3 = self.UNKNOWN
    self.KEYCODE_BUTTON_4 = self.UNKNOWN
    self.KEYCODE_BUTTON_5 = self.UNKNOWN
    self.KEYCODE_BUTTON_6 = self.UNKNOWN
    self.KEYCODE_BUTTON_7 = self.UNKNOWN
    self.KEYCODE_BUTTON_8 = self.UNKNOWN
    self.KEYCODE_BUTTON_9 = self.UNKNOWN
    self.SOFT_LEFT = AndroidGameKey.new(KeyEvent.KEYCODE_SOFT_LEFT, "SOFT_LEFT")
    self.SOFT_RIGHT = AndroidGameKey.new(KeyEvent.KEYCODE_SOFT_RIGHT, "SOFT_RIGHT")
    self.HOME = AndroidGameKey.new(KeyEvent.KEYCODE_HOME, "HOME")
    self.BACK = AndroidGameKey.new(KeyEvent.KEYCODE_BACK, "BACK")
    self.CALL = AndroidGameKey.new(KeyEvent.KEYCODE_CALL, "CALL")
    self.ENDCALL = AndroidGameKey.new(KeyEvent.KEYCODE_ENDCALL, "ENDCALL")
    self.ZERO = AndroidGameKey.new(KeyEvent.KEYCODE_0, CommonPhoneStrings.getInstance().ZERO)
    self.ONE = AndroidGameKey.new(KeyEvent.KEYCODE_1, CommonPhoneStrings.getInstance().ONE)
    self.TWO = AndroidGameKey.new(KeyEvent.KEYCODE_2, CommonPhoneStrings.getInstance().TWO)
    self.THREE = AndroidGameKey.new(KeyEvent.KEYCODE_3, CommonPhoneStrings.getInstance().THREE)
    self.FOUR = AndroidGameKey.new(KeyEvent.KEYCODE_4, CommonPhoneStrings.getInstance().FOUR)
    self.FIVE = AndroidGameKey.new(KeyEvent.KEYCODE_5, CommonPhoneStrings.getInstance().FIVE)
    self.SIX = AndroidGameKey.new(KeyEvent.KEYCODE_6, CommonPhoneStrings.getInstance().SIX)
    self.SEVEN = AndroidGameKey.new(KeyEvent.KEYCODE_7, CommonPhoneStrings.getInstance().SEVEN)
    self.EIGHT = AndroidGameKey.new(KeyEvent.KEYCODE_8, CommonPhoneStrings.getInstance().EIGHT)
    self.NINE = AndroidGameKey.new(KeyEvent.KEYCODE_9, CommonPhoneStrings.getInstance().NINE)
    self.STAR = AndroidGameKey.new(KeyEvent.KEYCODE_STAR, CommonPhoneStrings.getInstance().STAR)
    self.POUND = AndroidGameKey.new(KeyEvent.KEYCODE_POUND, CommonPhoneStrings.getInstance().POUND)
    self.DPAD_UP = AndroidGameKey.new(KeyEvent.KEYCODE_DPAD_UP, "UP")
    self.DPAD_DOWN = AndroidGameKey.new(KeyEvent.KEYCODE_DPAD_DOWN, "DOWN")
    self.DPAD_LEFT = AndroidGameKey.new(KeyEvent.KEYCODE_DPAD_LEFT, "LEFT")
    self.DPAD_RIGHT = AndroidGameKey.new(KeyEvent.KEYCODE_DPAD_RIGHT, "RIGHT")
    self.DPAD_CENTER = AndroidGameKey.new(KeyEvent.KEYCODE_DPAD_CENTER, "CENTER")
    self.VOLUME_UP = AndroidGameKey.new(KeyEvent.KEYCODE_VOLUME_UP, "VOLUME_UP")
    self.VOLUME_DOWN = AndroidGameKey.new(KeyEvent.KEYCODE_VOLUME_DOWN, "VOLUME_DOWN")
    self.POWER = AndroidGameKey.new(KeyEvent.KEYCODE_POWER, "POWER")
    self.CAMERA = AndroidGameKey.new(KeyEvent.KEYCODE_CAMERA, "CAMERA")
    self.CLEAR = AndroidGameKey.new(KeyEvent.KEYCODE_CLEAR, "CLEAR")
    self.A = AndroidGameKey.new(KeyEvent.KEYCODE_A, "A")
    self.B = AndroidGameKey.new(KeyEvent.KEYCODE_B, "B")
    self.C = AndroidGameKey.new(KeyEvent.KEYCODE_C, "C")
    self.D = AndroidGameKey.new(KeyEvent.KEYCODE_D, "D")
    self.E = AndroidGameKey.new(KeyEvent.KEYCODE_E, "E")
    self.F = AndroidGameKey.new(KeyEvent.KEYCODE_F, "F")
    self.G = AndroidGameKey.new(KeyEvent.KEYCODE_G, "G")
    self.H = AndroidGameKey.new(KeyEvent.KEYCODE_H, "H")
    self.I = AndroidGameKey.new(KeyEvent.KEYCODE_I, "I")
    self.J = AndroidGameKey.new(KeyEvent.KEYCODE_J, "J")
    self.K = AndroidGameKey.new(KeyEvent.KEYCODE_K, "K")
    self.L = AndroidGameKey.new(KeyEvent.KEYCODE_L, "L")
    self.M = AndroidGameKey.new(KeyEvent.KEYCODE_M, "M")
    self.N = AndroidGameKey.new(KeyEvent.KEYCODE_N, "N")
    self.O = AndroidGameKey.new(KeyEvent.KEYCODE_O, "O")
    self.P = AndroidGameKey.new(KeyEvent.KEYCODE_P, "P")
    self.Q = AndroidGameKey.new(KeyEvent.KEYCODE_Q, "Q")
    self.R = AndroidGameKey.new(KeyEvent.KEYCODE_R, "R")
    self.S = AndroidGameKey.new(KeyEvent.KEYCODE_S, "S")
    self.T = AndroidGameKey.new(KeyEvent.KEYCODE_T, "T")
    self.U = AndroidGameKey.new(KeyEvent.KEYCODE_U, "U")
    self.V = AndroidGameKey.new(KeyEvent.KEYCODE_V, "V")
    self.W = AndroidGameKey.new(KeyEvent.KEYCODE_W, "W")
    self.X = AndroidGameKey.new(KeyEvent.KEYCODE_X, "X")
    self.Y = AndroidGameKey.new(KeyEvent.KEYCODE_Y, "Y")
    self.Z = AndroidGameKey.new(KeyEvent.KEYCODE_Z, "Z")
    self.COMMA = AndroidGameKey.new(KeyEvent.KEYCODE_COMMA, "COMMA")
    self.PERIOD = AndroidGameKey.new(KeyEvent.KEYCODE_PERIOD, AbPathData.getInstance().EXTENSION_SEP)
    self.ALT_LEFT = AndroidGameKey.new(KeyEvent.KEYCODE_ALT_LEFT, "ALT_LEFT")
    self.ALT_RIGHT = AndroidGameKey.new(KeyEvent.KEYCODE_ALT_RIGHT, "ALT_RIGHT")
    self.SHIFT_LEFT = AndroidGameKey.new(KeyEvent.KEYCODE_SHIFT_LEFT, "SHIFT_LEFT")
    self.SHIFT_RIGHT = AndroidGameKey.new(KeyEvent.KEYCODE_SHIFT_RIGHT, "SHIFT_RIGHT")
    self.TAB = AndroidGameKey.new(KeyEvent.KEYCODE_TAB, "TAB")
    self.SPACE = AndroidGameKey.new(KeyEvent.KEYCODE_SPACE, "SPACE")
    self.SYM = AndroidGameKey.new(KeyEvent.KEYCODE_SYM, "SYM")
    self.EXPLORER = AndroidGameKey.new(KeyEvent.KEYCODE_EXPLORER, "EXPLORER")
    self.ENVELOPE = AndroidGameKey.new(KeyEvent.KEYCODE_ENVELOPE, "ENVELOPE")
    self.ENTER = AndroidGameKey.new(KeyEvent.KEYCODE_ENTER, "ENTER")
    self.DEL = AndroidGameKey.new(KeyEvent.KEYCODE_DEL, "DEL")
    self.GRAVE = AndroidGameKey.new(KeyEvent.KEYCODE_GRAVE, "GRAVE")
    self.MINUS = AndroidGameKey.new(KeyEvent.KEYCODE_MINUS, "MINUS")
    self.EQUALS = AndroidGameKey.new(KeyEvent.KEYCODE_EQUALS, "EQUALS")
    self.LEFT_BRACKET = AndroidGameKey.new(KeyEvent.KEYCODE_LEFT_BRACKET, "LEFT_BRACKET")
    self.RIGHT_BRACKET = AndroidGameKey.new(KeyEvent.KEYCODE_RIGHT_BRACKET, "RIGHT_BRACKET")
    self.BACKSLASH = AndroidGameKey.new(KeyEvent.KEYCODE_BACKSLASH, "BACKSLASH")
    self.SEMICOLON = AndroidGameKey.new(KeyEvent.KEYCODE_SEMICOLON, "SEMICOLON")
    self.APOSTROPHE = AndroidGameKey.new(KeyEvent.KEYCODE_APOSTROPHE, "APOSTROPHE")
    self.SLASH = AndroidGameKey.new(KeyEvent.KEYCODE_SLASH, "SLASH")
    self.AT = AndroidGameKey.new(KeyEvent.KEYCODE_AT, "AT")
    self.NUM = AndroidGameKey.new(KeyEvent.KEYCODE_NUM, "NUM")
    self.HEADSETHOOK = AndroidGameKey.new(KeyEvent.KEYCODE_HEADSETHOOK, "HEADSETHOOK")
    self.FOCUS = AndroidGameKey.new(KeyEvent.KEYCODE_FOCUS, "FOCUS")
    self.PLUS = AndroidGameKey.new(KeyEvent.KEYCODE_PLUS, "PLUS")
    self.MENU = AndroidGameKey.new(KeyEvent.KEYCODE_MENU, "MENU")
    self.NOTIFICATION = AndroidGameKey.new(KeyEvent.KEYCODE_NOTIFICATION, "NOTIFICATION")
    self.SEARCH = AndroidGameKey.new(KeyEvent.KEYCODE_SEARCH, "SEARCH")
end

function AndroidKeyFactory.new()
    local self = setmetatable(ActivityFractureUtil.new(), AndroidKeyFactory)
    self:_init_fields()
    return self
end


function AndroidKeyFactory:init()
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF("Start/End", self, commonStrings.INIT)
end


function AndroidKeyFactory:isSubmission(input)
        if input == self.ENTER then
            return true
        elseif input == self.DPAD_CENTER then
            return true
        end
        return false
end


function AndroidKeyFactory:isDelete(input)
        return false
end


function AndroidKeyFactory:isBackSpace(input)
        if input == self.DEL then
            return true
        end
        return false
end


function AndroidKeyFactory:isLeft(input)
        if input == self.DPAD_LEFT then
            return true
        end
        return false
end


function AndroidKeyFactory:isRight(input)
        if input == self.DPAD_RIGHT then
            return true
        end
        return false
end


function AndroidKeyFactory:isUp(input)
        if input == self.DPAD_UP then
            return true
        end
        return false
end


function AndroidKeyFactory:isDown(input)
        if input == self.DPAD_DOWN then
            return true
        end
        return false
end


function AndroidKeyFactory:isEnter(input)
        if input == self.DPAD_CENTER then
            return true
        elseif input == self.ENTER then
            return true
        elseif input == self.CALL then
            return true
        end
        return false
end

return AndroidKeyFactory

