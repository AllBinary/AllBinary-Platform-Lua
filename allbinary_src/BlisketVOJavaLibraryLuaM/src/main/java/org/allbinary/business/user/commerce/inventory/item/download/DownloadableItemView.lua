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
-- package org.allbinary.business.user.commerce.inventory.item.download

-- local Calendar = require("java.util.Calendar")
-- local HashMap = require("java.util.HashMap")
-- local Set = require("java.util.Set")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
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

local DownloadableItemView = {}
DownloadableItemView.__index = DownloadableItemView
DownloadableItemView.className = "DownloadableItemView"

function DownloadableItemView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.downloadableItem = nil
end


function DownloadableItemView.new(downloadableItem)
    local self = setmetatable({}, DownloadableItemView)
    self:_init_fields()
        self.downloadableItem = downloadableItem
    return self
end


-- throws Exception
function DownloadableItemView:toXmlNode(document)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PRODUCTSEARCHLOGGING) then
            self.logUtil:putF(self.commonStrings.START, self, "toXmlNode")
        end
        local hashMap = self.downloadableItem:toHashMap()
        local totalTime = math.tointeger(self.downloadableItem:getValidTime() // 1)
        local calendar = Calendar.getInstance()
        local year = calendar:get(Calendar.YEAR)
        local month = calendar:get(Calendar.MONTH)
        local day = calendar:get(Calendar.DAY_OF_MONTH)
        local hour = calendar:get(Calendar.HOUR)
        local minute = calendar:get(Calendar.MINUTE)
        local second = calendar:get(Calendar.SECOND)
        calendar:setTimeInMillis(calendar:getTimeInMillis() + totalTime)
        local yearDelta = calendar:get(Calendar.YEAR)
        local monthDelta = calendar:get(Calendar.MONTH)
        local dayDelta = calendar:get(Calendar.DAY_OF_MONTH)
        local hourDelta = calendar:get(Calendar.HOUR)
        local minuteDelta = calendar:get(Calendar.MINUTE)
        local secondDelta = calendar:get(Calendar.SECOND)
        hashMap:put(DownloadItemData.VALID_TIME_YEARS, tostring(yearDelta - year))
        hashMap:put(DownloadItemData.VALID_TIME_MONTHS, tostring(monthDelta - month))
        hashMap:put(DownloadItemData.VALID_TIME_DAYS, tostring(dayDelta - day))
        hashMap:put(DownloadItemData.VALID_TIME_HOURS, tostring(hourDelta - hour))
        hashMap:put(DownloadItemData.VALID_TIME_MINUTES, tostring(minuteDelta - minute))
        hashMap:put(DownloadItemData.VALID_TIME_SECONDS, tostring(secondDelta - second))
        local keySet = hashMap:keySet()
        local node = document:createElement(DownloadItemData.NAME)
        local stringUtil = StringUtil.getInstance()
        local nameArray = keySet:toArray()
        local size = (nameArray.n or #nameArray)
        for index = 0, size - 1 do
            local name = nameArray[index + 1]
            local value = hashMap:get(name)
            value = stringUtil:getNonNull(value)
            node:appendChild(ModDomHelper.createNameValueNodes(document, name, value))
        end
        return node
end


function DownloadableItemView:toXmlDoc()
        return nil
end


function DownloadableItemView:view()
        return nil
end

return DownloadableItemView

