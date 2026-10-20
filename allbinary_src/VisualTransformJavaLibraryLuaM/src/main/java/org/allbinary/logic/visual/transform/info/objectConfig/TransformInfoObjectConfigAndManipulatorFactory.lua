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
-- package org.allbinary.logic.visual.transform.info.objectConfig

local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CryptFileReader = require("org.allbinary.logic.control.crypt.file.CryptFileReader")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local TransformInfoObjectConfigAndManipulatorFactoryBase = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigAndManipulatorFactoryBase")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformInfoObjectConfigAndManipulatorFactory = {}
TransformInfoObjectConfigAndManipulatorFactory.__index = TransformInfoObjectConfigAndManipulatorFactory
TransformInfoObjectConfigAndManipulatorFactory.className = "TransformInfoObjectConfigAndManipulatorFactory"
setmetatable(TransformInfoObjectConfigAndManipulatorFactory, {__index = TransformInfoObjectConfigAndManipulatorFactoryBase})

function TransformInfoObjectConfigAndManipulatorFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function TransformInfoObjectConfigAndManipulatorFactory.getInstance()
        return TransformInfoObjectConfigAndManipulatorFactory.instance
end


function TransformInfoObjectConfigAndManipulatorFactory.new()
    local self = setmetatable(TransformInfoObjectConfigAndManipulatorFactoryBase.new(), TransformInfoObjectConfigAndManipulatorFactory)
    self:_init_fields()
    return self
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function TransformInfoObjectConfigAndManipulatorFactory:getInstance(abeClientInformation, transformInfoInterface, objectConfigFileAbPath)
        local try_ok, try_error = pcall(function()
            local data = CryptFileReader.new(TransformInfoObjectConfigData.getInstance().UNCRYPTED_EXTENSION, TransformInfoObjectConfigData.getInstance().ENCRYPTED_EXTENSION):get(objectConfigFileAbPath)
            return self:getInstance(abeClientInformation, transformInfoInterface, DomDocumentHelper.create(data))
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Could Not Load Object Config", TransformInfoObjectConfigAndManipulatorFactory.getInstance(), self.commonStrings.GET_INSTANCE, e)
            end
            error(e, 0)
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function TransformInfoObjectConfigAndManipulatorFactory:getInstance(abeClientInformation, transformInfoInterface)
        local try_ok, try_error = pcall(function()
            local stringValidationUtil = StringValidationUtil.getInstance()
            if transformInfoInterface ~= nil and not stringValidationUtil:isEmpty(transformInfoInterface:getStoreName()) then
                return GenericStoreTransformInfoObjectConfig.new(abeClientInformation, transformInfoInterface)
            else
                return TransformInfoObjectConfig.new(transformInfoInterface)
            end
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed To Get Instance: "
            if transformInfoInterface ~= nil then
                error = error .. transformInfoInterface:getName()
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, TransformInfoObjectConfigAndManipulatorFactory.getInstance(), self.commonStrings.GET_INSTANCE, e)
            end
            error(e, 0)
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function TransformInfoObjectConfigAndManipulatorFactory:getInstance(abeClientInformation, transformInfoInterface, document)
        local try_ok, try_error = pcall(function()
            local stringValidationUtil = StringValidationUtil.getInstance()
            if transformInfoInterface ~= nil and not stringValidationUtil:isEmpty(transformInfoInterface:getStoreName()) then
                return GenericStoreTransformInfoObjectConfig.new(abeClientInformation, transformInfoInterface, document)
            else
                return TransformInfoObjectConfig.new(transformInfoInterface, document)
            end
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed To Get Instance: "
            if transformInfoInterface ~= nil then
                error = error .. transformInfoInterface:getName()
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, TransformInfoObjectConfigAndManipulatorFactory.getInstance(), "getInstance(document)", e)
            end
            error(e, 0)
        end
end

TransformInfoObjectConfigAndManipulatorFactory.instance = TransformInfoObjectConfigAndManipulatorFactory.new()

return TransformInfoObjectConfigAndManipulatorFactory

