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
-- package views.generic.advertisement.area

local AdvertisementAreaData = require("org.allbinary.business.advertisement.area.AdvertisementAreaData")
local AdvertisementAreaInterface = require("org.allbinary.business.advertisement.area.AdvertisementAreaInterface")
local AdvertisementAreasEntityFactory = require("org.allbinary.data.tables.advertisement.areas.AdvertisementAreasEntityFactory")
local AdvertisementAreasEntityInterface = require("org.allbinary.data.tables.advertisement.areas.AdvertisementAreasEntityInterface")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
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

local AdvertisementAreaView = {}
AdvertisementAreaView.__index = AdvertisementAreaView
AdvertisementAreaView.className = "AdvertisementAreaView"
setmetatable(AdvertisementAreaView, {__index = HttpStoreComponentView})

function AdvertisementAreaView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.advertisementAreaName = nil
end


function AdvertisementAreaView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), AdvertisementAreaView)
    self:_init_fields()
        -- super(...) made self above
        self.advertisementAreaName = self:getPropertiesHashMap():get(AdvertisementAreaData.getInstance().NAME)
    return self
end


-- throws Exception
function AdvertisementAreaView:toXmlNode(document)
        local try_ok, try_error = pcall(function()
            local advertisementAreasEntityInterface = AdvertisementAreasEntityFactory.getInstance()
            local advertisementAreaInterface = advertisementAreasEntityInterface:get(self:getTransformInfoInterface():getStoreName(), self.advertisementAreaName)
            return nil
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().XSLLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "toXmlNode", e)
            end
            error(e, 0)
        end
end


function AdvertisementAreaView:addDomNodeInterfaces()
        self:addDomNodeInterface(self)
end


-- throws Exception
function AdvertisementAreaView:view()
        local try_ok, try_error = pcall(function()
            self:addDomNodeInterfaces()
            return HttpStoreComponentView.view(self)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end

return AdvertisementAreaView

