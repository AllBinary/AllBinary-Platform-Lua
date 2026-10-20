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
-- package views

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = require("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local BasicTransformer = require("org.allbinary.logic.visual.transform.BasicTransformer")
local TransformInterface = require("org.allbinary.logic.visual.transform.TransformInterface")
local TransformDocumentInterface = require("org.allbinary.logic.visual.transform.data.TransformDocumentInterface")
local TransformHttpRequestDocumentFactory = require("org.allbinary.logic.visual.transform.data.TransformHttpRequestDocumentFactory")
local TransformInfoHttpComposite = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpComposite")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HttpComponentView = {}
HttpComponentView.__index = HttpComponentView
HttpComponentView.className = "HttpComponentView"
setmetatable(HttpComponentView, {__index = TransformInfoHttpComposite})

function HttpComponentView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    self.domNodeInterfaceVector = nil
    self.transformDocumentInterface = nil
    self.NO_TYPE = 0
end


function HttpComponentView.new(transformInfoInterface)
    local self = setmetatable(TransformInfoHttpComposite.new(transformInfoInterface), HttpComponentView)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("View Name: " .. transformInfoInterface:getName(), self, self.commonStrings.CONSTRUCTOR)
        end
        self.domNodeInterfaceVector = BasicArrayListD.new()
        self:setTransformDocumentInterface(TransformHttpRequestDocumentFactory.getInstance(self:getPageContext(), self:getWeblisketSession()))
    return self
end


function HttpComponentView:getTypeId()
        return self.NO_TYPE
end


function HttpComponentView:getTransformDocumentInterface()
        return self.transformDocumentInterface
end


function HttpComponentView:setTransformDocumentInterface(transformDocumentInterface)
        self.transformDocumentInterface = transformDocumentInterface
end


function HttpComponentView:addDomNodeInterface(domNodeInterface)
        self.domNodeInterfaceVector:add(domNodeInterface)
end


-- throws Exception
function HttpComponentView:toXmlDoc()
        local try_ok, try_error = pcall(function()
            local size = self.domNodeInterfaceVector:size()
            for index = 0, size - 1 do
                local domNodeInterface = self.domNodeInterfaceVector:get(index)
                self.transformDocumentInterface:getBaseNode():appendChild(domNodeInterface:toXmlNode(self.transformDocumentInterface:getDoc()))
            end
            return self:getTransformDocumentInterface():getDoc()
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "toXmlDoc()", e)
            end
            error(e, 0)
        end
end


-- throws Exception
function HttpComponentView:getDoc()
        local document = self:getTransformInfoInterface():getDataDocument()
        local node = DomNodeHelper.getFirstChildElement(document)
        if node ~= nil then
            local dataNode = self:getTransformDocumentInterface():getDoc():importNode(node, true)
            if dataNode ~= nil then
                self:getTransformDocumentInterface():getBaseNode():appendChild(dataNode)
            end
        end
        return self:getTransformDocumentInterface():getDoc()
end


-- throws Exception
function HttpComponentView:view()
        local try_ok, try_error = pcall(function()
            self:toXmlDoc()
            local success = XmlDocumentHelper.toString(self:getDoc())
            local result = BasicTransformer.new(self.abeClientInformation, self:getTransformInfoInterface()):translate(success)
            return result
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end

return HttpComponentView

