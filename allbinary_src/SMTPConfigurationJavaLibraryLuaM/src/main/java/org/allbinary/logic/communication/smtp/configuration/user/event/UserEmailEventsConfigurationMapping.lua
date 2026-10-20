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

local UserEmailEventsConfigurationMapping = {}
UserEmailEventsConfigurationMapping.__index = UserEmailEventsConfigurationMapping
UserEmailEventsConfigurationMapping.className = "UserEmailEventsConfigurationMapping"

function UserEmailEventsConfigurationMapping:_init_fields()
    self.userEmailEventsConfigurationInterface = nil
end


function UserEmailEventsConfigurationMapping.new(userEmailEventsConfigurationInterface)
    local self = setmetatable({}, UserEmailEventsConfigurationMapping)
    self:_init_fields()
        self.userEmailEventsConfigurationInterface = userEmailEventsConfigurationInterface
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

