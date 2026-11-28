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

local ImageUnifierProperties = {}
package.loaded["org.allbinary.media.image.ImageUnifierProperties"] = ImageUnifierProperties

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

local ImageUnifierCell = java_lazy("org.allbinary.media.image.ImageUnifierCell")

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

-- class table ImageUnifierProperties is declared before the requires
ImageUnifierProperties.__index = ImageUnifierProperties
ImageUnifierProperties.className = "ImageUnifierProperties"
ImageUnifierProperties.javaClassName = "org.allbinary.media.image.ImageUnifierProperties"

function ImageUnifierProperties:_init_fields()
    if self.rows == nil then self.rows = nil end
    if self.columns == nil then self.columns = nil end
    if self.imageUnifierCell == nil then self.imageUnifierCell = nil end
end


function ImageUnifierProperties._jinit(self)
    ImageUnifierProperties._init_fields(self)
    return self
end

function ImageUnifierProperties.new(...)
    local self = setmetatable({}, ImageUnifierProperties)
    ImageUnifierProperties._jinit(self, ...)
    return self
end


function ImageUnifierProperties:getWidth()
        return require("allbinary_java").number_value(self:getColumns(), "intValue") * require("allbinary_java").number_value(self:getImageUnifierCell():getWidth(), "intValue")
end


function ImageUnifierProperties:getHeight()
        return require("allbinary_java").number_value(self:getRows(), "intValue") * require("allbinary_java").number_value(self:getImageUnifierCell():getHeight(), "intValue")
end


function ImageUnifierProperties:getRows()
        return self.rows
end


function ImageUnifierProperties:setRows(rows)
        self.rows = rows
end


function ImageUnifierProperties:getColumns()
        return self.columns
end


function ImageUnifierProperties:setColumns(columns)
        self.columns = columns
end


function ImageUnifierProperties:getImageUnifierCell()
        return self.imageUnifierCell
end


function ImageUnifierProperties:setImageUnifierCell(imageUnifierCell)
        self.imageUnifierCell = imageUnifierCell
end

return ImageUnifierProperties

