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

local BasicColorArrayIndexer = {}
package.loaded["org.allbinary.graphics.color.BasicColorArrayIndexer"] = BasicColorArrayIndexer

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
local CircularIndexUtil = java_lazy("org.allbinary.util.CircularIndexUtil")
local JsMethod = java_lazy("jsinterop.annotations.JsMethod")
local JsConstructor = java_lazy("jsinterop.annotations.JsConstructor")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")

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

-- class table BasicColorArrayIndexer is declared before the requires
BasicColorArrayIndexer.__index = BasicColorArrayIndexer
BasicColorArrayIndexer.className = "BasicColorArrayIndexer"
BasicColorArrayIndexer.javaClassName = "org.allbinary.graphics.color.BasicColorArrayIndexer"

function BasicColorArrayIndexer:_init_fields()
    if self.basicColorArray == nil then self.basicColorArray = nil end
    if self.circularIndexUtil == nil then self.circularIndexUtil = nil end
end


function BasicColorArrayIndexer._jinit(self, basicColorArray)
    BasicColorArrayIndexer._init_fields(self)
        self.basicColorArray = basicColorArray
        self.circularIndexUtil = CircularIndexUtil.createInstance((self.basicColorArray.n or #self.basicColorArray))
    return self
end

function BasicColorArrayIndexer.new(...)
    local self = setmetatable({}, BasicColorArrayIndexer)
    BasicColorArrayIndexer._jinit(self, ...)
    return self
end


function BasicColorArrayIndexer:next()
        self.circularIndexUtil:next()
end


function BasicColorArrayIndexer:get()
        return self.basicColorArray[self.circularIndexUtil:getIndex() + 1]
end


function BasicColorArrayIndexer:getBasicColorArray()
        return self.basicColorArray
end

return BasicColorArrayIndexer

