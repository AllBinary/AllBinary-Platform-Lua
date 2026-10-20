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
-- package org.allbinary.business.init

local DebugFactory = require("org.allbinary.debug.DebugFactory")
local NoDebug = require("org.allbinary.debug.NoDebug")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LicenseInitInfo = {}
LicenseInitInfo.__index = LicenseInitInfo
LicenseInitInfo.className = "LicenseInitInfo"

function LicenseInitInfo:_init_fields()
    self.id = StringUtil.getInstance().EMPTY_STRING
    self.serverList = BasicArrayListD.new()
end


function LicenseInitInfo.new()
    local self = setmetatable({}, LicenseInitInfo)
    self:_init_fields()
    return self
end


function LicenseInitInfo:getLicenseId()
        return self.id
end


function LicenseInitInfo:getServer(index)
        return self.serverList:get(index)
end


function LicenseInitInfo:getNumberOfServers()
        return self.serverList:size()
end


function LicenseInitInfo:setLicenseId(value)
        self.id = value
end


function LicenseInitInfo:clearServers()
        self.serverList:clear()
end


function LicenseInitInfo:setServer(value, index)
        self.serverList:addAt(index, value)
end


function LicenseInitInfo:addServer(value)
        self.serverList:add(value)
end


function LicenseInitInfo:getServerList()
        return self.serverList
end


function LicenseInitInfo:setServerList(servers)
        if DebugFactory.getInstance() == NoDebug.getInstance() then
            self.serverList = servers
        end
end

return LicenseInitInfo

