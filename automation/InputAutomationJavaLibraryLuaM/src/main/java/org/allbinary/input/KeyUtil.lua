--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
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
-- package org.allbinary.input

-- local KeyEvent = require("java.awt.event.KeyEvent")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local KeyUtil = {}
KeyUtil.__index = KeyUtil
KeyUtil.className = "KeyUtil"


function KeyUtil.new()
    local self = setmetatable({}, KeyUtil)
    return self
end


function KeyUtil.isNormallyDisplayed(keyCode)
        do
            local switch_value = keyCode
            if switch_value == KeyEvent.VK_SPACE or switch_value == KeyEvent.VK_COMMA or switch_value == KeyEvent.VK_MINUS or switch_value == KeyEvent.VK_PERIOD or switch_value == KeyEvent.VK_SLASH or switch_value == KeyEvent.VK_0 or switch_value == KeyEvent.VK_1 or switch_value == KeyEvent.VK_2 or switch_value == KeyEvent.VK_3 or switch_value == KeyEvent.VK_4 or switch_value == KeyEvent.VK_5 or switch_value == KeyEvent.VK_6 or switch_value == KeyEvent.VK_7 or switch_value == KeyEvent.VK_8 or switch_value == KeyEvent.VK_9 or switch_value == KeyEvent.VK_SEMICOLON or switch_value == KeyEvent.VK_EQUALS or switch_value == KeyEvent.VK_A or switch_value == KeyEvent.VK_B or switch_value == KeyEvent.VK_C or switch_value == KeyEvent.VK_D or switch_value == KeyEvent.VK_E or switch_value == KeyEvent.VK_F or switch_value == KeyEvent.VK_G or switch_value == KeyEvent.VK_H or switch_value == KeyEvent.VK_I or switch_value == KeyEvent.VK_J or switch_value == KeyEvent.VK_K or switch_value == KeyEvent.VK_L or switch_value == KeyEvent.VK_M or switch_value == KeyEvent.VK_N or switch_value == KeyEvent.VK_O or switch_value == KeyEvent.VK_P or switch_value == KeyEvent.VK_Q or switch_value == KeyEvent.VK_R or switch_value == KeyEvent.VK_S or switch_value == KeyEvent.VK_T or switch_value == KeyEvent.VK_U or switch_value == KeyEvent.VK_V or switch_value == KeyEvent.VK_W or switch_value == KeyEvent.VK_X or switch_value == KeyEvent.VK_Y or switch_value == KeyEvent.VK_Z or switch_value == KeyEvent.VK_OPEN_BRACKET or switch_value == KeyEvent.VK_BACK_SLASH or switch_value == KeyEvent.VK_CLOSE_BRACKET or switch_value == KeyEvent.VK_NUMPAD0 or switch_value == KeyEvent.VK_NUMPAD1 or switch_value == KeyEvent.VK_NUMPAD2 or switch_value == KeyEvent.VK_NUMPAD3 or switch_value == KeyEvent.VK_NUMPAD4 or switch_value == KeyEvent.VK_NUMPAD5 or switch_value == KeyEvent.VK_NUMPAD6 or switch_value == KeyEvent.VK_NUMPAD7 or switch_value == KeyEvent.VK_NUMPAD8 or switch_value == KeyEvent.VK_NUMPAD9 or switch_value == KeyEvent.VK_MULTIPLY or switch_value == KeyEvent.VK_ADD or switch_value == KeyEvent.VK_SEPARATER or switch_value == KeyEvent.VK_SUBTRACT or switch_value == KeyEvent.VK_DECIMAL or switch_value == KeyEvent.VK_DIVIDE then
                return true
            else
                return false
            end
        end
end

return KeyUtil

