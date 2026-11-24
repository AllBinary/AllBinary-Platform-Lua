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
-- package org.allbinary.logic.util.cache

local BaseCircularPool = {}
package.loaded["org.allbinary.logic.util.cache.BaseCircularPool"] = BaseCircularPool

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
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local CircularIndexUtil = java_lazy("org.allbinary.util.CircularIndexUtil")
local JsMethod = java_lazy("jsinterop.annotations.JsMethod")
local JsProperty = java_lazy("jsinterop.annotations.JsProperty")
local AllBinaryObjectFactoryInterface = java_lazy("org.allbinary.logic.util.cache.AllBinaryObjectFactoryInterface")

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

-- class table BaseCircularPool is declared before the requires
BaseCircularPool.__index = BaseCircularPool
BaseCircularPool.className = "BaseCircularPool"
BaseCircularPool.javaClassName = "org.allbinary.logic.util.cache.BaseCircularPool"

function BaseCircularPool:_init_fields()
    self.circularIndexUtil = CircularIndexUtil.NULL_CIRCULAR_INDEX_UTIL
    self.OBJECT_ARRAY = NullUtil.getInstance().NULL_OBJECT_ARRAY
end

function BaseCircularPool._jinit(self)
    BaseCircularPool._init_fields(self)
    return self
end

function BaseCircularPool.new()
    return BaseCircularPool._jinit(setmetatable({}, BaseCircularPool))
end


-- throws Exception
function BaseCircularPool:getNextInstance()
        local anyType = self.OBJECT_ARRAY[self.circularIndexUtil:getIndex() + 1]
        self.circularIndexUtil:next()
        return anyType
end


function BaseCircularPool:init(allBinaryObjectFactoryInterface)
        self.circularIndexUtil:setIndex(0)
        local size = self.circularIndexUtil:getSize()
        for index = 0, size - 1 do
            self.OBJECT_ARRAY[index + 1] = allBinaryObjectFactoryInterface:getInstance()
        end
end


-- throws Exception
function BaseCircularPool:getInstance(index)
        return self.OBJECT_ARRAY[index + 1]
end

return BaseCircularPool

