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
-- package org.allbinary.logic.communication.smtp.configuration.server

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

local EmailServerConfigurationMapping = {}
EmailServerConfigurationMapping.__index = EmailServerConfigurationMapping
EmailServerConfigurationMapping.className = "EmailServerConfigurationMapping"

function EmailServerConfigurationMapping:_init_fields()
    self.emailServerConfigurationInterface = nil
end


function EmailServerConfigurationMapping.new(emailServerConfigurationInterface)
    local self = setmetatable({}, EmailServerConfigurationMapping)
    self:_init_fields()
        self.emailServerConfigurationInterface = emailServerConfigurationInterface
    return self
end


function EmailServerConfigurationMapping:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(EmailServerConfigurationData.SERVER, self.emailServerConfigurationInterface:getSmtpServer())
        hashMap:put(EmailServerConfigurationData.ACCOUNT, self.emailServerConfigurationInterface:getAccountName())
        hashMap:put(EmailServerConfigurationData.PASSWORD, self.emailServerConfigurationInterface:getPassword())
        return hashMap
end


-- throws Exception
function EmailServerConfigurationMapping:getKey()
        return EmailServerConfigurationData.NAME
end


-- throws Exception
function EmailServerConfigurationMapping:toVector()
        local vector = BasicArrayListD.new()
        vector:add(self.emailServerConfigurationInterface:getSmtpServer())
        return vector
end

return EmailServerConfigurationMapping

