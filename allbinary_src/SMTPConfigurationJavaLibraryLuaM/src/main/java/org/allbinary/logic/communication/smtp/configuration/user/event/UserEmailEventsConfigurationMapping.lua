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
-- package org.allbinary.logic.communication.smtp.configuration.user.event

local UserEmailEventsConfigurationMapping = {}
package.loaded["org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationMapping"] = UserEmailEventsConfigurationMapping

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
local TableMappingInterface = java_lazy("org.allbinary.data.tables.TableMappingInterface")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local UserEmailEventsConfigurationInterface = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationInterface")

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

-- class table UserEmailEventsConfigurationMapping is declared before the requires
UserEmailEventsConfigurationMapping.__index = UserEmailEventsConfigurationMapping
UserEmailEventsConfigurationMapping.className = "UserEmailEventsConfigurationMapping"
UserEmailEventsConfigurationMapping.javaClassName = "org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationMapping"
UserEmailEventsConfigurationMapping.java_implements = " TableMappingInterface "
UserEmailEventsConfigurationMapping.java_interfaces = function() return {TableMappingInterface} end

function UserEmailEventsConfigurationMapping:_init_fields()
    if self.userEmailEventsConfigurationInterface == nil then self.userEmailEventsConfigurationInterface = nil end
end


function UserEmailEventsConfigurationMapping._jinit(self, userEmailEventsConfigurationInterface)
    UserEmailEventsConfigurationMapping._init_fields(self)
        self.userEmailEventsConfigurationInterface = userEmailEventsConfigurationInterface
    return self
end

function UserEmailEventsConfigurationMapping.new(...)
    local self = setmetatable({}, UserEmailEventsConfigurationMapping)
    UserEmailEventsConfigurationMapping._jinit(self, ...)
    return self
end


function UserEmailEventsConfigurationMapping:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        return hashMap
end


-- throws Exception
function UserEmailEventsConfigurationMapping:getKey()
        return UserEmailEventsConfigurationData.NAME
end


-- throws Exception
function UserEmailEventsConfigurationMapping:toVector()
        local vector = BasicArrayListD.new()
        return vector
end

return UserEmailEventsConfigurationMapping

