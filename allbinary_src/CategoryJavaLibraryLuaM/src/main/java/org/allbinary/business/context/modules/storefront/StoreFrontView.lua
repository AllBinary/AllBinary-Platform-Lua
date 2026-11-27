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

local StoreFrontView = {}
package.loaded["org.allbinary.business.context.modules.storefront.StoreFrontView"] = StoreFrontView

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
local BasketData = java_lazy("org.allbinary.business.user.commerce.inventory.basket.BasketData")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")

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

-- class table StoreFrontView is declared before the requires
StoreFrontView.__index = StoreFrontView
StoreFrontView.className = "StoreFrontView"
StoreFrontView.javaClassName = "org.allbinary.business.context.modules.storefront.StoreFrontView"
StoreFrontView.java_implements = " DomNodeInterface "
StoreFrontView.java_interfaces = function() return {DomNodeInterface} end

function StoreFrontView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.storeFrontInterface == nil then self.storeFrontInterface = nil end
end


function StoreFrontView._jinit(self, storeFrontInterface)
    StoreFrontView._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF("Constructing: StoreFrontView for: " .. storeFrontInterface:getName(), self, commonStrings.GET_INSTANCE)
        end
        self.storeFrontInterface = storeFrontInterface
    return self
end

function StoreFrontView.new(...)
    local self = setmetatable({}, StoreFrontView)
    StoreFrontView._jinit(self, ...)
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

