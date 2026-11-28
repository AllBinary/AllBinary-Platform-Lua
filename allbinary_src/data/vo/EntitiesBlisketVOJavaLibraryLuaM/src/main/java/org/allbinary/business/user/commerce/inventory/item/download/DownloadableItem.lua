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

local DownloadableItem = {}
package.loaded["org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem"] = DownloadableItem

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
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local BasicItemData = java_lazy("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local ProductIdGenerator = java_lazy("org.allbinary.data.generator.ProductIdGenerator")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local TimeUtil = java_lazy("org.allbinary.time.TimeUtil")
local DownloadItemData = java_lazy("org.allbinary.business.user.commerce.inventory.item.download.DownloadItemData")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_class_matches(class, name)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table DownloadableItem is declared before the requires
DownloadableItem.__index = DownloadableItem
DownloadableItem.className = "DownloadableItem"
DownloadableItem.javaClassName = "org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem"

function DownloadableItem:_init_fields()
    if self.id == nil then self.id = nil end
    if self.basicItemId == nil then self.basicItemId = nil end
    if self.enabled == nil then self.enabled = nil end
    if self.system == nil then self.system = nil end
    if self.platform == nil then self.platform = nil end
    if self.specialName == nil then self.specialName = nil end
    if self.version == nil then self.version = nil end
    if self.changes == nil then self.changes = nil end
    if self.licenseFile == nil then self.licenseFile = nil end
    if self.file == nil then self.file = nil end
    if self.size_f == nil then self.size_f = nil end
    if self.validTime == nil then self.validTime = nil end
    if self.retries == nil then self.retries = nil end
end

function DownloadableItem._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return DownloadableItem._new1(self, ...)
    end
    error("No constructor of DownloadableItem takes " .. count .. " arguments")
end

function DownloadableItem.new(...)
    local self = setmetatable({}, DownloadableItem)
    DownloadableItem._jinit(self, ...)
    return self
end

function DownloadableItem._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or type(java_a1) == "string") then return DownloadableItem._new1_1(self, ...) end
    return DownloadableItem._new1_2(self, ...)
end


function DownloadableItem._new1_1(self, id)
    DownloadableItem._init_fields(self)
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
        self.size_f = tostring(0)
        self.validTime = tostring(0)
        self.retries = EMPTY_STRING
    return self
end


function DownloadableItem._new1_2(self, hashMap)
    DownloadableItem._init_fields(self)
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
        if not (StringValidationUtil.getInstance():isEmpty(value)) then
            self.size_f = tostring(value)
        else
            self.size_f = 0
        end
        local validTime = hashMap:get(DownloadItemData.VALID_TIME)
        if not (StringValidationUtil.getInstance():isEmpty(validTime)) then
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
        return self.size_f
end


function DownloadableItem:getValidTime()
        return self.validTime
end


function DownloadableItem:getRetries()
        return self.retries
end

return DownloadableItem

