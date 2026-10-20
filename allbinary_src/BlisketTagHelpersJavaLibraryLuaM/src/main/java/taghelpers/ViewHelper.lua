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

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = require("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local TransformFactory = require("org.allbinary.logic.visual.transform.TransformFactory")
local TransformInterface = require("org.allbinary.logic.visual.transform.TransformInterface")
local TransformDocumentInterface = require("org.allbinary.logic.visual.transform.data.TransformDocumentInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")

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
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ViewHelper = {}
ViewHelper.__index = ViewHelper
ViewHelper.className = "ViewHelper"

function ViewHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    self.componentInterface = nil
    self.NO_TYPE = 0
end


function ViewHelper.new(hashMap, pageContext)
    local self = setmetatable({}, ViewHelper)
    self:_init_fields()
        self.componentInterface = TransformFactory.getInstance():getInstance(self.abeClientInformation, hashMap, pageContext)
    return self
end


function ViewHelper:getTypeId()
        return self.NO_TYPE
end


-- throws Exception
function ViewHelper:view()
        local try_ok, try_error = pcall(function()
            return self.componentInterface:view()
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to View: "
            if self.componentInterface ~= nil then
                error = error .. tostring(getmetatable(self.componentInterface).className)
            else
                error = error .. tostring("Unknown")
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end


-- throws Exception
function ViewHelper:toXmlDoc()
        local try_ok, try_error = pcall(function()
            error(java_exception("Exception", "Hmm: " .. tostring(self.componentInterface:getTransformDocumentInterface():getDoc())), 0)
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to View: "
            if self.componentInterface ~= nil then
                error = error .. tostring(getmetatable(self.componentInterface).className)
            else
                error = error .. tostring("Unknown")
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
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

