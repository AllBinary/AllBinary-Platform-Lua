-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.game.configuration.persistance

-- local RecordFilter = require("javax.microedition.rms.RecordFilter")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullRecordFilter = {}
NullRecordFilter.__index = NullRecordFilter
NullRecordFilter.className = "NullRecordFilter"

function NullRecordFilter.new()
    local self = setmetatable({}, NullRecordFilter)
    return self
end


function NullRecordFilter:matches(candidate)
        return true
end

NullRecordFilter.NULL_RECORD_FILTER = NullRecordFilter.new()

return NullRecordFilter

