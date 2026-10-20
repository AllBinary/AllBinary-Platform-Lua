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
-- package org.allbinary.business.user.modules.customer.wholesale

-- local HashMap = require("java.util.HashMap")
local UserFactoryInterface = require("org.allbinary.business.user.UserFactoryInterface")
local UserInterface = require("org.allbinary.business.user.UserInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WholesaleUserFactory = {}
WholesaleUserFactory.__index = WholesaleUserFactory
WholesaleUserFactory.className = "WholesaleUserFactory"


function WholesaleUserFactory.new()
    local self = setmetatable({}, WholesaleUserFactory)
    return self
end


-- throws Exception
function WholesaleUserFactory:getInstance()
        return WholesaleUser.new()
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function WholesaleUserFactory:getInstance(hashMap)
        return WholesaleUser.new(hashMap)
end

return WholesaleUserFactory

