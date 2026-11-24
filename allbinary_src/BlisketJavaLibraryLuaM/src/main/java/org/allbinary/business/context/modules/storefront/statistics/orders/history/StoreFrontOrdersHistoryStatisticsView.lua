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
-- package org.allbinary.business.context.modules.storefront.statistics.orders.history

local StoreFrontOrdersHistoryStatisticsView = {}
package.loaded["org.allbinary.business.context.modules.storefront.statistics.orders.history.StoreFrontOrdersHistoryStatisticsView"] = StoreFrontOrdersHistoryStatisticsView

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
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")

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

-- class table StoreFrontOrdersHistoryStatisticsView is declared before the requires
StoreFrontOrdersHistoryStatisticsView.__index = StoreFrontOrdersHistoryStatisticsView
StoreFrontOrdersHistoryStatisticsView.className = "StoreFrontOrdersHistoryStatisticsView"
StoreFrontOrdersHistoryStatisticsView.javaClassName = "org.allbinary.business.context.modules.storefront.statistics.orders.history.StoreFrontOrdersHistoryStatisticsView"
StoreFrontOrdersHistoryStatisticsView.java_implements = " DomNodeInterface "
StoreFrontOrdersHistoryStatisticsView.java_interfaces = function() return {DomNodeInterface} end

function StoreFrontOrdersHistoryStatisticsView:_init_fields()
    if self.storeFrontOrdersHistoryStatisticsInterface == nil then self.storeFrontOrdersHistoryStatisticsInterface = nil end
end


function StoreFrontOrdersHistoryStatisticsView._jinit(self, storeFrontOrdersHistoryStatisticsInterface)
    StoreFrontOrdersHistoryStatisticsView._init_fields(self)
        self.storeFrontOrdersHistoryStatisticsInterface = storeFrontOrdersHistoryStatisticsInterface
    return self
end

function StoreFrontOrdersHistoryStatisticsView.new(...)
    local self = setmetatable({}, StoreFrontOrdersHistoryStatisticsView)
    StoreFrontOrdersHistoryStatisticsView._jinit(self, ...)
    return self
end


-- throws Exception
function StoreFrontOrdersHistoryStatisticsView:toXmlNode(document)
        local hashMap = self.storeFrontOrdersHistoryStatisticsInterface:toHashMap()
        local node = ModDomHelper.createNameValueNodes(document, StoreFrontOrdersHistoryStatisticsData.getInstance().NAME, hashMap)
        return node
end

return StoreFrontOrdersHistoryStatisticsView

