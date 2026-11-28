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
-- package org.allbinary.input.media.image

local InputImageType = {}
package.loaded["org.allbinary.input.media.image.InputImageType"] = InputImageType

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

local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")

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

-- class table InputImageType is declared before the requires
InputImageType.__index = InputImageType
InputImageType.className = "InputImageType"
InputImageType.javaClassName = "org.allbinary.input.media.image.InputImageType"

function InputImageType:_init_fields()
    if self.name_f == nil then self.name_f = nil end
    if self.index == nil then self.index = 0 end
end


function InputImageType._jinit(self, name, index)
    InputImageType._init_fields(self)
        self.name_f = name
        self.index = index
        InputImageType.TYPE_VECTOR:add(self)
        InputImageType.hashMap:put(self:getName(), self)
    return self
end

function InputImageType.new(...)
    local self = setmetatable({}, InputImageType)
    InputImageType._jinit(self, ...)
    return self
end


function InputImageType:toString()
        return require("allbinary_java").to_string("ImageType: ") .. require("allbinary_java").to_string(self:getName())
end
InputImageType.__tostring = function(self) return self:toString() end


function InputImageType:getName()
        return self.name_f
end


function InputImageType.getInstance(imageTypeString)
        return InputImageType.hashMap:get(imageTypeString)
end


function InputImageType.getAllAsVector()
        return InputImageType.TYPE_VECTOR
end


function InputImageType:getIndex()
        return self.index
end

InputImageType.hashMap = StdUtil.getInstance():createHashMap()
InputImageType.TYPE_VECTOR = BasicArrayListD.new()
InputImageType.CAPTURE = InputImageType.new("Capture", 0)
InputImageType.COMPARISON = InputImageType.new("Comparison", 1)
InputImageType.MOTION = InputImageType.new("Motion", 2)

return InputImageType

