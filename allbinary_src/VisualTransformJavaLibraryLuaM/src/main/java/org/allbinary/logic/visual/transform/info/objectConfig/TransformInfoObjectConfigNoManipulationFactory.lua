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
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
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

local TransformInfoObjectConfigNoManipulationFactory = {}
TransformInfoObjectConfigNoManipulationFactory.__index = TransformInfoObjectConfigNoManipulationFactory
TransformInfoObjectConfigNoManipulationFactory.className = "TransformInfoObjectConfigNoManipulationFactory"

function TransformInfoObjectConfigNoManipulationFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function TransformInfoObjectConfigNoManipulationFactory.getInstance()
        return TransformInfoObjectConfigNoManipulationFactory.instance
end


function TransformInfoObjectConfigNoManipulationFactory.new()
    local self = setmetatable({}, TransformInfoObjectConfigNoManipulationFactory)
    self:_init_fields()
    return self
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function TransformInfoObjectConfigNoManipulationFactory:getInstance(transformInfoInterface, objectConfigFileAbPath)
        local try_ok, try_error = pcall(function()
            local transformInfoObjectConfigData = TransformInfoObjectConfigData.getInstance()
            local data = CryptFileReader.new(transformInfoObjectConfigData.UNCRYPTED_EXTENSION, transformInfoObjectConfigData:getInstance().ENCRYPTED_EXTENSION):get(objectConfigFileAbPath)
            return TransformInfoObjectConfig.new(transformInfoInterface, DomDocumentHelper.create(data))
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Could Not Load Object Config", self, commonStrings.GET_INSTANCE, e)
            end
            error(e, 0)
        end
end

TransformInfoObjectConfigNoManipulationFactory.instance = TransformInfoObjectConfigNoManipulationFactory.new()

return TransformInfoObjectConfigNoManipulationFactory

