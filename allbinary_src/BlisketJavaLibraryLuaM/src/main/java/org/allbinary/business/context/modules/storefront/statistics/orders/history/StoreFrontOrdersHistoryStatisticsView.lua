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

-- local HashMap = require("java.util.HashMap")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
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

local StoreFrontOrdersHistoryStatisticsView = {}
StoreFrontOrdersHistoryStatisticsView.__index = StoreFrontOrdersHistoryStatisticsView
StoreFrontOrdersHistoryStatisticsView.className = "StoreFrontOrdersHistoryStatisticsView"

function StoreFrontOrdersHistoryStatisticsView:_init_fields()
    self.storeFrontOrdersHistoryStatisticsInterface = nil
end


function StoreFrontOrdersHistoryStatisticsView.new(storeFrontOrdersHistoryStatisticsInterface)
    local self = setmetatable({}, StoreFrontOrdersHistoryStatisticsView)
    self:_init_fields()
        self.storeFrontOrdersHistoryStatisticsInterface = storeFrontOrdersHistoryStatisticsInterface
    return self
end


-- throws Exception
function StoreFrontOrdersHistoryStatisticsView:toXmlNode(document)
        local hashMap = self.storeFrontOrdersHistoryStatisticsInterface:toHashMap()
        local node = ModDomHelper.createNameValueNodes(document, StoreFrontOrdersHistoryStatisticsData.getInstance().NAME, hashMap)
        return node
end

return StoreFrontOrdersHistoryStatisticsView

