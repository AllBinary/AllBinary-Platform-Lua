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
-- package org.allbinary.business.installer

local DatabaseConnectionInfoInterface = require("org.allbinary.business.init.db.DatabaseConnectionInfoInterface")
local InitDbHelperFactory = require("org.allbinary.business.init.db.InitDbHelperFactory")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local InitDb = require("org.allbinary.business.installer.InitDb")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--Warning you must have sql root access
local DynamicInitDb = {}
DynamicInitDb.__index = DynamicInitDb
DynamicInitDb.className = "DynamicInitDb"
setmetatable(DynamicInitDb, {__index = InitDb})

function DynamicInitDb.new(...)
    local count = select("#", ...)
    if count == 1 then return DynamicInitDb._new1(...)
    elseif count == 2 then return DynamicInitDb._new2(...)
    end
end


function DynamicInitDb._new1(abeClientInformation)
    local self = setmetatable(InitDb.new(), DynamicInitDb)
        self:setHelper(InitDbHelperFactory.getInstance(abeClientInformation))
    return self
end


function DynamicInitDb._new2(abeClientInformation, databaseConnectionInfoInterface)
    local self = setmetatable(InitDb.new(), DynamicInitDb)
        self:setHelper(InitDbHelperFactory.getInstance(abeClientInformation, databaseConnectionInfoInterface))
    return self
end

return DynamicInitDb

