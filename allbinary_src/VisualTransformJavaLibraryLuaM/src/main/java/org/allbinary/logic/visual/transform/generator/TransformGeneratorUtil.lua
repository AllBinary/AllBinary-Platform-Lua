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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local InputOutputTypeData = require("org.allbinary.logic.io.InputOutputTypeData")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformFactory = require("org.allbinary.logic.visual.transform.TransformFactory")
local TransformInterface = require("org.allbinary.logic.visual.transform.TransformInterface")
local TransformInfoDomNode = require("org.allbinary.logic.visual.transform.info.TransformInfoDomNode")
local TransformInfoHttpInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local StoreFileGenerator = require("org.allbinary.logic.visual.transform.info.objectConfig.generator.StoreFileGenerator")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformGeneratorUtil = {}
TransformGeneratorUtil.__index = TransformGeneratorUtil
TransformGeneratorUtil.className = "TransformGeneratorUtil"

function TransformGeneratorUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function TransformGeneratorUtil.getInstance()
        return TransformGeneratorUtil.instance
end


function TransformGeneratorUtil.new()
    local self = setmetatable({}, TransformGeneratorUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function TransformGeneratorUtil:generate(abeClientInformation, transformInfoInterface, ownerTransformInfoInterface)
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Generating View: " .. transformInfoInterface:getName(), self, "generate()")
            end
            local componentInterface = TransformFactory.getInstance():getInstance(abeClientInformation, transformInfoInterface:getName(), ownerTransformInfoInterface)
            local result = componentInterface:view()
            local httpTransformInfoInterface = componentInterface:getTransformInfoInterface()
            local inputOutputTypeData = InputOutputTypeData.getInstance()
            if ((string.find(result, "<HTML>", 1, true) or 0) - 1) >= 0 then
                httpTransformInfoInterface:getPropertiesHashMap():put(inputOutputTypeData.NAME, inputOutputTypeData.DEFAULT)
            else
                httpTransformInfoInterface:getPropertiesHashMap():put(inputOutputTypeData.NAME, inputOutputTypeData.DEFAULT_FRAGMENT)
            end
            StoreFileGenerator.new(componentInterface:getTransformInfoInterface()):process(result)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to generate a view", self, "generate()", e)
            end
            error(e, 0)
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function TransformGeneratorUtil:generate(abeClientInformation, transformInfoDomNode, ownerTransformInfoInterface)
        self:generate(abeClientInformation, transformInfoDomNode:getTransformInfoInterface(), ownerTransformInfoInterface)
end

TransformGeneratorUtil.instance = TransformGeneratorUtil.new()

return TransformGeneratorUtil

