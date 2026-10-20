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
-- package org.allbinary.logic.communication.ftp.configuration

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

local FtpConfigurationMapping = {}
FtpConfigurationMapping.__index = FtpConfigurationMapping
FtpConfigurationMapping.className = "FtpConfigurationMapping"

function FtpConfigurationMapping:_init_fields()
    self.ftpConfigurationInterface = nil
end


function FtpConfigurationMapping.new(ftpConfigurationInterface)
    local self = setmetatable({}, FtpConfigurationMapping)
    self:_init_fields()
        self.ftpConfigurationInterface = ftpConfigurationInterface
    return self
end


function FtpConfigurationMapping:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(FtpConfigurationData.SERVER, self.ftpConfigurationInterface:getServer())
        hashMap:put(FtpConfigurationData.USERNAME, self.ftpConfigurationInterface:getUserName())
        hashMap:put(FtpConfigurationData.PASSWORD, self.ftpConfigurationInterface:getPassword())
        hashMap:put(FtpConfigurationData.PATH, self.ftpConfigurationInterface:getPath())
        return hashMap
end


-- throws Exception
function FtpConfigurationMapping:getKey()
        return FtpConfigurationData.NAME
end


-- throws Exception
function FtpConfigurationMapping:toVector()
        local vector = BasicArrayListD.new()
        vector:add(self.ftpConfigurationInterface:getServer())
        vector:add(self.ftpConfigurationInterface:getUserName())
        vector:add(self.ftpConfigurationInterface:getPassword())
        vector:add(self.ftpConfigurationInterface:getPath())
        return vector
end

return FtpConfigurationMapping

