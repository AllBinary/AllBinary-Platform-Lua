-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2026 AllBinary 
--  
-- By agreeing to this license you and any business entity you represent are 
-- legally bound to the AllBinary Open License Version 1 legal agreement. 
--  
-- You may obtain the AllBinary Open License Version 1 legal agreement from 
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
--  
-- Created By: Travis Berthelot 
--   
-- Generated Code Do Not Modify
-- package org.allbinary.game.input

local ABKeyEventWrapper = {}
package.loaded["org.allbinary.game.input.ABKeyEventWrapper"] = ABKeyEventWrapper

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

-- local KeyEvent = require("java.awt.event.KeyEvent")
local JsType = java_lazy("jsinterop.annotations.JsType")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table ABKeyEventWrapper is declared before the requires
ABKeyEventWrapper.__index = ABKeyEventWrapper
ABKeyEventWrapper.className = "ABKeyEventWrapper"
ABKeyEventWrapper.javaClassName = "org.allbinary.game.input.ABKeyEventWrapper"

function ABKeyEventWrapper:_init_fields()
    self.VK_ENTER = 10
    self.VK_BACK_SPACE = 8
    self.VK_TAB = 9
    self.VK_CANCEL = 3
    self.VK_CLEAR = 12
    self.VK_SHIFT = 16
    self.VK_CONTROL = 17
    self.VK_ALT = 18
    self.VK_PAUSE = 19
    self.VK_CAPS_LOCK = 20
    self.VK_ESCAPE = 27
    self.VK_SPACE = 32
    self.VK_PAGE_UP = 33
    self.VK_PAGE_DOWN = 34
    self.VK_END = 35
    self.VK_HOME = 36
    self.VK_LEFT = 37
    self.VK_UP = 38
    self.VK_RIGHT = 39
    self.VK_DOWN = 40
    self.VK_COMMA = 44
    self.VK_MINUS = 45
    self.VK_PERIOD = 46
    self.VK_SLASH = 47
    self.VK_0 = 48
    self.VK_1 = 49
    self.VK_2 = 50
    self.VK_3 = 51
    self.VK_4 = 52
    self.VK_5 = 53
    self.VK_6 = 54
    self.VK_7 = 55
    self.VK_8 = 56
    self.VK_9 = 57
    self.VK_SEMICOLON = 59
    self.VK_EQUALS = 61
    self.VK_A = 65
    self.VK_B = 66
    self.VK_C = 67
    self.VK_D = 68
    self.VK_E = 69
    self.VK_F = 70
    self.VK_G = 71
    self.VK_H = 72
    self.VK_I = 73
    self.VK_J = 74
    self.VK_K = 75
    self.VK_L = 76
    self.VK_M = 77
    self.VK_N = 78
    self.VK_O = 79
    self.VK_P = 80
    self.VK_Q = 81
    self.VK_R = 82
    self.VK_S = 83
    self.VK_T = 84
    self.VK_U = 85
    self.VK_V = 86
    self.VK_W = 87
    self.VK_X = 88
    self.VK_Y = 89
    self.VK_Z = 90
    self.VK_OPEN_BRACKET = 91
    self.VK_BACK_SLASH = 92
    self.VK_CLOSE_BRACKET = 93
    self.VK_NUMPAD0 = 96
    self.VK_NUMPAD1 = 97
    self.VK_NUMPAD2 = 98
    self.VK_NUMPAD3 = 99
    self.VK_NUMPAD4 = 100
    self.VK_NUMPAD5 = 101
    self.VK_NUMPAD6 = 102
    self.VK_NUMPAD7 = 103
    self.VK_NUMPAD8 = 104
    self.VK_NUMPAD9 = 105
    self.VK_MULTIPLY = 106
    self.VK_ADD = 107
    self.VK_SEPARATER = 108
    self.VK_SEPARATOR = 108
    self.VK_SUBTRACT = 109
    self.VK_DECIMAL = 110
    self.VK_DIVIDE = 111
    self.VK_DELETE = 127
    self.VK_NUM_LOCK = 144
    self.VK_SCROLL_LOCK = 145
    self.VK_F1 = 112
    self.VK_F2 = 113
    self.VK_F3 = 114
    self.VK_F4 = 115
    self.VK_F5 = 116
    self.VK_F6 = 117
    self.VK_F7 = 118
    self.VK_F8 = 119
    self.VK_F9 = 120
    self.VK_F10 = 121
    self.VK_F11 = 122
    self.VK_F12 = 123
    self.VK_F13 = 61440
    self.VK_F14 = 61441
    self.VK_F15 = 61442
    self.VK_F16 = 61443
    self.VK_F17 = 61444
    self.VK_F18 = 61445
    self.VK_F19 = 61446
    self.VK_F20 = 61447
    self.VK_F21 = 61448
    self.VK_F22 = 61449
    self.VK_F23 = 61450
    self.VK_F24 = 61451
    self.VK_PRINTSCREEN = 154
    self.VK_INSERT = 155
    self.VK_HELP = 156
    self.VK_META = 157
    self.VK_BACK_QUOTE = 192
    self.VK_QUOTE = 222
    self.VK_KP_UP = 224
    self.VK_KP_DOWN = 225
    self.VK_KP_LEFT = 226
    self.VK_KP_RIGHT = 227
    self.VK_DEAD_GRAVE = 128
    self.VK_DEAD_ACUTE = 129
    self.VK_DEAD_CIRCUMFLEX = 130
    self.VK_DEAD_TILDE = 131
    self.VK_DEAD_MACRON = 132
    self.VK_DEAD_BREVE = 133
    self.VK_DEAD_ABOVEDOT = 134
    self.VK_DEAD_DIAERESIS = 135
    self.VK_DEAD_ABOVERING = 136
    self.VK_DEAD_DOUBLEACUTE = 137
    self.VK_DEAD_CARON = 138
    self.VK_DEAD_CEDILLA = 139
    self.VK_DEAD_OGONEK = 140
    self.VK_DEAD_IOTA = 141
    self.VK_DEAD_VOICED_SOUND = 142
    self.VK_DEAD_SEMIVOICED_SOUND = 143
    self.VK_AMPERSAND = 150
    self.VK_ASTERISK = 151
    self.VK_QUOTEDBL = 152
    self.VK_LESS = 153
    self.VK_GREATER = 160
    self.VK_BRACELEFT = 161
    self.VK_BRACERIGHT = 162
    self.VK_AT = 512
    self.VK_COLON = 513
    self.VK_CIRCUMFLEX = 514
    self.VK_DOLLAR = 515
    self.VK_EURO_SIGN = 516
    self.VK_EXCLAMATION_MARK = 517
    self.VK_INVERTED_EXCLAMATION_MARK = 518
    self.VK_LEFT_PARENTHESIS = 519
    self.VK_NUMBER_SIGN = 520
    self.VK_PLUS = 521
    self.VK_RIGHT_PARENTHESIS = 522
    self.VK_UNDERSCORE = 523
    self.VK_WINDOWS = 524
    self.VK_CONTEXT_MENU = 525
    self.VK_FINAL = 24
    self.VK_CONVERT = 28
    self.VK_NONCONVERT = 29
    self.VK_ACCEPT = 30
    self.VK_MODECHANGE = 31
    self.VK_KANA = 21
    self.VK_KANJI = 25
    self.VK_ALPHANUMERIC = 240
    self.VK_KATAKANA = 241
    self.VK_HIRAGANA = 242
    self.VK_FULL_WIDTH = 243
    self.VK_HALF_WIDTH = 244
    self.VK_ROMAN_CHARACTERS = 245
    self.VK_ALL_CANDIDATES = 256
    self.VK_PREVIOUS_CANDIDATE = 257
    self.VK_CODE_INPUT = 258
    self.VK_JAPANESE_KATAKANA = 259
    self.VK_JAPANESE_HIRAGANA = 260
    self.VK_JAPANESE_ROMAN = 261
    self.VK_KANA_LOCK = 262
    self.VK_INPUT_METHOD_ON_OFF = 263
    self.VK_CUT = 65489
    self.VK_COPY = 65485
    self.VK_PASTE = 65487
    self.VK_UNDO = 65483
    self.VK_AGAIN = 65481
    self.VK_FIND = 65488
    self.VK_PROPS = 65482
    self.VK_STOP = 65480
    self.VK_COMPOSE = 65312
    self.VK_ALT_GRAPH = 65406
    self.VK_BEGIN = 65368
    self.VK_UNDEFINED = 0
end

function ABKeyEventWrapper._jinit(self)
    ABKeyEventWrapper._init_fields(self)
    return self
end

function ABKeyEventWrapper.new()
    return ABKeyEventWrapper._jinit(setmetatable({}, ABKeyEventWrapper))
end


function ABKeyEventWrapper.getInstance()
        return ABKeyEventWrapper.instance_f
end

ABKeyEventWrapper.instance_f = ABKeyEventWrapper.new()

return ABKeyEventWrapper

