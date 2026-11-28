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
-- package org.allbinary.graphics

local RelativeRelationship = {}
package.loaded["org.allbinary.graphics.RelativeRelationship"] = RelativeRelationship

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")

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

-- class table RelativeRelationship is declared before the requires
RelativeRelationship.__index = RelativeRelationship
RelativeRelationship.className = "RelativeRelationship"
RelativeRelationship.javaClassName = "org.allbinary.graphics.RelativeRelationship"

function RelativeRelationship:_init_fields()
    if self.typesAllowedList == nil then self.typesAllowedList = nil end
    if self.x == nil then self.x = 0 end
    if self.y == nil then self.y = 0 end
    if self.z == nil then self.z = 0 end
end


function RelativeRelationship._jinit(self, point, typesAllowedList)
    RelativeRelationship._init_fields(self)
        self.x = point:getX()
        self.y = point:getY()
        self.z = point:getZ()
        self.typesAllowedList = typesAllowedList
    return self
end

function RelativeRelationship.new(...)
    local self = setmetatable({}, RelativeRelationship)
    RelativeRelationship._jinit(self, ...)
    return self
end


function RelativeRelationship:getX()
        return self.x
end


function RelativeRelationship:getY()
        return self.y
end


function RelativeRelationship:getZ()
        return self.z
end


function RelativeRelationship:getTypesAllowedList()
        return self.typesAllowedList
end


function RelativeRelationship:setTypesAllowedList(typesAllowedList)
        self.typesAllowedList = typesAllowedList
end

RelativeRelationship.NULL_RELATIVE_RELATIONSHIP = RelativeRelationship.new(PointFactory.getInstance().ZERO_ZERO, BasicArrayListUtil.getInstance():getImmutableInstance())

return RelativeRelationship

