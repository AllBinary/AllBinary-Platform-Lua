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
local TransformInfoData = require("org.allbinary.logic.visual.transform.info.TransformInfoData")
local TransformInfoHttpInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfosData = require("org.allbinary.logic.visual.transform.info.TransformInfosData")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local GeneratorStoreFrontContextView = require("views.business.context.modules.storefront.generator.GeneratorStoreFrontContextView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PreviewGeneratorStoreFrontContextView = {}
PreviewGeneratorStoreFrontContextView.__index = PreviewGeneratorStoreFrontContextView
PreviewGeneratorStoreFrontContextView.className = "PreviewGeneratorStoreFrontContextView"
setmetatable(PreviewGeneratorStoreFrontContextView, {__index = GeneratorStoreFrontContextView})

function PreviewGeneratorStoreFrontContextView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function PreviewGeneratorStoreFrontContextView.new(transformInfoInterface)
    local self = setmetatable(GeneratorStoreFrontContextView.new(transformInfoInterface), PreviewGeneratorStoreFrontContextView)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function PreviewGeneratorStoreFrontContextView:view()
        local try_ok, try_error = pcall(function()
            local httpTransformInfoInterface = self:getTransformInfoInterface()
            httpTransformInfoInterface:getPropertiesHashMap():put(TransformInfoData.getInstance().PARTIAL, CommonSeps.getInstance().SPACE + TransformInfosData.getInstance().PREVIEW)
            return self:view(TransformInfosData.getInstance().PREVIEW)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end

return PreviewGeneratorStoreFrontContextView

