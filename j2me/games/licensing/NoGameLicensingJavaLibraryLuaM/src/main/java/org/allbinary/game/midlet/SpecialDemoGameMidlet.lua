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
-- package org.allbinary.game.midlet

local ClientInformationFactory = require("org.allbinary.logic.system.security.licensing.ClientInformationFactory")
local LicenseServerInitFileUtil = require("org.allbinary.logic.system.security.licensing.LicenseServerInitFileUtil")
local DemoGameMidlet = require("org.allbinary.game.midlet.DemoGameMidlet")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SpecialDemoGameMidlet = {}
SpecialDemoGameMidlet.__index = SpecialDemoGameMidlet
SpecialDemoGameMidlet.className = "SpecialDemoGameMidlet"
setmetatable(SpecialDemoGameMidlet, {__index = DemoGameMidlet})


function SpecialDemoGameMidlet.new(clientInformationFactory, licenseLoadingType, demoSetupFactory, licenseCheckRunnableFactory)
    local self = setmetatable(DemoGameMidlet.new(clientInformationFactory), SpecialDemoGameMidlet)
        -- super(...) made self above
    return self
end


function SpecialDemoGameMidlet:initView()
end


function SpecialDemoGameMidlet:preInit()
        LicenseServerInitFileUtil.new():init()
end

return SpecialDemoGameMidlet

