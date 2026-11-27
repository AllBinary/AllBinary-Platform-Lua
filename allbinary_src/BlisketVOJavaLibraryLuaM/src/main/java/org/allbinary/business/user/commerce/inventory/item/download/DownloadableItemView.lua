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

local DownloadableItemView = {}
package.loaded["org.allbinary.business.user.commerce.inventory.item.download.DownloadableItemView"] = DownloadableItemView

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

local Calendar = java_lazy("java.util.Calendar")
local HashMap = java_lazy("java.util.HashMap")
-- local Set = require("java.util.Set")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local DownloadItemData = java_lazy("org.allbinary.business.user.commerce.inventory.item.download.DownloadItemData")
local DownloadableItem = java_lazy("org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem")

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

-- class table DownloadableItemView is declared before the requires
DownloadableItemView.__index = DownloadableItemView
DownloadableItemView.className = "DownloadableItemView"
DownloadableItemView.javaClassName = "org.allbinary.business.user.commerce.inventory.item.download.DownloadableItemView"
DownloadableItemView.java_implements = " DomNodeInterface "
DownloadableItemView.java_interfaces = function() return {DomNodeInterface} end

function DownloadableItemView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.downloadableItem == nil then self.downloadableItem = nil end
end


function DownloadableItemView._jinit(self, downloadableItem)
    DownloadableItemView._init_fields(self)
        self.downloadableItem = downloadableItem
    return self
end

function DownloadableItemView.new(...)
    local self = setmetatable({}, DownloadableItemView)
    DownloadableItemView._jinit(self, ...)
    return self
end


-- throws Exception
function DownloadableItemView:toXmlNode(document)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRODUCTSEARCHLOGGING) then
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

