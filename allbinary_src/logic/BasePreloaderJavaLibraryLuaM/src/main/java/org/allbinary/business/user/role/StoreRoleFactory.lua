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
-- package org.allbinary.business.user.role

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

local StoreRoleFactory = {}
StoreRoleFactory.__index = StoreRoleFactory
StoreRoleFactory.className = "StoreRoleFactory"

function StoreRoleFactory:_init_fields()
    self.roles = BasicArrayListD.new()
    self.subscriberRoles = BasicArrayListD.new()
    self.wholesaleRoles = BasicArrayListD.new()
end


function StoreRoleFactory.getInstance()
        return StoreRoleFactory.instance
end


function StoreRoleFactory.new()
    local self = setmetatable({}, StoreRoleFactory)
    self:_init_fields()
        local basicUserRoleFactory = BasicUserRoleFactory.getInstance()
        self.roles:add(basicUserRoleFactory.CUSTOMER)
        self.roles:add(basicUserRoleFactory.SUBSCRIBERCUSTOMER)
        self.roles:add(basicUserRoleFactory.WHOLESALECUSTOMER)
        self.subscriberRoles:add(basicUserRoleFactory.SUBSCRIBERCUSTOMER)
        self.wholesaleRoles:add(basicUserRoleFactory.WHOLESALECUSTOMER)
    return self
end


function StoreRoleFactory:getRoles()
        return self.roles
end


function StoreRoleFactory:getSubscriberRoles()
        return self.subscriberRoles
end


function StoreRoleFactory:getWholesaleRoles()
        return self.wholesaleRoles
end

StoreRoleFactory.instance = StoreRoleFactory.new()

return StoreRoleFactory

