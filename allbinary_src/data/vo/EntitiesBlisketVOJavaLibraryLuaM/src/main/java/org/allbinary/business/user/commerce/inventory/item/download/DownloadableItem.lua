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
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local EntryData = require("org.allbinary.business.entry.EntryData")
local BasicItemData = require("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local ProductIdGenerator = require("org.allbinary.data.generator.ProductIdGenerator")
local StdUtil = require("org.allbinary.logic.StdUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local TimeUtil = require("org.allbinary.time.TimeUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DownloadableItem = {}
DownloadableItem.__index = DownloadableItem
DownloadableItem.className = "DownloadableItem"

function DownloadableItem:_init_fields()
    self.id = nil
    self.basicItemId = nil
    self.enabled = nil
    self.system = nil
    self.platform = nil
    self.specialName = nil
    self.version = nil
    self.changes = nil
    self.licenseFile = nil
    self.file = nil
    self.size = nil
    self.validTime = nil
    self.retries = nil
end

function DownloadableItem.new(...)
    local count = select("#", ...)
    if count == 1 then return DownloadableItem._new1(...)
    elseif count == 1 then return DownloadableItem._new1(...)
    end
end


function DownloadableItem._new1(id)
    local self = setmetatable({}, DownloadableItem)
    self:_init_fields()
        local EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
        self.id = ProductIdGenerator.new():getNext()
        self.basicItemId = id
        self.enabled = EntryData.getInstance().YES
        self.system = "Java"
        self.platform = "Android"
        self.specialName = EMPTY_STRING
        self.version = EMPTY_STRING
        self.changes = EMPTY_STRING
        self.licenseFile = EMPTY_STRING
        self.file = EMPTY_STRING
        self.size = tostring(0)
        self.validTime = tostring(0)
        self.retries = EMPTY_STRING
    return self
end


function DownloadableItem._new1(hashMap)
    local self = setmetatable({}, DownloadableItem)
    self:_init_fields()
        self.id = hashMap:get(DownloadItemData.ID)
        self.basicItemId = hashMap:get(BasicItemData.getInstance().ID)
        self.enabled = hashMap:get(EntryData.getInstance().ENABLE)
        self.system = hashMap:get(DownloadItemData.SYSTEM)
        self.platform = hashMap:get(DownloadItemData.PLATFORM)
        self.specialName = hashMap:get(DownloadItemData.SPECIAL_NAME)
        self.version = hashMap:get(DownloadItemData.VERSION)
        self.changes = hashMap:get(DownloadItemData.CHANGES)
        self.licenseFile = hashMap:get(DownloadItemData.LICENSE_FILE)
        self.file = hashMap:get(DownloadItemData.FILE)
        local value = hashMap:get(DownloadItemData.SIZE)
        if not StringValidationUtil.getInstance():isEmpty(value) then
            self.size = tostring(value)
        else
            self.size = 0
        end
        local validTime = hashMap:get(DownloadItemData.VALID_TIME)
        if not StringValidationUtil.getInstance():isEmpty(validTime) then
            self.validTime = tostring(validTime)
        else
            local totalYears = hashMap:get(DownloadItemData.VALID_TIME_YEARS)
            local totalMonths = hashMap:get(DownloadItemData.VALID_TIME_MONTHS)
            local totalDays = hashMap:get(DownloadItemData.VALID_TIME_DAYS)
            local totalHours = hashMap:get(DownloadItemData.VALID_TIME_HOURS)
            local totalMinutes = hashMap:get(DownloadItemData.VALID_TIME_MINUTES)
            local totalSeconds = hashMap:get(DownloadItemData.VALID_TIME_SECONDS)
            local totalTime = TimeUtil.getInstance():getTotalTime(totalYears, totalMonths, totalDays, totalHours, totalMinutes, totalSeconds)
            self.validTime = totalTime
        end
        self.retries = hashMap:get(DownloadItemData.RETRIES)
    return self
end


function DownloadableItem:toVector()
        local calendar = Calendar.getInstance()
        local time = tostring(calendar:getTimeInMillis())
        local values = BasicArrayListD.new()
        values:add(self:getId())
        values:add(self.basicItemId)
        values:add(self.enabled)
        values:add(self:getSpecialName())
        values:add(self:getVersion())
        values:add(self:getChanges())
        values:add(self:getSystem())
        values:add(self:getPlatform())
        values:add(self:getLicenseFile())
        values:add(self:getFile())
        values:add(tostring(self:getSize()))
        values:add(tostring(self:getValidTime()))
        values:add(self:getRetries())
        values:add(time)
        values:add(time)
        return values
end


function DownloadableItem:toHashMap()
        local values = StdUtil.getInstance():createHashMap()
        values:put(DownloadItemData.ID, self:getId())
        values:put(BasicItemData.getInstance().ID, self.basicItemId)
        values:put(EntryData.getInstance().ENABLE, self.enabled)
        values:put(DownloadItemData.SYSTEM, self:getSystem())
        values:put(DownloadItemData.PLATFORM, self:getPlatform())
        values:put(DownloadItemData.SPECIAL_NAME, self:getSpecialName())
        values:put(DownloadItemData.VERSION, self:getVersion())
        values:put(DownloadItemData.CHANGES, self:getChanges())
        values:put(DownloadItemData.LICENSE_FILE, self:getLicenseFile())
        values:put(DownloadItemData.FILE, self:getFile())
        values:put(DownloadItemData.SIZE, tostring(self:getSize()))
        values:put(DownloadItemData.VALID_TIME, tostring(self:getValidTime()))
        values:put(DownloadItemData.RETRIES, self:getRetries())
        local calendar = Calendar.getInstance()
        local time = tostring(tostring(calendar:getTimeInMillis()))
        values:put(EntryData.getInstance().LASTMODIFIED, time)
        return values
end


function DownloadableItem:getId()
        return self.id
end


function DownloadableItem:getSystem()
        return self.system
end


function DownloadableItem:getPlatform()
        return self.platform
end


function DownloadableItem:getSpecialName()
        return self.specialName
end


function DownloadableItem:getVersion()
        return self.version
end


function DownloadableItem:getChanges()
        return self.changes
end


function DownloadableItem:getLicenseFile()
        return self.licenseFile
end


function DownloadableItem:getFile()
        return self.file
end


function DownloadableItem:getSize()
        return self.size
end


function DownloadableItem:getValidTime()
        return self.validTime
end


function DownloadableItem:getRetries()
        return self.retries
end

return DownloadableItem

