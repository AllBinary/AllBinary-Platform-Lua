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
-- package org.allbinary.business.user.modules.admin.store.order

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

local OrderStoreAdminUserFactory = {}
OrderStoreAdminUserFactory.__index = OrderStoreAdminUserFactory
OrderStoreAdminUserFactory.className = "OrderStoreAdminUserFactory"


function OrderStoreAdminUserFactory.new()
    local self = setmetatable({}, OrderStoreAdminUserFactory)
    return self
end


-- throws Exception
function OrderStoreAdminUserFactory:getInstance()
        return OrderStoreAdminUser.new()
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function OrderStoreAdminUserFactory:getInstance(hashMap)
        return OrderStoreAdminUser.new(hashMap)
end

return OrderStoreAdminUserFactory

