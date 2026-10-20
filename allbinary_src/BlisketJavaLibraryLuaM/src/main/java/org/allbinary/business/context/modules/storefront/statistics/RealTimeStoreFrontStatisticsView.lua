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

local StoreFrontAdvertisementsStatisticsInterface = require("org.allbinary.business.context.modules.storefront.statistics.advertisements.StoreFrontAdvertisementsStatisticsInterface")
local StoreFrontAdvertisementsStatisticsView = require("org.allbinary.business.context.modules.storefront.statistics.advertisements.StoreFrontAdvertisementsStatisticsView")
local StoreFrontInventoryStatisticsInterface = require("org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatisticsInterface")
local StoreFrontInventoryStatisticsView = require("org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatisticsView")
local StoreFrontOrdersHistoryStatisticsInterface = require("org.allbinary.business.context.modules.storefront.statistics.orders.history.StoreFrontOrdersHistoryStatisticsInterface")
local StoreFrontOrdersHistoryStatisticsView = require("org.allbinary.business.context.modules.storefront.statistics.orders.history.StoreFrontOrdersHistoryStatisticsView")
local StoreFrontUsersStatisticsInterface = require("org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatisticsInterface")
local StoreFrontUsersStatisticsView = require("org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatisticsView")
local UserRole = require("org.allbinary.business.user.role.UserRole")
local UserRoleFactory = require("org.allbinary.business.user.role.UserRoleFactory")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
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

local RealTimeStoreFrontStatisticsView = {}
RealTimeStoreFrontStatisticsView.__index = RealTimeStoreFrontStatisticsView
RealTimeStoreFrontStatisticsView.className = "RealTimeStoreFrontStatisticsView"

function RealTimeStoreFrontStatisticsView:_init_fields()
    self.storeFrontStatisticsInterface = nil
    self.userRole = nil
end


function RealTimeStoreFrontStatisticsView.new(storeFrontStatisticsInterface, userRole)
    local self = setmetatable({}, RealTimeStoreFrontStatisticsView)
    self:_init_fields()
        self.storeFrontStatisticsInterface = storeFrontStatisticsInterface
        self.userRole = userRole
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

