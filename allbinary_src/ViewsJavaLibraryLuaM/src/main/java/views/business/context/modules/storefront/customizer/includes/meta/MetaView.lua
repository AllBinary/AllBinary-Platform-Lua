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
-- package views.business.context.modules.storefront.customizer.includes.meta

local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local MetasValidation = require("org.allbinary.logic.visual.transform.template.customizer.includes.meta.MetasValidation")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local HttpStoreComponentView = require("views.business.context.modules.storefront.HttpStoreComponentView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MetaView = {}
MetaView.__index = MetaView
MetaView.className = "MetaView"
setmetatable(MetaView, {__index = HttpStoreComponentView})

function MetaView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.metasValidation = nil
end


function MetaView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), MetaView)
    self:_init_fields()
        -- super(...) made self above
        self.metasValidation = MetasValidation.new(self:getWeblisketSession():getStoreName())
    return self
end


function MetaView:addDomNodeInterfaces()
        self:addDomNodeInterface(self.metasValidation)
end


-- throws Exception
function MetaView:toXmlNode(document)
        local try_ok, try_error = pcall(function()
            return self.metasValidation:toXmlNode(document)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().XSLLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "toXmlNode", e)
            end
            error(e, 0)
        end
end


-- throws Exception
function MetaView:view()
        local try_ok, try_error = pcall(function()
            self:addDomNodeInterfaces()
            return HttpStoreComponentView.view(self)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end

return MetaView

