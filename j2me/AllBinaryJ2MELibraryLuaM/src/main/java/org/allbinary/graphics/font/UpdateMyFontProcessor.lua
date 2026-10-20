-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.graphics.font

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UpdateMyFontProcessor = {}
UpdateMyFontProcessor.__index = UpdateMyFontProcessor
UpdateMyFontProcessor.className = "UpdateMyFontProcessor"
setmetatable(UpdateMyFontProcessor, {__index = MyFontProcessor})

function UpdateMyFontProcessor:_init_fields()
    self.updateMeasurementProcessor = nil
end


function UpdateMyFontProcessor.new(keyValueDrawCharArray)
    local self = setmetatable(MyFontProcessor.new(), UpdateMyFontProcessor)
    self:_init_fields()
        self.updateMeasurementProcessor = keyValueDrawCharArray
    return self
end


function UpdateMyFontProcessor:process(graphics)
        self.updateMeasurementProcessor:updateMeasurement(graphics)
end

return UpdateMyFontProcessor

