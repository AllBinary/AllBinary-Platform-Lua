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
-- package org.allbinary.business.context.modules.storefront.statistics

local RealTimeStoreFrontStatisticsView = {}
package.loaded["org.allbinary.business.context.modules.storefront.statistics.RealTimeStoreFrontStatisticsView"] = RealTimeStoreFrontStatisticsView

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

local StoreFrontAdvertisementsStatisticsInterface = java_lazy("org.allbinary.business.context.modules.storefront.statistics.advertisements.StoreFrontAdvertisementsStatisticsInterface")
local StoreFrontAdvertisementsStatisticsView = java_lazy("org.allbinary.business.context.modules.storefront.statistics.advertisements.StoreFrontAdvertisementsStatisticsView")
local StoreFrontInventoryStatisticsInterface = java_lazy("org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatisticsInterface")
local StoreFrontInventoryStatisticsView = java_lazy("org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatisticsView")
local StoreFrontOrdersHistoryStatisticsInterface = java_lazy("org.allbinary.business.context.modules.storefront.statistics.orders.history.StoreFrontOrdersHistoryStatisticsInterface")
local StoreFrontOrdersHistoryStatisticsView = java_lazy("org.allbinary.business.context.modules.storefront.statistics.orders.history.StoreFrontOrdersHistoryStatisticsView")
local StoreFrontUsersStatisticsInterface = java_lazy("org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatisticsInterface")
local StoreFrontUsersStatisticsView = java_lazy("org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatisticsView")
local UserRole = java_lazy("org.allbinary.business.user.role.UserRole")
local UserRoleFactory = java_lazy("org.allbinary.business.user.role.UserRoleFactory")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local StoreFrontStatisticsInterface = java_lazy("org.allbinary.business.context.modules.storefront.statistics.StoreFrontStatisticsInterface")

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

-- class table RealTimeStoreFrontStatisticsView is declared before the requires
RealTimeStoreFrontStatisticsView.__index = RealTimeStoreFrontStatisticsView
RealTimeStoreFrontStatisticsView.className = "RealTimeStoreFrontStatisticsView"
RealTimeStoreFrontStatisticsView.javaClassName = "org.allbinary.business.context.modules.storefront.statistics.RealTimeStoreFrontStatisticsView"
RealTimeStoreFrontStatisticsView.java_implements = " DomNodeInterface "
RealTimeStoreFrontStatisticsView.java_interfaces = function() return {DomNodeInterface} end

function RealTimeStoreFrontStatisticsView:_init_fields()
    if self.storeFrontStatisticsInterface == nil then self.storeFrontStatisticsInterface = nil end
    if self.userRole == nil then self.userRole = nil end
end


function RealTimeStoreFrontStatisticsView._jinit(self, storeFrontStatisticsInterface, userRole)
    RealTimeStoreFrontStatisticsView._init_fields(self)
        self.storeFrontStatisticsInterface = storeFrontStatisticsInterface
        self.userRole = userRole
    return self
end

function RealTimeStoreFrontStatisticsView.new(...)
    local self = setmetatable({}, RealTimeStoreFrontStatisticsView)
    RealTimeStoreFrontStatisticsView._jinit(self, ...)
    return self
end


-- throws Exception
function RealTimeStoreFrontStatisticsView:toXmlNode(document)
        local node = document:createElement(StoreFrontStatisticsData.getInstance().NAME)
        local storeFrontAdvertisementsStatisticsInterface = self.storeFrontStatisticsInterface:getAdvertisements()
        local storeFrontAdvertisementsStatisticsDomNodeInterface = StoreFrontAdvertisementsStatisticsView.new(storeFrontAdvertisementsStatisticsInterface)
        node:appendChild(storeFrontAdvertisementsStatisticsDomNodeInterface:toXmlNode(document))
        local storeFrontInventoryStatisticsInterface = self.storeFrontStatisticsInterface:getInventory()
        local storeFrontInventoryStatisticsDomNodeInterface = StoreFrontInventoryStatisticsView.new(storeFrontInventoryStatisticsInterface)
        node:appendChild(storeFrontInventoryStatisticsDomNodeInterface:toXmlNode(document))
        local storeFrontOrdersHistoryStatisticsInterface = self.storeFrontStatisticsInterface:getOrders()
        local storeFrontOrdersHistoryStatisticsDomNodeInterface = StoreFrontOrdersHistoryStatisticsView.new(storeFrontOrdersHistoryStatisticsInterface)
        node:appendChild(storeFrontOrdersHistoryStatisticsDomNodeInterface:toXmlNode(document))
        if self.userRole == UserRoleFactory.getInstance().ADMINISTRATOR then
            local storeFrontUsersStatisticsInterface = self.storeFrontStatisticsInterface:getUsers()
            local storeFrontUsersStatisticsDomNodeInterface = StoreFrontUsersStatisticsView.new(storeFrontUsersStatisticsInterface)
            node:appendChild(storeFrontUsersStatisticsDomNodeInterface:toXmlNode(document))
        end
        return node
end

return RealTimeStoreFrontStatisticsView

