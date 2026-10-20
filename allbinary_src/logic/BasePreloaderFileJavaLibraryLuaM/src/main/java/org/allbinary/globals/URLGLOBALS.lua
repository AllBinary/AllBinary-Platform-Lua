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
-- package org.allbinary.globals


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local URLGLOBALS = {}
URLGLOBALS.__index = URLGLOBALS
URLGLOBALS.className = "URLGLOBALS"

function URLGLOBALS.new()
    local self = setmetatable({}, URLGLOBALS)
    return self
end


function URLGLOBALS.init(urlGlobalsInterface)
        self.URLGLOBALS.urlGlobalsInterface = urlGlobalsInterface
end


function URLGLOBALS.isTestingMode()
        return self.URLGLOBALS.urlGlobalsInterface:isTestingMode()
end


function URLGLOBALS.getWebappPath()
        return self.URLGLOBALS.urlGlobalsInterface:getWebappPath()
end


function URLGLOBALS.getTestHtmlPath()
        return self.URLGLOBALS.urlGlobalsInterface:getTestHtmlPath()
end


-- throws Exception
function URLGLOBALS.getMainPath()
        return self.URLGLOBALS.urlGlobalsInterface:getMainPath()
end

URLGLOBALS.urlGlobalsInterface = AppUrlGlobals.NULL_APP_URL_GLOBALS

return URLGLOBALS

