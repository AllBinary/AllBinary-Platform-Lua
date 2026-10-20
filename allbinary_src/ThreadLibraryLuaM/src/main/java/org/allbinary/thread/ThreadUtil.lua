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
-- package org.allbinary.thread

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ThreadUtil = {}
ThreadUtil.__index = ThreadUtil
ThreadUtil.className = "ThreadUtil"

function ThreadUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.JOIN = "join"
end

function ThreadUtil.new()
    local self = setmetatable({}, ThreadUtil)
    self:_init_fields()
    return self
end


function ThreadUtil.getInstance()
        return ThreadUtil.instance
end


function ThreadUtil:isRunning(thread)
        if thread ~= nil and thread:isAlive() then
            return true
        else
            return false
        end
end


-- throws Exception
function ThreadUtil:join(thread)
        if ThreadUtil.getInstance():isRunning(thread) then
            self.logUtil:putF("Waiting for Thread To Join/End", self, self.JOIN)
            thread:join()
        end
end

ThreadUtil.instance = ThreadUtil.new()

return ThreadUtil

