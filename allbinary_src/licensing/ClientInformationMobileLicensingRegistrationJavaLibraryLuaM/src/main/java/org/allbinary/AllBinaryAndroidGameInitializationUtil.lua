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
-- package org.allbinary

local LicenseInitInfoUtil = require("org.allbinary.business.init.LicenseInitInfoUtil")
local ResourceUtil = require("org.allbinary.data.resource.ResourceUtil")
local PartnerIdentifierFileUtil = require("org.allbinary.logic.system.security.licensing.PartnerIdentifierFileUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinaryAndroidGameInitializationUtil = {}
AllBinaryAndroidGameInitializationUtil.__index = AllBinaryAndroidGameInitializationUtil
AllBinaryAndroidGameInitializationUtil.className = "AllBinaryAndroidGameInitializationUtil"

function AllBinaryAndroidGameInitializationUtil.new()
    local self = setmetatable({}, AllBinaryAndroidGameInitializationUtil)
    return self
end


function AllBinaryAndroidGameInitializationUtil.init()
        local resourceUtil = ResourceUtil.getInstance()
        local androidResources = AndroidResources.getInstance()
        local licenseInitInfoUtil = LicenseInitInfoUtil.getInstance()
        resourceUtil:addResource(licenseInitInfoUtil.INITFILENAME, tostring(androidResources.raw.licenseinitdata))
        resourceUtil:addResource(PartnerIdentifierFileUtil.getInstance().FILE_NAME, tostring(androidResources.raw.partner))
end

return AllBinaryAndroidGameInitializationUtil

