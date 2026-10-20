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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LicenseInitInfoUtil = {}
LicenseInitInfoUtil.__index = LicenseInitInfoUtil
LicenseInitInfoUtil.className = "LicenseInitInfoUtil"

function LicenseInitInfoUtil:_init_fields()
    self.INITFILENAME = "licenseinitdata.dat"
    self.ABOUT = "about"
    self.PRIVACY_POLICY = "privacy_policy"
    self.OFFICIAL_ALLBINARY_SERVICES_SERVER = "https://services.allbinary.com/LicServ/serverssl.php"
end


function LicenseInitInfoUtil.getInstance()
        return LicenseInitInfoUtil.instance
end


function LicenseInitInfoUtil:setFilePath(filePath)
end


function LicenseInitInfoUtil.new()
    local self = setmetatable({}, LicenseInitInfoUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function LicenseInitInfoUtil:write(initData)
end


-- throws Exception
function LicenseInitInfoUtil:read()
        return self:readAgain(0)
end


-- throws Exception
function LicenseInitInfoUtil:readAgain(initializeCounter)
        local licenseInitInfo = LicenseInitInfo.new()
        licenseInitInfo:clearServers()
        licenseInitInfo:addServer(self.OFFICIAL_ALLBINARY_SERVICES_SERVER)
        return licenseInitInfo
end

LicenseInitInfoUtil.instance = LicenseInitInfoUtil.new()

return LicenseInitInfoUtil

