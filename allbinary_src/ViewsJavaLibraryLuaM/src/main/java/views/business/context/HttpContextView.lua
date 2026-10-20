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
-- package views.business.context

local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ContextTransformer = require("org.allbinary.logic.visual.transform.ContextTransformer")
local TransformHttpRequestDocumentFactory = require("org.allbinary.logic.visual.transform.data.TransformHttpRequestDocumentFactory")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local HttpComponentView = require("views.HttpComponentView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HttpContextView = {}
HttpContextView.__index = HttpContextView
HttpContextView.className = "HttpContextView"
setmetatable(HttpContextView, {__index = HttpComponentView})

function HttpContextView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function HttpContextView.new(transformInfoInterface)
    local self = setmetatable(HttpComponentView.new(transformInfoInterface), HttpContextView)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("View Name: " .. transformInfoInterface:getName(), self, self.commonStrings.CONSTRUCTOR)
        end
        self:setTransformDocumentInterface(TransformHttpRequestDocumentFactory.getInstance(self:getPageContext(), self:getWeblisketSession()))
    return self
end


-- throws Exception
function HttpContextView:view()
        local try_ok, try_error = pcall(function()
            self:toXmlDoc()
            local success = XmlDocumentHelper.toString(self:getDoc())
            local result = ContextTransformer.new(self.abeClientInformation, self:getTransformInfoInterface()):translate(success)
            return result
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view", e)
            end
            error(e, 0)
        end
end

return HttpContextView

