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

local J2MEUtil = require("org.allbinary.J2MEUtil")
local RunnableCanvas = require("org.allbinary.canvas.RunnableCanvas")
local AllBinaryGameCanvas = require("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local DemoCanvas = require("org.allbinary.game.displayable.canvas.DemoCanvas")
local GameCanvasRunnableInterface = require("org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface")
local RunnableCanvasSingleThreadStartRunnable = require("org.allbinary.game.displayable.canvas.RunnableCanvasSingleThreadStartRunnable")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ThreadFactoryUtil = {}
ThreadFactoryUtil.__index = ThreadFactoryUtil
ThreadFactoryUtil.className = "ThreadFactoryUtil"

function ThreadFactoryUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function ThreadFactoryUtil.new()
    local self = setmetatable({}, ThreadFactoryUtil)
    self:_init_fields()
    return self
end


function ThreadFactoryUtil.getInstance()
        return ThreadFactoryUtil.instance
end


function ThreadFactoryUtil:getInstanceGameCanvasRunnable(runnable)
        return self:getInstanceType(runnable, runnable:getType())
end


function ThreadFactoryUtil:getInstanceForRunnable(runnable)
        return self:getInstanceType(runnable, runnable:getType())
end


function ThreadFactoryUtil:getInstanceType(runnable, type)
        local commonStrings = CommonStrings.getInstance()
        if J2MEUtil.isHTML() then
            if type == DemoCanvas.TYPE or type == AllBinaryGameCanvas.TYPE then
                local demoGameSingleThreadStartRunnable = RunnableCanvasSingleThreadStartRunnable.new(runnable)
                PreLogUtil.put(tostring(StringMaker.new():append("Using Pseudo Thread for DemoCanvas/AllBinaryGameCanvas under PlayN/HTML5: "):append(StringUtil.getInstance():toString(runnable))), self, commonStrings.CONSTRUCTOR)
                local primaryThreadPool = PrimaryThreadPool.getInstance()
                primaryThreadPool:runTask(demoGameSingleThreadStartRunnable)
            else
                PreLogUtil.put(tostring(StringMaker.new():append("Using Pseudo Thread for Runnable under PlayN/HTML5: "):append(StringUtil.getInstance():toString(runnable))), self, commonStrings.CONSTRUCTOR)
                local primaryThreadPool = PrimaryThreadPool.getInstance()
                primaryThreadPool:runTask(runnable)
            end
        end
        local thread = Thread.new(runnable, tostring(runnable))
        self.logUtil:putF(tostring(thread), self, commonStrings.CONSTRUCTOR)
        return thread
end


function ThreadFactoryUtil:start(thread)
        thread:start()
end

ThreadFactoryUtil.instance = ThreadFactoryUtil.new()

return ThreadFactoryUtil

