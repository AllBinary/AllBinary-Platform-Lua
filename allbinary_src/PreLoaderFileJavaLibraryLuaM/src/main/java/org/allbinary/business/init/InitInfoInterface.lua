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
-- package org.allbinary.business.init

local AbPath = require("org.allbinary.logic.io.path.AbPath")

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
local InitInfoInterface = {}
InitInfoInterface.__index = InitInfoInterface
InitInfoInterface.className = "InitInfoInterface"


function InitInfoInterface:isTesting()
    error("abstract method isTesting")
end


function InitInfoInterface:getTesting()
    error("abstract method getTesting")
end


function InitInfoInterface:getTestHtmlPath()
    error("abstract method getTestHtmlPath")
end


function InitInfoInterface:getMainPath()
    error("abstract method getMainPath")
end


function InitInfoInterface:setTesting(value)
    error("abstract method setTesting")
end


function InitInfoInterface:setTestHtmlPath(value)
    error("abstract method setTestHtmlPath")
end


function InitInfoInterface:setMainPath(value)
    error("abstract method setMainPath")
end


-- throws Exception
function InitInfoInterface:isTestingValid(testing)
    error("abstract method isTestingValid")
end


function InitInfoInterface:isTestHtmlPathValid(value)
    error("abstract method isTestHtmlPathValid")
end


function InitInfoInterface:isMainPathValid(value)
    error("abstract method isMainPathValid")
end

return InitInfoInterface

