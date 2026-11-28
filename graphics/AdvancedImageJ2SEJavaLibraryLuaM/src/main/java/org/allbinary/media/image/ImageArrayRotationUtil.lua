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
-- package org.allbinary.media.image

local ImageArrayRotationUtil = {}
package.loaded["org.allbinary.media.image.ImageArrayRotationUtil"] = ImageArrayRotationUtil

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

-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local IOException = require("java.io.IOException")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ImageJ2SERotationUtil = java_lazy("org.allbinary.media.image.ImageJ2SERotationUtil")
local ImageProcessedVisitor = java_lazy("org.allbinary.media.image.ImageProcessedVisitor")
local ImageProcessorInput = java_lazy("org.allbinary.media.image.ImageProcessorInput")

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

-- class table ImageArrayRotationUtil is declared before the requires
ImageArrayRotationUtil.__index = ImageArrayRotationUtil
ImageArrayRotationUtil.className = "ImageArrayRotationUtil"
ImageArrayRotationUtil.javaClassName = "org.allbinary.media.image.ImageArrayRotationUtil"

function ImageArrayRotationUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.TOTAL_ANGLE = "totalAngle: "
end

function ImageArrayRotationUtil._jinit(self)
    ImageArrayRotationUtil._init_fields(self)
    return self
end

function ImageArrayRotationUtil.new()
    return ImageArrayRotationUtil._jinit(setmetatable({}, ImageArrayRotationUtil))
end


function ImageArrayRotationUtil.getInstance()
        return ImageArrayRotationUtil.instance_f
end


-- throws IOException
function ImageArrayRotationUtil:process(imageProcessorInput, input, visitor)
        local totalAngle = nil
        if rawequal(input, self.commonStrings.UP) then
            totalAngle = tostring(-90)
        elseif rawequal(input, self.commonStrings.DOWN) then
            totalAngle = tostring(90)
        else
            totalAngle = tostring(input)
        end
        local generatedBufferedImage = nil
        local bufferedImageArray = imageProcessorInput:getBufferedImageArray()
        for index = 0, (bufferedImageArray.n or #bufferedImageArray) - 1 do
            self.logUtil:putF(require("allbinary_java").to_string(self.TOTAL_ANGLE) .. require("allbinary_java").to_string(totalAngle), self, self.commonStrings.RUN)
            generatedBufferedImage = ImageJ2SERotationUtil.getInstance():getRotatedImage(bufferedImageArray[index + 1], math.tointeger(totalAngle // 1))
            visitor:visit(generatedBufferedImage, input, index)
        end
end

ImageArrayRotationUtil.instance_f = ImageArrayRotationUtil.new()

return ImageArrayRotationUtil

