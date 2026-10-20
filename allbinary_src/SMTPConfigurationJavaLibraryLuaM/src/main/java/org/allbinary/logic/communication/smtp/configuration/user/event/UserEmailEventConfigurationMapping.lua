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

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local TableMappingInterface = require("org.allbinary.data.tables.TableMappingInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UserEmailEventConfigurationMapping = {}
UserEmailEventConfigurationMapping.__index = UserEmailEventConfigurationMapping
UserEmailEventConfigurationMapping.className = "UserEmailEventConfigurationMapping"

function UserEmailEventConfigurationMapping:_init_fields()
    self.userEmailEventConfigurationInterface = nil
end


function UserEmailEventConfigurationMapping.new(userEmailEventConfigurationInterface)
    local self = setmetatable({}, UserEmailEventConfigurationMapping)
    self:_init_fields()
        self.userEmailEventConfigurationInterface = userEmailEventConfigurationInterface
    return self
end


function UserEmailEventConfigurationMapping:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(UserEmailEventConfigurationData.NAME, self.userEmailEventConfigurationInterface:getName())
        hashMap:put(UserEmailEventConfigurationData.LISTENER_CLASSPATH, self.userEmailEventConfigurationInterface:getEventListenerClassPath())
        return hashMap
end


-- throws Exception
function UserEmailEventConfigurationMapping:getKey()
        return UserEmailEventConfigurationData.NAME
end


-- throws Exception
function UserEmailEventConfigurationMapping:toVector()
        local vector = BasicArrayListD.new()
        vector:add(self.userEmailEventConfigurationInterface:getName())
        vector:add(self.userEmailEventConfigurationInterface:getEventListenerClassPath())
        return vector
end

return UserEmailEventConfigurationMapping

