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

local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ThreadPool = require("org.allbinary.thread.ThreadPool")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--This is mainly for network communications.
local ImageThreadPool = {}
ImageThreadPool.__index = ImageThreadPool
ImageThreadPool.className = "ImageThreadPool"
setmetatable(ImageThreadPool, {__index = ThreadPool})

function ImageThreadPool:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function ImageThreadPool.getInstance()
        return ImageThreadPool.instance
end


function ImageThreadPool.new(poolName, numThreads, priority)
    local self = setmetatable(ThreadPool.new(poolName, numThreads, priority), ImageThreadPool)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function ImageThreadPool:runTask(task)
        ThreadPool.runTask(self, task)
end


function ImageThreadPool:startTask(task)
end


function ImageThreadPool:completedTask(task)
end

ImageThreadPool.instance = ImageThreadPool.new("ImageLoader", 1, ThreadPool.NORMAL_PRIORITY)

return ImageThreadPool

