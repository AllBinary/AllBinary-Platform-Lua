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
-- package org.allbinary.logic.communication.log

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LogBuffer = {}
LogBuffer.__index = LogBuffer
LogBuffer.className = "LogBuffer"

function LogBuffer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.logEntryVector = nil
end


function LogBuffer.new()
    local self = setmetatable({}, LogBuffer)
    self:_init_fields()
        self.logEntryVector = BasicArrayListD.new()
    return self
end


function LogBuffer:add(log)
        self.logEntryVector:add(log)
end


function LogBuffer:logAll()
        local size = self.logEntryVector:size()
        for index = 0, size - 1 do
            local log = self.logEntryVector:get(index)
            self.logUtil:putL(log)
        end
end

return LogBuffer

