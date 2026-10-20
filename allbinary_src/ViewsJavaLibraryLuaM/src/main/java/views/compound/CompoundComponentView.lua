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
-- package views.compound

local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
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

local CompoundComponentView = {}
CompoundComponentView.__index = CompoundComponentView
CompoundComponentView.className = "CompoundComponentView"
setmetatable(CompoundComponentView, {__index = HttpStoreComponentView})

function CompoundComponentView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function CompoundComponentView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), CompoundComponentView)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function CompoundComponentView:view()
        local try_ok, try_error = pcall(function()
            local success = XmlDocumentHelper.toString(self:getDoc())
            local result = CompoundTransform.new(self:getTransformInfoInterface()):translate(success)
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

return CompoundComponentView

