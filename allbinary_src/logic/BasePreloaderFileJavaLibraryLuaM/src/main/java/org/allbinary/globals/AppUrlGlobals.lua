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

local StringUtil = require("org.allbinary.logic.string.StringUtil")
local UrlGlobalsInterface = require("org.allbinary.globals.UrlGlobalsInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--implements
local AppUrlGlobals = {}
AppUrlGlobals.__index = AppUrlGlobals
AppUrlGlobals.className = "AppUrlGlobals"
setmetatable(AppUrlGlobals, {__index = UrlGlobalsInterface})

function AppUrlGlobals:_init_fields()
    self.path = StringUtil.getInstance().EMPTY_STRING
end

function AppUrlGlobals.new()
    local self = setmetatable(UrlGlobalsInterface.new(), AppUrlGlobals)
    self:_init_fields()
    return self
end


function AppUrlGlobals:isTestingMode()
        return false
end


function AppUrlGlobals:getWebappPath()
        return self.path
end


function AppUrlGlobals:setWebappPath(path)
        self.path = path
        if not (("\\" == "" or string.sub(self.path, -#"\\") == "\\") or ("/" == "" or string.sub(self.path, -#"/") == "/")) then
            self.path = self.path .. "\\"
        end
end


function AppUrlGlobals:getTestHtmlPath()
        return StringUtil.getInstance().EMPTY_STRING
end


-- throws Exception
function AppUrlGlobals:getMainPath()
        return self.path
end

AppUrlGlobals.NULL_APP_URL_GLOBALS = AppUrlGlobals.new()

return AppUrlGlobals

