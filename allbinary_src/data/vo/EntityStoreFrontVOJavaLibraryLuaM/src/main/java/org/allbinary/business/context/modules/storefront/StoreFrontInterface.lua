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
-- package org.allbinary.business.context.modules.storefront

local ContextConfigurationInterface = require("org.allbinary.business.context.configuration.ContextConfigurationInterface")
local TableMappingInterface = require("org.allbinary.data.tables.TableMappingInterface")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

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
local StoreFrontInterface = {}
StoreFrontInterface.__index = StoreFrontInterface
StoreFrontInterface.className = "StoreFrontInterface"
setmetatable(StoreFrontInterface, {__index = TableMappingInterface})


function StoreFrontInterface:isNameValid()
    error("abstract method isNameValid")
end


function StoreFrontInterface:isValid()
    error("abstract method isValid")
end


function StoreFrontInterface:nameValidationInfo()
    error("abstract method nameValidationInfo")
end


function StoreFrontInterface:validationInfo()
    error("abstract method validationInfo")
end


function StoreFrontInterface:getTestHtmlPath()
    error("abstract method getTestHtmlPath")
end


function StoreFrontInterface:getCurrentHostName()
    error("abstract method getCurrentHostName")
end


function StoreFrontInterface:getCurrentHostNamePath()
    error("abstract method getCurrentHostNamePath")
end


function StoreFrontInterface:getCurrentHomeHostName()
    error("abstract method getCurrentHomeHostName")
end


function StoreFrontInterface:getCurrentHomeHostNamePath()
    error("abstract method getCurrentHomeHostNamePath")
end


function StoreFrontInterface:getName()
    error("abstract method getName")
end


function StoreFrontInterface:getBasketName()
    error("abstract method getBasketName")
end


function StoreFrontInterface:getHomeHostName()
    error("abstract method getHomeHostName")
end


function StoreFrontInterface:getHomeHostNamePath()
    error("abstract method getHomeHostNamePath")
end


function StoreFrontInterface:getHostName()
    error("abstract method getHostName")
end


function StoreFrontInterface:getHostNamePath()
    error("abstract method getHostNamePath")
end


function StoreFrontInterface:getTestHomeHostName()
    error("abstract method getTestHomeHostName")
end


function StoreFrontInterface:getTestHomeHostNamePath()
    error("abstract method getTestHomeHostNamePath")
end


function StoreFrontInterface:getTestHostName()
    error("abstract method getTestHostName")
end


function StoreFrontInterface:getTestHostNamePath()
    error("abstract method getTestHostNamePath")
end


function StoreFrontInterface:getStaticPath()
    error("abstract method getStaticPath")
end


function StoreFrontInterface:getCategoryPath()
    error("abstract method getCategoryPath")
end


-- throws Exception
function StoreFrontInterface:getSubStores()
    error("abstract method getSubStores")
end


function StoreFrontInterface:getTagLocation()
    error("abstract method getTagLocation")
end


function StoreFrontInterface:getPackageLocation()
    error("abstract method getPackageLocation")
end


function StoreFrontInterface:getInventoryControl()
    error("abstract method getInventoryControl")
end


function StoreFrontInterface:getContextConfigurationInterface()
    error("abstract method getContextConfigurationInterface")
end


function StoreFrontInterface:setContextConfigurationInterface(contextConfigurationInterface)
    error("abstract method setContextConfigurationInterface")
end


function StoreFrontInterface:getFtp()
    error("abstract method getFtp")
end


function StoreFrontInterface:getFtpPath()
    error("abstract method getFtpPath")
end


function StoreFrontInterface:getFtpUserName()
    error("abstract method getFtpUserName")
end


function StoreFrontInterface:getFtpPassword()
    error("abstract method getFtpPassword")
end


function StoreFrontInterface:getTestFtp()
    error("abstract method getTestFtp")
end


function StoreFrontInterface:getTestFtpPath()
    error("abstract method getTestFtpPath")
end


function StoreFrontInterface:getTestFtpUserName()
    error("abstract method getTestFtpUserName")
end


function StoreFrontInterface:getTestFtpPassword()
    error("abstract method getTestFtpPassword")
end


function StoreFrontInterface:getTimeCreated()
    error("abstract method getTimeCreated")
end


function StoreFrontInterface:getLastModified()
    error("abstract method getLastModified")
end


function StoreFrontInterface:setName(value)
    error("abstract method setName")
end


function StoreFrontInterface:setBasketName(value)
    error("abstract method setBasketName")
end


function StoreFrontInterface:setHomeHostName(value)
    error("abstract method setHomeHostName")
end


-- throws Exception
function StoreFrontInterface:setHomeHostNamePath(value)
    error("abstract method setHomeHostNamePath")
end


function StoreFrontInterface:setHostName(value)
    error("abstract method setHostName")
end


-- throws Exception
function StoreFrontInterface:setHostNamePath(value)
    error("abstract method setHostNamePath")
end


function StoreFrontInterface:setTestHomeHostName(value)
    error("abstract method setTestHomeHostName")
end


-- throws Exception
function StoreFrontInterface:setTestHomeHostNamePath(value)
    error("abstract method setTestHomeHostNamePath")
end


function StoreFrontInterface:setTestHostName(value)
    error("abstract method setTestHostName")
end


-- throws Exception
function StoreFrontInterface:setTestHostNamePath(value)
    error("abstract method setTestHostNamePath")
end


-- throws Exception
function StoreFrontInterface:setImagePath(value)
    error("abstract method setImagePath")
end


-- throws Exception
function StoreFrontInterface:setStaticPath(value)
    error("abstract method setStaticPath")
end


-- throws Exception
function StoreFrontInterface:setCategoryPath(value)
    error("abstract method setCategoryPath")
end


function StoreFrontInterface:setPackageLocation(value)
    error("abstract method setPackageLocation")
end


function StoreFrontInterface:setInventoryControl(value)
    error("abstract method setInventoryControl")
end


function StoreFrontInterface:setFtp(value)
    error("abstract method setFtp")
end


-- throws Exception
function StoreFrontInterface:setFtpPath(value)
    error("abstract method setFtpPath")
end


function StoreFrontInterface:setFtpUserName(value)
    error("abstract method setFtpUserName")
end


function StoreFrontInterface:setFtpPassword(value)
    error("abstract method setFtpPassword")
end


function StoreFrontInterface:setTestFtp(value)
    error("abstract method setTestFtp")
end


-- throws Exception
function StoreFrontInterface:setTestFtpPath(value)
    error("abstract method setTestFtpPath")
end


function StoreFrontInterface:setTestFtpUserName(value)
    error("abstract method setTestFtpUserName")
end


function StoreFrontInterface:setTestFtpPassword(value)
    error("abstract method setTestFtpPassword")
end


function StoreFrontInterface:setTimeCreated(value)
    error("abstract method setTimeCreated")
end


function StoreFrontInterface:setLastModified(value)
    error("abstract method setLastModified")
end


-- throws Exception
function StoreFrontInterface:install(current, total)
    error("abstract method install")
end

return StoreFrontInterface

