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
-- package org.allbinary.business.init.db


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
local DatabaseConnectionInfoInterface = {}
DatabaseConnectionInfoInterface.__index = DatabaseConnectionInfoInterface
DatabaseConnectionInfoInterface.className = "DatabaseConnectionInfoInterface"


function DatabaseConnectionInfoInterface:getUrl()
    error("abstract method getUrl")
end


function DatabaseConnectionInfoInterface:getJdbcDriver()
    error("abstract method getJdbcDriver")
end


function DatabaseConnectionInfoInterface:getName()
    error("abstract method getName")
end


function DatabaseConnectionInfoInterface:getUserName()
    error("abstract method getUserName")
end


function DatabaseConnectionInfoInterface:getPassword()
    error("abstract method getPassword")
end


function DatabaseConnectionInfoInterface:getHost()
    error("abstract method getHost")
end


function DatabaseConnectionInfoInterface:getSchema()
    error("abstract method getSchema")
end


function DatabaseConnectionInfoInterface:getServer()
    error("abstract method getServer")
end


function DatabaseConnectionInfoInterface:getPort()
    error("abstract method getPort")
end


function DatabaseConnectionInfoInterface:setJdbcDriver(value)
    error("abstract method setJdbcDriver")
end


function DatabaseConnectionInfoInterface:setName(value)
    error("abstract method setName")
end


function DatabaseConnectionInfoInterface:setUserName(value)
    error("abstract method setUserName")
end


function DatabaseConnectionInfoInterface:setPassword(value)
    error("abstract method setPassword")
end


function DatabaseConnectionInfoInterface:setSchema(value)
    error("abstract method setSchema")
end


function DatabaseConnectionInfoInterface:setServer(value)
    error("abstract method setServer")
end


function DatabaseConnectionInfoInterface:setPort(value)
    error("abstract method setPort")
end


function DatabaseConnectionInfoInterface:getUserNameKey()
    error("abstract method getUserNameKey")
end


function DatabaseConnectionInfoInterface:getPasswordKey()
    error("abstract method getPasswordKey")
end

return DatabaseConnectionInfoInterface

