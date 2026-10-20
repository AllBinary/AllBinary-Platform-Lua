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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local TransformFactory = require("org.allbinary.logic.visual.transform.TransformFactory")
local TransformInterface = require("org.allbinary.logic.visual.transform.TransformInterface")
local TransformInfo = require("org.allbinary.logic.visual.transform.info.TransformInfo")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformTemplateInterface = require("org.allbinary.logic.visual.transform.template.TransformTemplateInterface")
local HttpStoreComponentView = require("views.business.context.modules.storefront.HttpStoreComponentView")
local NoTemplateTransformInfoObjectConfig = require("views.business.context.modules.storefront.customizer.template.objectConfig.NoTemplateTransformInfoObjectConfig")

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

local RootContextView = {}
RootContextView.__index = RootContextView
RootContextView.className = "RootContextView"
setmetatable(RootContextView, {__index = HttpStoreComponentView})

function RootContextView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function RootContextView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), RootContextView)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("View Name: " .. transformInfoInterface:getName(), self, "RootContextView()")
        end
    return self
end


-- throws Exception
function RootContextView:view()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("View Name: " .. self:getTransformInfoInterface():getName(), self, "view()")
            end
            local viewName = self:getName()
            local componentInterface = TransformFactory.getInstance():getInstance(self.abeClientInformation, viewName, self:getTransformInfoInterface())
            return componentInterface:view()
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end


-- throws Exception
function RootContextView:getName()
        local try_ok, try_error = pcall(function()
            local objectConfig = NoTemplateTransformInfoObjectConfig.new(self:getTransformInfoInterface(), self:getTransformInfoInterface():getObjectConfigInterface():toXmlDoc())
            local componentsVector = objectConfig:getTransforms()
            if componentsVector:size() == 0 then
                error(java_exception("Exception", "Template View Not Set - No Components"), 0)
            end
            if componentsVector:size() > 1 then
                error(java_exception("Exception", "To Many Root Template Views: " .. tostring(componentsVector:size())), 0)
            end
            local transformInfoInterface = componentsVector:get(0)
            local viewName = transformInfoInterface:getName()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Root Template With View Name: " .. viewName, self, "getName()")
            end
            if StringValidationUtil.getInstance():isEmpty(viewName) then
                error(java_exception("Exception", "Template View Not Set - No View Name"), 0)
            end
            return viewName
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getName()", e)
            end
            error(e, 0)
        end
end

return RootContextView

