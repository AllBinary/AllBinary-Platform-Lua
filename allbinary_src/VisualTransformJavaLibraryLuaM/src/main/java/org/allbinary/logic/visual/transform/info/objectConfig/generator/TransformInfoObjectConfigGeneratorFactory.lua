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
-- package org.allbinary.logic.visual.transform.info.objectConfig.generator

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local InputOutputTypeData = require("org.allbinary.logic.io.InputOutputTypeData")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local TransformInfoObjectConfigGeneratorFactoryInterface = require("org.allbinary.logic.visual.transform.info.objectConfig.generator.TransformInfoObjectConfigGeneratorFactoryInterface")

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

local TransformInfoObjectConfigGeneratorFactory = {}
TransformInfoObjectConfigGeneratorFactory.__index = TransformInfoObjectConfigGeneratorFactory
TransformInfoObjectConfigGeneratorFactory.className = "TransformInfoObjectConfigGeneratorFactory"

function TransformInfoObjectConfigGeneratorFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function TransformInfoObjectConfigGeneratorFactory.getInstance()
        return TransformInfoObjectConfigGeneratorFactory.instance
end


function TransformInfoObjectConfigGeneratorFactory.new()
    local self = setmetatable({}, TransformInfoObjectConfigGeneratorFactory)
    self:_init_fields()
    return self
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function TransformInfoObjectConfigGeneratorFactory:getInstance(transformInfoInterface)
        local type = transformInfoInterface:getObjectConfigInterface():getOutputTypeName()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF("Generating Instance for type: " .. type, self, commonStrings.GET_INSTANCE)
        end
        if type == nil or ((type < InputOutputTypeData.getInstance().RESPONSE and -1) or (type > InputOutputTypeData.getInstance().RESPONSE and 1) or 0) == 0 or transformInfoInterface:isChild() then
            return BasicGenerator.new()
        elseif ((type < InputOutputTypeData.getInstance().FILE and -1) or (type > InputOutputTypeData.getInstance().FILE and 1) or 0) == 0 then
            return StoreFileGenerator.new(transformInfoInterface)
        else
            error(java_exception("Exception", "No Such TransformInfoObjectConfigGenerator Type"), 0)
        end
end

TransformInfoObjectConfigGeneratorFactory.instance = TransformInfoObjectConfigGeneratorFactory.new()

return TransformInfoObjectConfigGeneratorFactory

