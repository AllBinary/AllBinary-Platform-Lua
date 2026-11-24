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

local DownloadItemData = {}
package.loaded["org.allbinary.business.user.commerce.inventory.item.download.DownloadItemData"] = DownloadItemData

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

-- class table DownloadItemData is declared before the requires
DownloadItemData.__index = DownloadItemData
DownloadItemData.className = "DownloadItemData"
DownloadItemData.javaClassName = "org.allbinary.business.user.commerce.inventory.item.download.DownloadItemData"

function DownloadItemData._jinit(self)
    return self
end

function DownloadItemData.new()
    return DownloadItemData._jinit(setmetatable({}, DownloadItemData))
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

