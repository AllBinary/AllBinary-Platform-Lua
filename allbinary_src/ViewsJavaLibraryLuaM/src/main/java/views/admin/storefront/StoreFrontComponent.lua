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
-- package views.admin.storefront

-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local StoreFront = require("org.allbinary.business.context.modules.storefront.StoreFront")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
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

local StoreFrontComponent = {}
StoreFrontComponent.__index = StoreFrontComponent
StoreFrontComponent.className = "StoreFrontComponent"
setmetatable(StoreFrontComponent, {__index = HttpStoreComponentView})

function StoreFrontComponent:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.newStoreFrontInterface = nil
end


function StoreFrontComponent.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), StoreFrontComponent)
    self:_init_fields()
        -- super(...) made self above
        self.newStoreFrontInterface = StoreFront.new(self:getPageContext():getRequest())
        if self.newStoreFrontInterface:getName() == nil then
            self.newStoreFrontInterface:setName(self:getWeblisketSession():getStoreName())
        end
    return self
end


-- throws Exception
function StoreFrontComponent:view()
        local try_ok, try_error = pcall(function()
            return HttpStoreComponentView.view(self)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view", e)
            end
            error(e, 0)
        end
end

return StoreFrontComponent

