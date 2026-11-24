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

local CustomUriTransformView = {}
package.loaded["views.CustomUriTransformView"] = CustomUriTransformView

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local XmlDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = java_lazy("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local TransformInfoCustomUriTransformer = java_lazy("org.allbinary.logic.visual.transform.TransformInfoCustomUriTransformer")
local TransformInterface = java_lazy("org.allbinary.logic.visual.transform.TransformInterface")
local TransformDocumentFactory = java_lazy("org.allbinary.logic.visual.transform.data.TransformDocumentFactory")
local TransformDocumentInterface = java_lazy("org.allbinary.logic.visual.transform.data.TransformDocumentInterface")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table CustomUriTransformView is declared before the requires
CustomUriTransformView.__index = CustomUriTransformView
CustomUriTransformView.className = "CustomUriTransformView"
CustomUriTransformView.javaClassName = "views.CustomUriTransformView"
CustomUriTransformView.java_implements = " TransformInterface "
CustomUriTransformView.java_interfaces = function() return {TransformInterface} end

function CustomUriTransformView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    if self.transformInfoInterface == nil then self.transformInfoInterface = nil end
    if self.transformDocumentInterface == nil then self.transformDocumentInterface = nil end
    self.NO_TYPE = 0
end


function CustomUriTransformView._jinit(self, transformInfoInterface)
    CustomUriTransformView._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF("View Name: " .. transformInfoInterface:getName(), self, self.commonStrings.CONSTRUCTOR)
        end
        self:setTransformInfoInterface(transformInfoInterface)
        self:setTransformDocumentInterface(TransformDocumentFactory.getInstance())
    return self
end

function CustomUriTransformView.new(...)
    local self = setmetatable({}, CustomUriTransformView)
    CustomUriTransformView._jinit(self, ...)
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
        local try_ok, try_error, try_value = pcall(function()
            local success = XmlDocumentHelper.toString(self:getDoc())
            local result = TransformInfoCustomUriTransformer.new(self.abeClientInformation, self:getTransformInfoInterface()):translate(success)
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return CustomUriTransformView

