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
-- package org.allbinary.logic.visual.transform.template

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local TransformInfoEntity = require("org.allbinary.data.tables.transform.info.TransformInfoEntity")
local TransformInfoEntityBuilder = require("org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfoObjectFactory = require("org.allbinary.logic.visual.transform.info.TransformInfoObjectFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformTemplateFactory = {}
TransformTemplateFactory.__index = TransformTemplateFactory
TransformTemplateFactory.className = "TransformTemplateFactory"

function TransformTemplateFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function TransformTemplateFactory.getInstance()
        return TransformTemplateFactory.instance
end


function TransformTemplateFactory.new()
    local self = setmetatable({}, TransformTemplateFactory)
    self:_init_fields()
    return self
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function TransformTemplateFactory:getInstance(abeClientInformation, templateName, propertiesHashMap, pageContext)
        local try_ok, try_error = pcall(function()
            local transformInfoEntity = TransformInfoEntityBuilder.getInstance()
            local transformInfoInterface = transformInfoEntity:get(templateName, propertiesHashMap, pageContext)
            return TransformInfoObjectFactory.getInstance():getInstance(abeClientInformation, transformInfoInterface)
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed To Get Instance"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
                self.logUtil:put(error .. templateName .. "->TemplateFactory", self, "getInstance(viewName, HashMap, PageContext)", e)
            end
            error(e, 0)
        end
end

TransformTemplateFactory.instance = TransformTemplateFactory.new()

return TransformTemplateFactory

