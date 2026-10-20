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
-- package org.allbinary.logic.util.queue

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicQueue = {}
BasicQueue.__index = BasicQueue
BasicQueue.className = "BasicQueue"

function BasicQueue:_init_fields()
    self.queueVector = BasicArrayListD.new()
end


function BasicQueue.new()
    local self = setmetatable({}, BasicQueue)
    self:_init_fields()
    return self
end


-- throws Exception
function BasicQueue:offer(anyType)
        self.queueVector:add(anyType)
        return true
end


function BasicQueue:remove(anyType)
        self.queueVector:remove(anyType)
end


function BasicQueue:removeLast()
        local anyType = self.queueVector:get(self.queueVector:size() - 1)
        self.queueVector:remove(anyType)
        return anyType
end

return BasicQueue

