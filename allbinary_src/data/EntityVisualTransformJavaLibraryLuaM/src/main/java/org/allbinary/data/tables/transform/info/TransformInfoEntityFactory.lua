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
-- package org.allbinary.data.tables.transform.info

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local TransformInfoFactoryInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoFactoryInterface")
local TransformInfoObjectConfigAndManipulatorFactoryBase = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigAndManipulatorFactoryBase")
local TransformInfoObjectConfigGeneratorFactoryInterface = require("org.allbinary.logic.visual.transform.info.objectConfig.generator.TransformInfoObjectConfigGeneratorFactoryInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformInfoEntityFactory = {}
TransformInfoEntityFactory.__index = TransformInfoEntityFactory
TransformInfoEntityFactory.className = "TransformInfoEntityFactory"


function TransformInfoEntityFactory.new()
    local self = setmetatable({}, TransformInfoEntityFactory)
    return self
end


function TransformInfoEntityFactory.getInstance(transformInfoObjectConfigGeneratorFactoryInterface, transformInfoObjectConfigAndManipulatorFactoryInterface, transformInfoFactoryInterface)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error = pcall(function()
            return TransformInfoEntity.new(transformInfoObjectConfigGeneratorFactoryInterface, transformInfoObjectConfigAndManipulatorFactoryInterface, transformInfoFactoryInterface)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().ENTITYFACTORYERROR) then
                logUtil:put(commonStrings.EXCEPTION, "TransformInfoEntityFactory", commonStrings.GET_INSTANCE, e)
            end
            return nil
        end
end

return TransformInfoEntityFactory

