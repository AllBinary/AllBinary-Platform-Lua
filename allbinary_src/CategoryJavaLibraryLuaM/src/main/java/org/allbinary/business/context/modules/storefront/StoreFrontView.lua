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
-- package org.allbinary.business.context.modules.storefront

-- local HashMap = require("java.util.HashMap")
local BasketData = require("org.allbinary.business.user.commerce.inventory.basket.BasketData")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
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

local StoreFrontView = {}
StoreFrontView.__index = StoreFrontView
StoreFrontView.className = "StoreFrontView"

function StoreFrontView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.storeFrontInterface = nil
end


function StoreFrontView.new(storeFrontInterface)
    local self = setmetatable({}, StoreFrontView)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF("Constructing: StoreFrontView for: " .. storeFrontInterface:getName(), self, commonStrings.GET_INSTANCE)
        end
        self.storeFrontInterface = storeFrontInterface
    return self
end


-- throws Exception
function StoreFrontView:toXmlNode(document)
        local hashMap = self.storeFrontInterface:toHashMap()
        local storeFrontData = StoreFrontData.getInstance()
        hashMap:put(storeFrontData.CURRENTHOMEHOSTNAME, self.storeFrontInterface:getCurrentHomeHostName())
        hashMap:put(storeFrontData.CURRENTHOMEHOSTNAMEPATH, self.storeFrontInterface:getCurrentHomeHostNamePath())
        hashMap:put(storeFrontData.CURRENTHOSTNAME, self.storeFrontInterface:getCurrentHostName())
        hashMap:put(storeFrontData.CURRENTHOSTNAMEPATH, self.storeFrontInterface:getCurrentHostNamePath())
        hashMap:put(BasketData.NAME, self.storeFrontInterface:getBasketName())
        local node = ModDomHelper.createNameValueNodes(document, storeFrontData.NAME, hashMap)
        return node
end

return StoreFrontView

