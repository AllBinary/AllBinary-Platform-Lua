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
-- package org.allbinary.media.image.cache

local BufferedImageInfo = {}
package.loaded["org.allbinary.media.image.cache.BufferedImageInfo"] = BufferedImageInfo

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")

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

-- class table BufferedImageInfo is declared before the requires
BufferedImageInfo.__index = BufferedImageInfo
BufferedImageInfo.className = "BufferedImageInfo"
BufferedImageInfo.javaClassName = "org.allbinary.media.image.cache.BufferedImageInfo"

function BufferedImageInfo:_init_fields()
    if self.width == nil then self.width = nil end
    if self.height == nil then self.height = nil end
    if self.type == nil then self.type = nil end
end


function BufferedImageInfo._jinit(self, width, height, type)
    BufferedImageInfo._init_fields(self)
        self.width = width
        self.height = height
        self.type = type
    return self
end

function BufferedImageInfo.new(...)
    local self = setmetatable({}, BufferedImageInfo)
    BufferedImageInfo._jinit(self, ...)
    return self
end


function BufferedImageInfo:getWidth()
        return self.width
end


function BufferedImageInfo:setWidth(width)
        self.width = width
end


function BufferedImageInfo:getHeight()
        return self.height
end


function BufferedImageInfo:setHeight(height)
        self.height = height
end


function BufferedImageInfo:getType()
        return self.type
end


function BufferedImageInfo:setType(type)
        self.type = type
end


function BufferedImageInfo:toString()
        local commonLabels = CommonLabels.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("BufferedImageInfo -")
        stringBuffer:append(commonLabels.WIDTH_LABEL)
        stringBuffer:appendint(self:getWidth())
        stringBuffer:append(commonLabels.HEIGHT_LABEL)
        stringBuffer:appendint(self:getHeight())
        stringBuffer:append(" Type: ")
        stringBuffer:appendint(self:getType())
        return tostring(stringBuffer)
end
BufferedImageInfo.__tostring = function(self) return self:toString() end

return BufferedImageInfo

