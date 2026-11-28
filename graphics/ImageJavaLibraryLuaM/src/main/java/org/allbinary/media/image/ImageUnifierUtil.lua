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
-- package org.allbinary.media.image

local ImageUnifierUtil = {}
package.loaded["org.allbinary.media.image.ImageUnifierUtil"] = ImageUnifierUtil

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

-- local GraphicsEnvironment = require("java.awt.GraphicsEnvironment")
-- local GraphicsDevice = require("java.awt.GraphicsDevice")
-- local GraphicsConfiguration = require("java.awt.GraphicsConfiguration")
-- local Graphics2D = require("java.awt.Graphics2D")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local ImageUnifierProperties = java_lazy("org.allbinary.media.image.ImageUnifierProperties")
local ImageUtil = java_lazy("org.allbinary.media.image.ImageUtil")

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

-- class table ImageUnifierUtil is declared before the requires
ImageUnifierUtil.__index = ImageUnifierUtil
ImageUnifierUtil.className = "ImageUnifierUtil"
ImageUnifierUtil.javaClassName = "org.allbinary.media.image.ImageUnifierUtil"

function ImageUnifierUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.imageUtil = ImageUtil.getInstance()
end


function ImageUnifierUtil.getInstance()
        return ImageUnifierUtil.instance_f
end


function ImageUnifierUtil._jinit(self)
    ImageUnifierUtil._init_fields(self)
    return self
end

function ImageUnifierUtil.new(...)
    local self = setmetatable({}, ImageUnifierUtil)
    ImageUnifierUtil._jinit(self, ...)
    return self
end


function ImageUnifierUtil:getDefaultConfiguration()
        local ge = GraphicsEnvironment.getLocalGraphicsEnvironment()
        local gd = ge:getDefaultScreenDevice()
        return gd:getDefaultConfiguration()
end


function ImageUnifierUtil:getImage(bufferedImageArray, imageUnifierProperties)
        local newBufferedImage = self.imageUtil:create(imageUnifierProperties:getWidth(), imageUnifierProperties:getHeight())
        local commonLabels = CommonLabels.getInstance()
        self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Setting Image - ") .. require("allbinary_java").to_string(commonLabels.WIDTH_LABEL)) .. require("allbinary_java").to_string(newBufferedImage:getWidth())) .. require("allbinary_java").to_string(commonLabels.HEIGHT_LABEL)) .. require("allbinary_java").to_string(newBufferedImage:getHeight()), self, "getImage")
        local g = newBufferedImage:createGraphics()
        local columnIndex = 0
        local rowIndex = 0
        for index = 0, (bufferedImageArray.n or #bufferedImageArray) - 1 do
            local x = require("allbinary_java").number_value(imageUnifierProperties:getImageUnifierCell():getWidth(), "intValue") * (function() local value = columnIndex columnIndex = value + 1 return value end)()
            local y = require("allbinary_java").number_value(imageUnifierProperties:getImageUnifierCell():getHeight(), "intValue") * rowIndex
            self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Adding Image: ") .. require("allbinary_java").to_string(index)) .. require("allbinary_java").to_string(" x: ")) .. require("allbinary_java").to_string(x)) .. require("allbinary_java").to_string(" y: ")) .. require("allbinary_java").to_string(y), self, "getImage")
            g:drawImage(bufferedImageArray[index + 1], x, y, require("allbinary_java").number_value(imageUnifierProperties:getImageUnifierCell():getWidth(), "intValue"), require("allbinary_java").number_value(imageUnifierProperties:getImageUnifierCell():getHeight(), "intValue"), nil)
            local totalColumnsMinusOne = (require("allbinary_java").number_value(imageUnifierProperties:getColumns(), "intValue") - 1)
            if columnIndex > totalColumnsMinusOne then
                rowIndex = rowIndex + 1
                columnIndex = 0
            end
        end
        g:dispose()
        return newBufferedImage
end

ImageUnifierUtil.instance_f = ImageUnifierUtil.new()

return ImageUnifierUtil

