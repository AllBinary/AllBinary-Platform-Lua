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

local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = require("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local TransformInfoCustomUriTransformer = require("org.allbinary.logic.visual.transform.TransformInfoCustomUriTransformer")
local TransformInterface = require("org.allbinary.logic.visual.transform.TransformInterface")
local TransformDocumentFactory = require("org.allbinary.logic.visual.transform.data.TransformDocumentFactory")
local TransformDocumentInterface = require("org.allbinary.logic.visual.transform.data.TransformDocumentInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
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

local CustomUriTransformView = {}
CustomUriTransformView.__index = CustomUriTransformView
CustomUriTransformView.className = "CustomUriTransformView"

function CustomUriTransformView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    self.transformInfoInterface = nil
    self.transformDocumentInterface = nil
    self.NO_TYPE = 0
end


function CustomUriTransformView.new(transformInfoInterface)
    local self = setmetatable({}, CustomUriTransformView)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("View Name: " .. transformInfoInterface:getName(), self, self.commonStrings.CONSTRUCTOR)
        end
        self:setTransformInfoInterface(transformInfoInterface)
        self:setTransformDocumentInterface(TransformDocumentFactory.getInstance())
    return self
end


function CustomUriTransformView:getTypeId()
        return self.NO_TYPE
end


function CustomUriTransformView:getTransformInfoInterface()
        return self.transformInfoInterface
end


function CustomUriTransformView:setTransformInfoInterface(transformInfoInterface)
        self.transformInfoInterface = transformInfoInterface
end


function CustomUriTransformView:getTransformDocumentInterface()
        return self.transformDocumentInterface
end


function CustomUriTransformView:setTransformDocumentInterface(transformDocumentInterface)
        self.transformDocumentInterface = transformDocumentInterface
end


function CustomUriTransformView:toXmlDoc()
        return self.transformDocumentInterface:getDoc()
end


-- throws Exception
function CustomUriTransformView:getDoc()
        local document = self:getTransformInfoInterface():getDataDocument()
        local dataNode = self:getTransformDocumentInterface():getDoc():importNode(document:getFirstChild(), true)
        if dataNode ~= nil then
            self:getTransformDocumentInterface():getBaseNode():appendChild(dataNode)
        end
        return self:getTransformDocumentInterface():getDoc()
end


-- throws Exception
function CustomUriTransformView:view()
        local try_ok, try_error = pcall(function()
            local success = XmlDocumentHelper.toString(self:getDoc())
            local result = TransformInfoCustomUriTransformer.new(self.abeClientInformation, self:getTransformInfoInterface()):translate(success)
            return result
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end

return CustomUriTransformView

