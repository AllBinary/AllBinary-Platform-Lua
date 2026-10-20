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
-- package org.allbinary.business.entry


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local EntryData = {}
EntryData.__index = EntryData
EntryData.className = "EntryData"

function EntryData:_init_fields()
    self.ID = "ENTRY_ID"
    self.ENCRYPTION = "ENTRY_ENCRYPTION"
    self.TIMECREATED = "ENTRY_TIMECREATED"
    self.LASTMODIFIED = "ENTRY_LASTMODIFIED"
    self.DEFAULT = "ENTRY_DEFAULT"
    self.SPECIAL = "ENTRY_SPECIAL"
    self.ENABLE = "ENTRY_ENABLE"
    self.YES = "Yes"
    self.NO = "No"
end


function EntryData.getInstance()
        return EntryData.instance
end


function EntryData.new()
    local self = setmetatable({}, EntryData)
    self:_init_fields()
    return self
end

EntryData.instance = EntryData.new()

return EntryData

