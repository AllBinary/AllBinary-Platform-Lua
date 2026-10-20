-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.thread


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ThreadPoolStrings = {}
ThreadPoolStrings.__index = ThreadPoolStrings
ThreadPoolStrings.className = "ThreadPoolStrings"

function ThreadPoolStrings:_init_fields()
    self.ADD_TASK = "addTask"
    self.START_TASK = "Started Task: "
    self.COMPLETE_TASK = "Completed Task: "
end

function ThreadPoolStrings.new()
    local self = setmetatable({}, ThreadPoolStrings)
    self:_init_fields()
    return self
end


function ThreadPoolStrings.getInstance()
        return ThreadPoolStrings.instance
end

ThreadPoolStrings.instance = ThreadPoolStrings.new()

return ThreadPoolStrings

