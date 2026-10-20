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

-- local KeyEvent = require("java.awt.event.KeyEvent")
local JsType = require("jsinterop.annotations.JsType")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ABKeyEventWrapper = {}
ABKeyEventWrapper.__index = ABKeyEventWrapper
ABKeyEventWrapper.className = "ABKeyEventWrapper"

function ABKeyEventWrapper:_init_fields()
    self.VK_ENTER = KeyEvent.VK_ENTER
    self.VK_BACK_SPACE = KeyEvent.VK_BACK_SPACE
    self.VK_TAB = KeyEvent.VK_TAB
    self.VK_CANCEL = KeyEvent.VK_CANCEL
    self.VK_CLEAR = KeyEvent.VK_CLEAR
    self.VK_SHIFT = KeyEvent.VK_SHIFT
    self.VK_CONTROL = KeyEvent.VK_CONTROL
    self.VK_ALT = KeyEvent.VK_ALT
    self.VK_PAUSE = KeyEvent.VK_PAUSE
    self.VK_CAPS_LOCK = KeyEvent.VK_CAPS_LOCK
    self.VK_ESCAPE = KeyEvent.VK_ESCAPE
    self.VK_SPACE = KeyEvent.VK_SPACE
    self.VK_PAGE_UP = KeyEvent.VK_PAGE_UP
    self.VK_PAGE_DOWN = KeyEvent.VK_PAGE_DOWN
    self.VK_END = KeyEvent.VK_END
    self.VK_HOME = KeyEvent.VK_HOME
    self.VK_LEFT = KeyEvent.VK_LEFT
    self.VK_UP = KeyEvent.VK_UP
    self.VK_RIGHT = KeyEvent.VK_RIGHT
    self.VK_DOWN = KeyEvent.VK_DOWN
    self.VK_COMMA = KeyEvent.VK_COMMA
    self.VK_MINUS = KeyEvent.VK_MINUS
    self.VK_PERIOD = KeyEvent.VK_PERIOD
    self.VK_SLASH = KeyEvent.VK_SLASH
    self.VK_0 = KeyEvent.VK_0
    self.VK_1 = KeyEvent.VK_1
    self.VK_2 = KeyEvent.VK_2
    self.VK_3 = KeyEvent.VK_3
    self.VK_4 = KeyEvent.VK_4
    self.VK_5 = KeyEvent.VK_5
    self.VK_6 = KeyEvent.VK_6
    self.VK_7 = KeyEvent.VK_7
    self.VK_8 = KeyEvent.VK_8
    self.VK_9 = KeyEvent.VK_9
    self.VK_SEMICOLON = KeyEvent.VK_SEMICOLON
    self.VK_EQUALS = KeyEvent.VK_EQUALS
    self.VK_A = KeyEvent.VK_A
    self.VK_B = KeyEvent.VK_B
    self.VK_C = KeyEvent.VK_C
    self.VK_D = KeyEvent.VK_D
    self.VK_E = KeyEvent.VK_E
    self.VK_F = KeyEvent.VK_F
    self.VK_G = KeyEvent.VK_G
    self.VK_H = KeyEvent.VK_H
    self.VK_I = KeyEvent.VK_I
    self.VK_J = KeyEvent.VK_J
    self.VK_K = KeyEvent.VK_K
    self.VK_L = KeyEvent.VK_L
    self.VK_M = KeyEvent.VK_M
    self.VK_N = KeyEvent.VK_N
    self.VK_O = KeyEvent.VK_O
    self.VK_P = KeyEvent.VK_P
    self.VK_Q = KeyEvent.VK_Q
    self.VK_R = KeyEvent.VK_R
    self.VK_S = KeyEvent.VK_S
    self.VK_T = KeyEvent.VK_T
    self.VK_U = KeyEvent.VK_U
    self.VK_V = KeyEvent.VK_V
    self.VK_W = KeyEvent.VK_W
    self.VK_X = KeyEvent.VK_X
    self.VK_Y = KeyEvent.VK_Y
    self.VK_Z = KeyEvent.VK_Z
    self.VK_OPEN_BRACKET = KeyEvent.VK_OPEN_BRACKET
    self.VK_BACK_SLASH = KeyEvent.VK_BACK_SLASH
    self.VK_CLOSE_BRACKET = KeyEvent.VK_CLOSE_BRACKET
    self.VK_NUMPAD0 = KeyEvent.VK_NUMPAD0
    self.VK_NUMPAD1 = KeyEvent.VK_NUMPAD1
    self.VK_NUMPAD2 = KeyEvent.VK_NUMPAD2
    self.VK_NUMPAD3 = KeyEvent.VK_NUMPAD3
    self.VK_NUMPAD4 = KeyEvent.VK_NUMPAD4
    self.VK_NUMPAD5 = KeyEvent.VK_NUMPAD5
    self.VK_NUMPAD6 = KeyEvent.VK_NUMPAD6
    self.VK_NUMPAD7 = KeyEvent.VK_NUMPAD7
    self.VK_NUMPAD8 = KeyEvent.VK_NUMPAD8
    self.VK_NUMPAD9 = KeyEvent.VK_NUMPAD9
    self.VK_MULTIPLY = KeyEvent.VK_MULTIPLY
    self.VK_ADD = KeyEvent.VK_ADD
    self.VK_SEPARATER = KeyEvent.VK_SEPARATER
    self.VK_SEPARATOR = KeyEvent.VK_SEPARATOR
    self.VK_SUBTRACT = KeyEvent.VK_SUBTRACT
    self.VK_DECIMAL = KeyEvent.VK_DECIMAL
    self.VK_DIVIDE = KeyEvent.VK_DIVIDE
    self.VK_DELETE = KeyEvent.VK_DELETE
    self.VK_NUM_LOCK = KeyEvent.VK_NUM_LOCK
    self.VK_SCROLL_LOCK = KeyEvent.VK_SCROLL_LOCK
    self.VK_F1 = KeyEvent.VK_F1
    self.VK_F2 = KeyEvent.VK_F2
    self.VK_F3 = KeyEvent.VK_F3
    self.VK_F4 = KeyEvent.VK_F4
    self.VK_F5 = KeyEvent.VK_F5
    self.VK_F6 = KeyEvent.VK_F6
    self.VK_F7 = KeyEvent.VK_F7
    self.VK_F8 = KeyEvent.VK_F8
    self.VK_F9 = KeyEvent.VK_F9
    self.VK_F10 = KeyEvent.VK_F10
    self.VK_F11 = KeyEvent.VK_F11
    self.VK_F12 = KeyEvent.VK_F12
    self.VK_F13 = KeyEvent.VK_F13
    self.VK_F14 = KeyEvent.VK_F14
    self.VK_F15 = KeyEvent.VK_F15
    self.VK_F16 = KeyEvent.VK_F16
    self.VK_F17 = KeyEvent.VK_F17
    self.VK_F18 = KeyEvent.VK_F18
    self.VK_F19 = KeyEvent.VK_F19
    self.VK_F20 = KeyEvent.VK_F20
    self.VK_F21 = KeyEvent.VK_F21
    self.VK_F22 = KeyEvent.VK_F22
    self.VK_F23 = KeyEvent.VK_F23
    self.VK_F24 = KeyEvent.VK_F24
    self.VK_PRINTSCREEN = KeyEvent.VK_PRINTSCREEN
    self.VK_INSERT = KeyEvent.VK_INSERT
    self.VK_HELP = KeyEvent.VK_HELP
    self.VK_META = KeyEvent.VK_META
    self.VK_BACK_QUOTE = KeyEvent.VK_BACK_QUOTE
    self.VK_QUOTE = KeyEvent.VK_QUOTE
    self.VK_KP_UP = KeyEvent.VK_KP_UP
    self.VK_KP_DOWN = KeyEvent.VK_KP_DOWN
    self.VK_KP_LEFT = KeyEvent.VK_KP_LEFT
    self.VK_KP_RIGHT = KeyEvent.VK_KP_RIGHT
    self.VK_DEAD_GRAVE = KeyEvent.VK_DEAD_GRAVE
    self.VK_DEAD_ACUTE = KeyEvent.VK_DEAD_ACUTE
    self.VK_DEAD_CIRCUMFLEX = KeyEvent.VK_DEAD_CIRCUMFLEX
    self.VK_DEAD_TILDE = KeyEvent.VK_DEAD_TILDE
    self.VK_DEAD_MACRON = KeyEvent.VK_DEAD_MACRON
    self.VK_DEAD_BREVE = KeyEvent.VK_DEAD_BREVE
    self.VK_DEAD_ABOVEDOT = KeyEvent.VK_DEAD_ABOVEDOT
    self.VK_DEAD_DIAERESIS = KeyEvent.VK_DEAD_DIAERESIS
    self.VK_DEAD_ABOVERING = KeyEvent.VK_DEAD_ABOVERING
    self.VK_DEAD_DOUBLEACUTE = KeyEvent.VK_DEAD_DOUBLEACUTE
    self.VK_DEAD_CARON = KeyEvent.VK_DEAD_CARON
    self.VK_DEAD_CEDILLA = KeyEvent.VK_DEAD_CEDILLA
    self.VK_DEAD_OGONEK = KeyEvent.VK_DEAD_OGONEK
    self.VK_DEAD_IOTA = KeyEvent.VK_DEAD_IOTA
    self.VK_DEAD_VOICED_SOUND = KeyEvent.VK_DEAD_VOICED_SOUND
    self.VK_DEAD_SEMIVOICED_SOUND = KeyEvent.VK_DEAD_SEMIVOICED_SOUND
    self.VK_AMPERSAND = KeyEvent.VK_AMPERSAND
    self.VK_ASTERISK = KeyEvent.VK_ASTERISK
    self.VK_QUOTEDBL = KeyEvent.VK_QUOTEDBL
    self.VK_LESS = KeyEvent.VK_LESS
    self.VK_GREATER = KeyEvent.VK_GREATER
    self.VK_BRACELEFT = KeyEvent.VK_BRACELEFT
    self.VK_BRACERIGHT = KeyEvent.VK_BRACERIGHT
    self.VK_AT = KeyEvent.VK_AT
    self.VK_COLON = KeyEvent.VK_COLON
    self.VK_CIRCUMFLEX = KeyEvent.VK_CIRCUMFLEX
    self.VK_DOLLAR = KeyEvent.VK_DOLLAR
    self.VK_EURO_SIGN = KeyEvent.VK_EURO_SIGN
    self.VK_EXCLAMATION_MARK = KeyEvent.VK_EXCLAMATION_MARK
    self.VK_INVERTED_EXCLAMATION_MARK = KeyEvent.VK_INVERTED_EXCLAMATION_MARK
    self.VK_LEFT_PARENTHESIS = KeyEvent.VK_LEFT_PARENTHESIS
    self.VK_NUMBER_SIGN = KeyEvent.VK_NUMBER_SIGN
    self.VK_PLUS = KeyEvent.VK_PLUS
    self.VK_RIGHT_PARENTHESIS = KeyEvent.VK_RIGHT_PARENTHESIS
    self.VK_UNDERSCORE = KeyEvent.VK_UNDERSCORE
    self.VK_WINDOWS = KeyEvent.VK_WINDOWS
    self.VK_CONTEXT_MENU = KeyEvent.VK_CONTEXT_MENU
    self.VK_FINAL = KeyEvent.VK_FINAL
    self.VK_CONVERT = KeyEvent.VK_CONVERT
    self.VK_NONCONVERT = KeyEvent.VK_NONCONVERT
    self.VK_ACCEPT = KeyEvent.VK_ACCEPT
    self.VK_MODECHANGE = KeyEvent.VK_MODECHANGE
    self.VK_KANA = KeyEvent.VK_KANA
    self.VK_KANJI = KeyEvent.VK_KANJI
    self.VK_ALPHANUMERIC = KeyEvent.VK_ALPHANUMERIC
    self.VK_KATAKANA = KeyEvent.VK_KATAKANA
    self.VK_HIRAGANA = KeyEvent.VK_HIRAGANA
    self.VK_FULL_WIDTH = KeyEvent.VK_FULL_WIDTH
    self.VK_HALF_WIDTH = KeyEvent.VK_HALF_WIDTH
    self.VK_ROMAN_CHARACTERS = KeyEvent.VK_ROMAN_CHARACTERS
    self.VK_ALL_CANDIDATES = KeyEvent.VK_ALL_CANDIDATES
    self.VK_PREVIOUS_CANDIDATE = KeyEvent.VK_PREVIOUS_CANDIDATE
    self.VK_CODE_INPUT = KeyEvent.VK_CODE_INPUT
    self.VK_JAPANESE_KATAKANA = KeyEvent.VK_JAPANESE_KATAKANA
    self.VK_JAPANESE_HIRAGANA = KeyEvent.VK_JAPANESE_HIRAGANA
    self.VK_JAPANESE_ROMAN = KeyEvent.VK_JAPANESE_ROMAN
    self.VK_KANA_LOCK = KeyEvent.VK_KANA_LOCK
    self.VK_INPUT_METHOD_ON_OFF = KeyEvent.VK_INPUT_METHOD_ON_OFF
    self.VK_CUT = KeyEvent.VK_CUT
    self.VK_COPY = KeyEvent.VK_COPY
    self.VK_PASTE = KeyEvent.VK_PASTE
    self.VK_UNDO = KeyEvent.VK_UNDO
    self.VK_AGAIN = KeyEvent.VK_AGAIN
    self.VK_FIND = KeyEvent.VK_FIND
    self.VK_PROPS = KeyEvent.VK_PROPS
    self.VK_STOP = KeyEvent.VK_STOP
    self.VK_COMPOSE = KeyEvent.VK_COMPOSE
    self.VK_ALT_GRAPH = KeyEvent.VK_ALT_GRAPH
    self.VK_BEGIN = KeyEvent.VK_BEGIN
    self.VK_UNDEFINED = KeyEvent.VK_UNDEFINED
end

function ABKeyEventWrapper.new()
    local self = setmetatable({}, ABKeyEventWrapper)
    self:_init_fields()
    return self
end


function ABKeyEventWrapper.getInstance()
        return ABKeyEventWrapper.instance
end

ABKeyEventWrapper.instance = ABKeyEventWrapper.new()

return ABKeyEventWrapper

