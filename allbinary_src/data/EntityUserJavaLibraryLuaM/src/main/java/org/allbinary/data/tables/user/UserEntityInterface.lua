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
-- package org.allbinary.data.tables.user

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local UserInterface = require("org.allbinary.business.user.UserInterface")
local UserRole = require("org.allbinary.business.user.role.UserRole")
local BasicDataTableInterface = require("org.allbinary.data.tables.BasicDataTableInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local UserEntityInterface = {}
UserEntityInterface.__index = UserEntityInterface
UserEntityInterface.className = "UserEntityInterface"
setmetatable(UserEntityInterface, {__index = BasicDataTableInterface})


-- throws Exception
function UserEntityInterface:getAdministrators()
    error("abstract method getAdministrators")
end


-- throws Exception
function UserEntityInterface:getStoreManagers(storeFrontInterface)
    error("abstract method getStoreManagers")
end


-- throws Exception
function UserEntityInterface:getCustomers()
    error("abstract method getCustomers")
end


-- throws Exception
function UserEntityInterface:getUsersWithRole(userRole)
    error("abstract method getUsersWithRole")
end


-- throws Exception
function UserEntityInterface:getUsers(storeFrontInterface)
    error("abstract method getUsers")
end


-- throws Exception
function UserEntityInterface:getUser(userName)
    error("abstract method getUser")
end


function UserEntityInterface:login(userName, password)
    error("abstract method login")
end


function UserEntityInterface:deleteWhere(key, value)
    error("abstract method deleteWhere")
end


function UserEntityInterface:insert(values)
    error("abstract method insert")
end


function UserEntityInterface:update(userName, updatedValues)
    error("abstract method update")
end

return UserEntityInterface

