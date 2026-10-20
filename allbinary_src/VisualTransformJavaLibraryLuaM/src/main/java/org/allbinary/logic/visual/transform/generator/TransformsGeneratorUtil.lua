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
-- package org.allbinary.logic.visual.transform.generator

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformInfoDomNode = require("org.allbinary.logic.visual.transform.info.TransformInfoDomNode")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfoObjectConfigInterface = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface")

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

local TransformsGeneratorUtil = {}
TransformsGeneratorUtil.__index = TransformsGeneratorUtil
TransformsGeneratorUtil.className = "TransformsGeneratorUtil"

function TransformsGeneratorUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function TransformsGeneratorUtil.getInstance()
        return TransformsGeneratorUtil.instance
end


function TransformsGeneratorUtil.new()
    local self = setmetatable({}, TransformsGeneratorUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function TransformsGeneratorUtil:generateComponentsFromObjectConfig(abeClientInformation, transformInfoInterface, group)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Started Group: " .. group, self, "generateComponentsFromObjectConfig(2)")
        end
        local transformInfoObjectConfigInterface = transformInfoInterface:getObjectConfigInterface()
        local result = self:generateComponentsFromObjectConfig(abeClientInformation, transformInfoObjectConfigInterface, transformInfoInterface, group)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("End Group: " .. group, self, "generateComponentsFromObjectConfig(2)")
        end
        return result
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function TransformsGeneratorUtil:generateComponentsFromObjectConfig(abeClientInformation, transformInfoObjectConfigInterface, transformInfoInterface, group)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Started Group: " .. group, self, "generateComponentsFromObjectConfig()")
        end
        local transformInfoObjectConfigComponentVector = transformInfoObjectConfigInterface:getTransformsGroup(group)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Processing ")
            stringBuffer:appendint(transformInfoObjectConfigComponentVector:size())
            stringBuffer:append(" Components Group: ")
            stringBuffer:append(group)
            self.logUtil:putF(tostring(stringBuffer), self, "generateComponentsFromObjectConfig()")
        end
        if transformInfoObjectConfigComponentVector:size() < 1 then
            error(java_exception("Exception", "No Pages Generated For Template."), 0)
        end
        local size = transformInfoObjectConfigComponentVector:size()
        for index = 0, size - 1 do
            local transformInfoObjectConfigComponent = transformInfoObjectConfigComponentVector:get(index)
            TransformGeneratorUtil.getInstance():generate(abeClientInformation, transformInfoObjectConfigComponent, transformInfoInterface)
        end
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Done Group: " .. group, self, "generateComponentsFromObjectConfig()")
        end
        local stringBuffer = StringMaker.new()
        stringBuffer:append("<!-- Generated all template views successfully for View: ")
        stringBuffer:append(transformInfoInterface:getName())
        stringBuffer:append("-->")
        return tostring(stringBuffer)
end

TransformsGeneratorUtil.instance = TransformsGeneratorUtil.new()

return TransformsGeneratorUtil

