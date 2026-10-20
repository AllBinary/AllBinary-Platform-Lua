-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.animation.text

-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Font = require("javax.microedition.lcdui.Font")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local CustomTextBox = require("org.allbinary.graphics.form.item.CustomTextBox")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CustomTextBox2 = {}
CustomTextBox2.__index = CustomTextBox2
CustomTextBox2.className = "CustomTextBox2"
setmetatable(CustomTextBox2, {__index = CustomTextBox})


function CustomTextBox2.new(cmdListener, label, text, maxSize, constraints, font, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(CustomTextBox.new(cmdListener, label, text, maxSize, constraints, font, backgroundBasicColor, foregroundBasicColor), CustomTextBox2)
        -- super(...) made self above
        self:getTextFieldItem():setFocus(true)
    return self
end

return CustomTextBox2

