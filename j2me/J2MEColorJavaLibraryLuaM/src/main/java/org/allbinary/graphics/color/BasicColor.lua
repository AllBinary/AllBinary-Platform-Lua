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
-- package org.allbinary.graphics.color

local BasicColor = {}
package.loaded["org.allbinary.graphics.color.BasicColor"] = BasicColor

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

local JsType = java_lazy("jsinterop.annotations.JsType")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local JsMethod = java_lazy("jsinterop.annotations.JsMethod")
local JsConstructor = java_lazy("jsinterop.annotations.JsConstructor")
local JsProperty = java_lazy("jsinterop.annotations.JsProperty")
local BasicColorUtil = java_lazy("org.allbinary.graphics.color.BasicColorUtil")

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

-- class table BasicColor is declared before the requires
BasicColor.__index = BasicColor
BasicColor.className = "BasicColor"
BasicColor.javaClassName = "org.allbinary.graphics.color.BasicColor"

function BasicColor:_init_fields()
    if self.name_f == nil then self.name_f = nil end
    if self.value == nil then self.value = 0 end
    if self.redComponent == nil then self.redComponent = 0.0 end
    if self.greenComponent == nil then self.greenComponent = 0.0 end
    if self.blueComponent == nil then self.blueComponent = 0.0 end
    if self.alphaComponent == nil then self.alphaComponent = 0.0 end
    if self.red == nil then self.red = 0 end
    if self.green == nil then self.green = 0 end
    if self.blue == nil then self.blue = 0 end
    if self.alpha == nil then self.alpha = 0 end
end


function BasicColor._jinit(self, alphaValue, value, name)
    BasicColor._init_fields(self)
        self.name_f = name
        local tempValue = 0
        local basicColorUtil = BasicColorUtil.getInstance()
        if basicColorUtil.isAlpha then
            if basicColorUtil.ffOpaque then
                tempValue = alphaValue | value
            else
                tempValue = 0x00000000 | value
            end
        else
            tempValue = value
        end
        local alphaInt = ((((tempValue) // (1 << (24)))) & 255)
        self.alpha = alphaInt
        self.alphaComponent = ((alphaInt + 0.0)) / 255.0
        local redInt = ((((tempValue) // (1 << (16)))) & 255)
        self.red = redInt
        self.redComponent = ((redInt + 0.0)) / 255.0
        local greenInt = ((((tempValue) // (1 << (8)))) & 255)
        self.green = greenInt
        self.greenComponent = ((greenInt + 0.0)) / 255.0
        local blueInt = ((tempValue) & 255)
        self.blue = blueInt
        self.blueComponent = ((blueInt + 0.0)) / 255.0
        self.value = tempValue
    return self
end

function BasicColor.new(...)
    local self = setmetatable({}, BasicColor)
    BasicColor._jinit(self, ...)
    return self
end


function BasicColor:intValue()
        return self.value
end


function BasicColor:toInt()
        return self.value
end


function BasicColor:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("BasicColor: ")
        stringBuffer:append("Alpha: ")
        stringBuffer:appendshort(self.alpha)
        stringBuffer:append(" Red: ")
        stringBuffer:appendshort(self.red)
        stringBuffer:append(" Green: ")
        stringBuffer:appendshort(self.green)
        stringBuffer:append(" Blue: ")
        stringBuffer:appendshort(self.blue)
        stringBuffer:append(" Value: ")
        stringBuffer:appendint(self.value)
        return tostring(stringBuffer)
end
BasicColor.__tostring = function(self) return self:toString() end


function BasicColor:getName()
        return self.name_f
end


function BasicColor:getRedComponent()
        return self.redComponent
end


function BasicColor:getGreenComponent()
        return self.greenComponent
end


function BasicColor:getBlueComponent()
        return self.blueComponent
end


function BasicColor:getAlphaComponent()
        return self.alphaComponent
end

return BasicColor

