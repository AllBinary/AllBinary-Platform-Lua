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
-- package views.business.context.modules.storefront.generator

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local TransformsGeneratorUtil = require("org.allbinary.logic.visual.transform.generator.TransformsGeneratorUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfosData = require("org.allbinary.logic.visual.transform.info.TransformInfosData")
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

local GeneratorStoreFrontContextView = {}
GeneratorStoreFrontContextView.__index = GeneratorStoreFrontContextView
GeneratorStoreFrontContextView.className = "GeneratorStoreFrontContextView"
setmetatable(GeneratorStoreFrontContextView, {__index = HttpStoreComponentView})

function GeneratorStoreFrontContextView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function GeneratorStoreFrontContextView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), GeneratorStoreFrontContextView)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("View Name: " .. transformInfoInterface:getName(), self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


-- throws Exception
function GeneratorStoreFrontContextView:view(group)
        local result = TransformsGeneratorUtil.getInstance():generateComponentsFromObjectConfig(self.abeClientInformation, self:getTransformInfoInterface(), group)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPEXTRAOUTPUT) then
            return result
        else
            return StringUtil.getInstance().EMPTY_STRING
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function GeneratorStoreFrontContextView:view()
        local try_ok, try_error = pcall(function()
            return self:view(TransformInfosData.getInstance().ALL)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end

return GeneratorStoreFrontContextView

