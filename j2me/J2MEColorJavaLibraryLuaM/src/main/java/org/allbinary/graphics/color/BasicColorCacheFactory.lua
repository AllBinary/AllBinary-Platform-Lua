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

local BasicColorCacheFactory = {}
package.loaded["org.allbinary.graphics.color.BasicColorCacheFactory"] = BasicColorCacheFactory

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

local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")

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

-- class table BasicColorCacheFactory is declared before the requires
BasicColorCacheFactory.__index = BasicColorCacheFactory
BasicColorCacheFactory.className = "BasicColorCacheFactory"
BasicColorCacheFactory.javaClassName = "org.allbinary.graphics.color.BasicColorCacheFactory"

function BasicColorCacheFactory:_init_fields()
    self.hashtable = StdUtil.getInstance():createHashtable()
end


function BasicColorCacheFactory.getInstance()
        return BasicColorCacheFactory.instance_f
end


function BasicColorCacheFactory._jinit(self)
    BasicColorCacheFactory._init_fields(self)
    return self
end

function BasicColorCacheFactory.new(...)
    local self = setmetatable({}, BasicColorCacheFactory)
    BasicColorCacheFactory._jinit(self, ...)
    return self
end


function BasicColorCacheFactory:add(basicDefaultColor)
        self.hashtable:put(require("allbinary_java").number_value(basicDefaultColor, "intValue"), basicDefaultColor)
end


function BasicColorCacheFactory:getAndOrCreate(integer)
        local basicColor = self.hashtable:get(integer)
        if rawequal(basicColor, nil) then
            basicColor = BasicColorFactory.getInstance():createInstance(require("allbinary_java").number_value(integer, "intValue"))
            self.hashtable:put(integer, basicColor)
        end
        return basicColor
end

BasicColorCacheFactory.instance_f = BasicColorCacheFactory.new()

return BasicColorCacheFactory

