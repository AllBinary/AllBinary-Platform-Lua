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
-- package taghelpers

local ViewHelper = {}
package.loaded["taghelpers.ViewHelper"] = ViewHelper

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

local HashMap = java_lazy("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = java_lazy("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local TransformFactory = java_lazy("org.allbinary.logic.visual.transform.TransformFactory")
local TransformInterface = java_lazy("org.allbinary.logic.visual.transform.TransformInterface")
local TransformDocumentInterface = java_lazy("org.allbinary.logic.visual.transform.data.TransformDocumentInterface")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

-- class table ViewHelper is declared before the requires
ViewHelper.__index = ViewHelper
ViewHelper.className = "ViewHelper"
ViewHelper.javaClassName = "taghelpers.ViewHelper"
ViewHelper.java_implements = " TransformInterface "
ViewHelper.java_interfaces = function() return {TransformInterface} end

function ViewHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    if self.componentInterface == nil then self.componentInterface = nil end
    self.NO_TYPE = 0
end


function ViewHelper._jinit(self, hashMap, pageContext)
    ViewHelper._init_fields(self)
        self.componentInterface = TransformFactory.getInstance():getInstance(self.abeClientInformation, hashMap, pageContext)
    return self
end

function ViewHelper.new(...)
    local self = setmetatable({}, ViewHelper)
    ViewHelper._jinit(self, ...)
    return self
end


function ViewHelper:getTypeId()
        return self.NO_TYPE
end


-- throws Exception
function ViewHelper:view()
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", self.componentInterface:view() end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to View: "
            if not rawequal(self.componentInterface, nil) then
                error = error .. tostring((getmetatable(self.componentInterface).javaClassName or getmetatable(self.componentInterface).className))
            else
                error = error .. tostring("Unknown")
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function ViewHelper:toXmlDoc()
        local try_ok, try_error, try_value = pcall(function()
            error(require("java.lang.Exception").new(require("allbinary_java").to_string("Hmm: ") .. require("allbinary_java").to_string(self.componentInterface:getTransformDocumentInterface():getDoc())), 0)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to View: "
            if not rawequal(self.componentInterface, nil) then
                error = error .. tostring((getmetatable(self.componentInterface).javaClassName or getmetatable(self.componentInterface).className))
            else
                error = error .. tostring("Unknown")
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end


function ViewHelper:getViewObject()
        return self.componentInterface
end


-- throws Exception
function ViewHelper:getTransformInfoInterface()
        return self.componentInterface:getTransformInfoInterface()
end


function ViewHelper:getTransformDocumentInterface()
        return nil
end


function ViewHelper:setTransformDocumentInterface(viewDocumentInterface)
        return
end

return ViewHelper

