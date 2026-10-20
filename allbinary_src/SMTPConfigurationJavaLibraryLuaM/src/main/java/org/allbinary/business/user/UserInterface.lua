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
-- package org.allbinary.business.user

-- local HashMap = require("java.util.HashMap")
local UserConfigurationInterface = require("org.allbinary.business.user.modules.configuration.UserConfigurationInterface")
local UserRole = require("org.allbinary.business.user.role.UserRole")
local TableMappingInterface = require("org.allbinary.data.tables.TableMappingInterface")
local WeblisketSessionInterface = require("org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface")
local ValidationInterface = require("org.allbinary.logic.control.validate.ValidationInterface")

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
local UserInterface = {}
UserInterface.__index = UserInterface
UserInterface.className = "UserInterface"
setmetatable(UserInterface, {__index = TableMappingInterface})


function UserInterface:setUserName(value)
    error("abstract method setUserName")
end


function UserInterface:setPrefixName(value)
    error("abstract method setPrefixName")
end


function UserInterface:setFirstName(value)
    error("abstract method setFirstName")
end


function UserInterface:setLastName(value)
    error("abstract method setLastName")
end


function UserInterface:setMiddleName(value)
    error("abstract method setMiddleName")
end


function UserInterface:setSuffixName(value)
    error("abstract method setSuffixName")
end


function UserInterface:setCompany(value)
    error("abstract method setCompany")
end


function UserInterface:setPositionAtCompany(value)
    error("abstract method setPositionAtCompany")
end


function UserInterface:setMainEmail(value)
    error("abstract method setMainEmail")
end


function UserInterface:setSecondaryEmail(value)
    error("abstract method setSecondaryEmail")
end


function UserInterface:setHomePhone(value)
    error("abstract method setHomePhone")
end


function UserInterface:setCellPhone(value)
    error("abstract method setCellPhone")
end


function UserInterface:setWorkPhone(value)
    error("abstract method setWorkPhone")
end


function UserInterface:setOtherContact(value)
    error("abstract method setOtherContact")
end


function UserInterface:setElectronicContact(value)
    error("abstract method setElectronicContact")
end


function UserInterface:setFax(value)
    error("abstract method setFax")
end


function UserInterface:setRole(aRole)
    error("abstract method setRole")
end


function UserInterface:setEncryption(value)
    error("abstract method setEncryption")
end


function UserInterface:setSecret(value)
    error("abstract method setSecret")
end


function UserInterface:setPassword(value)
    error("abstract method setPassword")
end


function UserInterface:setPermissions(value)
    error("abstract method setPermissions")
end


function UserInterface:enable()
    error("abstract method enable")
end


function UserInterface:setEnable(enable)
    error("abstract method setEnable")
end


function UserInterface:getUserName()
    error("abstract method getUserName")
end


function UserInterface:getPrefixName()
    error("abstract method getPrefixName")
end


function UserInterface:getFirstName()
    error("abstract method getFirstName")
end


function UserInterface:getLastName()
    error("abstract method getLastName")
end


function UserInterface:getMiddleName()
    error("abstract method getMiddleName")
end


function UserInterface:getSuffixName()
    error("abstract method getSuffixName")
end


function UserInterface:getCompany()
    error("abstract method getCompany")
end


function UserInterface:getPositionAtCompany()
    error("abstract method getPositionAtCompany")
end


function UserInterface:getMainEmail()
    error("abstract method getMainEmail")
end


function UserInterface:getSecondaryEmail()
    error("abstract method getSecondaryEmail")
end


function UserInterface:getHomePhone()
    error("abstract method getHomePhone")
end


function UserInterface:getCellPhone()
    error("abstract method getCellPhone")
end


function UserInterface:getWorkPhone()
    error("abstract method getWorkPhone")
end


function UserInterface:getOtherContact()
    error("abstract method getOtherContact")
end


function UserInterface:getElectronicContact()
    error("abstract method getElectronicContact")
end


function UserInterface:getFax()
    error("abstract method getFax")
end


function UserInterface:getRole()
    error("abstract method getRole")
end


function UserInterface:getEncryption()
    error("abstract method getEncryption")
end


function UserInterface:getSecret()
    error("abstract method getSecret")
end


function UserInterface:getPassword()
    error("abstract method getPassword")
end


function UserInterface:getPermissions()
    error("abstract method getPermissions")
end


function UserInterface:getUserConfigurationInterface()
    error("abstract method getUserConfigurationInterface")
end


function UserInterface:setUserConfigurationInterface(userConfigurationInterface)
    error("abstract method setUserConfigurationInterface")
end


function UserInterface:toPasswordHashMap()
    error("abstract method toPasswordHashMap")
end


function UserInterface:validateSession(weblisketSession)
    error("abstract method validateSession")
end


function UserInterface:updateSession(weblisketSession)
    error("abstract method updateSession")
end


function UserInterface:isSessionValid()
    error("abstract method isSessionValid")
end

return UserInterface

