-- Generated Code Do Not Modify
-- package org.allbinary.thread

local TsUtil = require("org.allbinary.TsUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ThreadObjectUtil = {}
ThreadObjectUtil.__index = ThreadObjectUtil
ThreadObjectUtil.className = "ThreadObjectUtil"

function ThreadObjectUtil:_init_fields()
    self.NULL_PRIORITY_RUNNABLE = NullPriorityRunnable.new()
end

function ThreadObjectUtil.new()
    local self = setmetatable({}, ThreadObjectUtil)
    self:_init_fields()
    return self
end


function ThreadObjectUtil.getInstance()
        return ThreadObjectUtil.instance
end


function ThreadObjectUtil:notifyObject(anyType)
        anyType:notify()
end


-- throws Exception
function ThreadObjectUtil:waitObject(anyType)
        anyType:wait()
end


-- throws Exception
function ThreadObjectUtil:waitObjectFor(anyType, delay)
        TsUtil.getInstance():waitFor(anyType, delay)
end


function ThreadObjectUtil:processThread(runnable)
        local thread = Thread.new(runnable)
        thread:start()
end

ThreadObjectUtil.instance = ThreadObjectUtil.new()

return ThreadObjectUtil

