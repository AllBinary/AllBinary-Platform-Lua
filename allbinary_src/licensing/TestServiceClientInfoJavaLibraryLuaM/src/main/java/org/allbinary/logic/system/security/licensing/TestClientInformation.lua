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
-- package org.allbinary.logic.system.security.licensing

local AbeClientInformation = require("org.allbinary.logic.system.security.licensing.AbeClientInformation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TestClientInformation = {}
TestClientInformation.__index = TestClientInformation
TestClientInformation.className = "TestClientInformation"
setmetatable(TestClientInformation, {__index = AbeClientInformation})


function TestClientInformation.new()
    local self = setmetatable(AbeClientInformation.new("Test App Name", "0.0.1", "Test App Name 0.0.1", "TA"), TestClientInformation)
        -- super(...) made self above
    return self
end

return TestClientInformation

