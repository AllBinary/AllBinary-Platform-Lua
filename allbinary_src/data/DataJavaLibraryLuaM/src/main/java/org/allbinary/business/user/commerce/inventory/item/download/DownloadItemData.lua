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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DownloadItemData = {}
DownloadItemData.__index = DownloadItemData
DownloadItemData.className = "DownloadItemData"

function DownloadItemData.new()
    local self = setmetatable({}, DownloadItemData)
    return self
end

DownloadItemData.NAME = "DOWNLOADITEM_NAME"
DownloadItemData.ID = "DOWNLOADITEM_ID"
DownloadItemData.SYSTEM = "DOWNLOADITEM_SYSTEM"
DownloadItemData.PLATFORM = "DOWNLOADITEM_PLATFORM"
DownloadItemData.SPECIAL_NAME = "DOWNLOADITEM_SPECIAL_NAME"
DownloadItemData.VERSION = "DOWNLOADITEM_VERSION"
DownloadItemData.CHANGES = "DOWNLOADITEM_CHANGES"
DownloadItemData.LICENSE_FILE = "DOWNLOADITEM_LICENSE_FILE"
DownloadItemData.FILE = "DOWNLOADITEM_FILE"
DownloadItemData.EXTRA_FILES = "DOWNLOADITEM_EXTRA_FILES"
DownloadItemData.SIZE = "DOWNLOADITEM_SIZE"
DownloadItemData.VALID_TIME = "DOWNLOADITEM_VALID_TIME"
DownloadItemData.VALID_TIME_YEARS = "DOWNLOADITEM_VALID_TIME_YEAR"
DownloadItemData.VALID_TIME_MONTHS = "DOWNLOADITEM_VALID_TIME_MONTH"
DownloadItemData.VALID_TIME_DAYS = "DOWNLOADITEM_VALID_TIME_DAY"
DownloadItemData.VALID_TIME_HOURS = "DOWNLOADITEM_VALID_TIME_HOUR"
DownloadItemData.VALID_TIME_MINUTES = "DOWNLOADITEM_VALID_TIME_MINUTES"
DownloadItemData.VALID_TIME_SECONDS = "DOWNLOADITEM_VALID_TIME_SECONDS"
DownloadItemData.RETRIES = "DOWNLOADITEM_RETRIES"

return DownloadItemData

