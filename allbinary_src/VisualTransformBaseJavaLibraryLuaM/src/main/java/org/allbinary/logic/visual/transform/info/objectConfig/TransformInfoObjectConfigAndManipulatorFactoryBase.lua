-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.logic.visual.transform.info.objectConfig

local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local TransformInfoObjectConfigAndManipulatorFactoryInterface = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigAndManipulatorFactoryInterface")

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

local TransformInfoObjectConfigAndManipulatorFactoryBase = {}
TransformInfoObjectConfigAndManipulatorFactoryBase.__index = TransformInfoObjectConfigAndManipulatorFactoryBase
TransformInfoObjectConfigAndManipulatorFactoryBase.className = "TransformInfoObjectConfigAndManipulatorFactoryBase"

function TransformInfoObjectConfigAndManipulatorFactoryBase:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
end

function TransformInfoObjectConfigAndManipulatorFactoryBase.new()
    local self = setmetatable({}, TransformInfoObjectConfigAndManipulatorFactoryBase)
    self:_init_fields()
    return self
end


-- throws Exception
function TransformInfoObjectConfigAndManipulatorFactoryBase:getInstance(abeClientInformation, transformInfoInterface, objectConfigFileAbPath)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function TransformInfoObjectConfigAndManipulatorFactoryBase:getInstance(abeClientInformation, transformInfoInterface)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function TransformInfoObjectConfigAndManipulatorFactoryBase:getInstance(abeClientInformation, transformInfoInterface, document)
        error(java_exception("RuntimeException"), 0)
end

return TransformInfoObjectConfigAndManipulatorFactoryBase

