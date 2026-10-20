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
-- package views.business.context.modules.storefront.customizer

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformGeneratorUtil = require("org.allbinary.logic.visual.transform.generator.TransformGeneratorUtil")
local TransformInfo = require("org.allbinary.logic.visual.transform.info.TransformInfo")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StoreCustomizerComponentUtil = {}
StoreCustomizerComponentUtil.__index = StoreCustomizerComponentUtil
StoreCustomizerComponentUtil.className = "StoreCustomizerComponentUtil"

function StoreCustomizerComponentUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function StoreCustomizerComponentUtil.getInstance()
        return StoreCustomizerComponentUtil.instance
end


function StoreCustomizerComponentUtil.new()
    local self = setmetatable({}, StoreCustomizerComponentUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function StoreCustomizerComponentUtil:generate(abeClientInformation, transformInfoInterface)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Generating Modified Views For: " .. transformInfoInterface:getName(), self, "generateModifiedViews()")
        end
        local customizerUtil = CustomizerUtil.getInstance()
        local allCustomizedViews = customizerUtil:getTransformInfoObjectConfigGroupComponentNodes(transformInfoInterface)
        local size = allCustomizedViews:size()
        for index = 0, size - 1 do
            local nextTransformInfoInterface = allCustomizedViews:get(index)
            local allViewsToBeModified = customizerUtil:getTransformInfoObjectConfigComponentNodesToCustomize(transformInfoInterface, nextTransformInfoInterface)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("View or component that was modified by a Customizer: " .. nextTransformInfoInterface:getName(), self, "generateModifiedViews()")
            end
            self:generate(abeClientInformation, transformInfoInterface, allViewsToBeModified)
        end
        return StringUtil.getInstance().EMPTY_STRING
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function StoreCustomizerComponentUtil:generate(abeClientInformation, transformInfoInterface, allViewsToBeModifiedVector)
        local customizerUtil = CustomizerUtil.getInstance()
        local size = allViewsToBeModifiedVector:size()
        for index = 0, size - 1 do
            local nextTransformInfoInterface = allViewsToBeModifiedVector:get(index)
            local specifiedTransformInfoInterface = customizerUtil:getTransformInfoInterfaceToCustomize(transformInfoInterface, nextTransformInfoInterface)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Retrieved: " .. specifiedTransformInfoInterface:getName(), self, "generateModifiedViews()")
            end
            TransformGeneratorUtil.getInstance():generate(abeClientInformation, nextTransformInfoInterface, specifiedTransformInfoInterface)
        end
end

StoreCustomizerComponentUtil.instance = StoreCustomizerComponentUtil.new()

return StoreCustomizerComponentUtil

