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
-- package org.allbinary.business.context.modules.storefronts

local BasicStoreFrontInterface = {}
package.loaded["org.allbinary.business.context.modules.storefronts.BasicStoreFrontInterface"] = BasicStoreFrontInterface

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
-- class table BasicStoreFrontInterface is declared before the requires
BasicStoreFrontInterface.__index = BasicStoreFrontInterface
BasicStoreFrontInterface.className = "BasicStoreFrontInterface"
BasicStoreFrontInterface.javaClassName = "org.allbinary.business.context.modules.storefronts.BasicStoreFrontInterface"


function BasicStoreFrontInterface:getTestHtmlPath()
    error("abstract method getTestHtmlPath")
end


function BasicStoreFrontInterface:getCurrentHostName()
    error("abstract method getCurrentHostName")
end


function BasicStoreFrontInterface:getCurrentHostNamePath()
    error("abstract method getCurrentHostNamePath")
end


function BasicStoreFrontInterface:getCurrentHomeHostName()
    error("abstract method getCurrentHomeHostName")
end


function BasicStoreFrontInterface:getCurrentHomeHostNamePath()
    error("abstract method getCurrentHomeHostNamePath")
end


function BasicStoreFrontInterface:getName()
    error("abstract method getName")
end


function BasicStoreFrontInterface:getUserName()
    error("abstract method getUserName")
end


function BasicStoreFrontInterface:getBasketName()
    error("abstract method getBasketName")
end


function BasicStoreFrontInterface:getHomeHostName()
    error("abstract method getHomeHostName")
end


function BasicStoreFrontInterface:getHomeHostNamePath()
    error("abstract method getHomeHostNamePath")
end


function BasicStoreFrontInterface:getHostName()
    error("abstract method getHostName")
end


function BasicStoreFrontInterface:getHostNamePath()
    error("abstract method getHostNamePath")
end


function BasicStoreFrontInterface:getTestHomeHostName()
    error("abstract method getTestHomeHostName")
end


function BasicStoreFrontInterface:getTestHomeHostNamePath()
    error("abstract method getTestHomeHostNamePath")
end


function BasicStoreFrontInterface:getTestHostName()
    error("abstract method getTestHostName")
end


function BasicStoreFrontInterface:getTestHostNamePath()
    error("abstract method getTestHostNamePath")
end


function BasicStoreFrontInterface:getStaticPath()
    error("abstract method getStaticPath")
end


function BasicStoreFrontInterface:getCategoryPath()
    error("abstract method getCategoryPath")
end


-- throws Exception
function BasicStoreFrontInterface:getSubStores()
    error("abstract method getSubStores")
end


function BasicStoreFrontInterface:getTagLocation()
    error("abstract method getTagLocation")
end


function BasicStoreFrontInterface:getPackageLocation()
    error("abstract method getPackageLocation")
end


function BasicStoreFrontInterface:getInventoryControl()
    error("abstract method getInventoryControl")
end


function BasicStoreFrontInterface:getFtp()
    error("abstract method getFtp")
end


function BasicStoreFrontInterface:getFtpPath()
    error("abstract method getFtpPath")
end


function BasicStoreFrontInterface:getFtpUserName()
    error("abstract method getFtpUserName")
end


function BasicStoreFrontInterface:getFtpPassword()
    error("abstract method getFtpPassword")
end


function BasicStoreFrontInterface:getTestFtp()
    error("abstract method getTestFtp")
end


function BasicStoreFrontInterface:getTestFtpPath()
    error("abstract method getTestFtpPath")
end


function BasicStoreFrontInterface:getTestFtpUserName()
    error("abstract method getTestFtpUserName")
end


function BasicStoreFrontInterface:getTestFtpPassword()
    error("abstract method getTestFtpPassword")
end


function BasicStoreFrontInterface:getTimeCreated()
    error("abstract method getTimeCreated")
end


function BasicStoreFrontInterface:getLastModified()
    error("abstract method getLastModified")
end

return BasicStoreFrontInterface

