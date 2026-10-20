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

local InitInfo = require("org.allbinary.business.init.InitInfo")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local UrlGlobalsInterface = require("org.allbinary.globals.UrlGlobalsInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WebAppUrlGlobals = {}
WebAppUrlGlobals.__index = WebAppUrlGlobals
WebAppUrlGlobals.className = "WebAppUrlGlobals"
setmetatable(WebAppUrlGlobals, {__index = UrlGlobalsInterface})

function WebAppUrlGlobals:_init_fields()
    self.path = nil
    self.isWebappPathSet = false
end

function WebAppUrlGlobals.new()
    local self = setmetatable(UrlGlobalsInterface.new(), WebAppUrlGlobals)
    self:_init_fields()
    return self
end


function WebAppUrlGlobals:isTestingMode()
        return InitInfo.getInstance():isTesting()
end


function WebAppUrlGlobals:getWebappPath()
        return self.path
end


function WebAppUrlGlobals:setWebappPath(path)
        path = path
        self.isWebappPathSet = true
end


function WebAppUrlGlobals:getTestHtmlPath()
        return InitInfo.getInstance():getTestHtmlPath()
end


-- throws Exception
function WebAppUrlGlobals:getMainPath()
        local mainPath = InitInfo.getInstance():getMainPath()
        if not StringValidationUtil.getInstance():isEmpty(mainPath) then
            return mainPath
        elseif self.isWebappPathSet then
            return self:getWebappPath()
        else
            error(java_exception("Exception", "Webapp Path is not set"), 0)
        end
end

return WebAppUrlGlobals

