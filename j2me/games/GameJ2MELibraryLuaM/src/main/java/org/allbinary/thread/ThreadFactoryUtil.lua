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

local ThreadFactoryUtil = {}
package.loaded["org.allbinary.thread.ThreadFactoryUtil"] = ThreadFactoryUtil

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

local J2MEUtil = java_lazy("org.allbinary.J2MEUtil")
local RunnableCanvas = java_lazy("org.allbinary.canvas.RunnableCanvas")
local AllBinaryGameCanvas = java_lazy("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local DemoCanvas = java_lazy("org.allbinary.game.displayable.canvas.DemoCanvas")
local GameCanvasRunnableInterface = java_lazy("org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface")
local RunnableCanvasSingleThreadStartRunnable = java_lazy("org.allbinary.game.displayable.canvas.RunnableCanvasSingleThreadStartRunnable")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ABRunnable = java_lazy("org.allbinary.thread.ABRunnable")
local PrimaryThreadPool = java_lazy("org.allbinary.thread.PrimaryThreadPool")
local ThreadPool = java_lazy("org.allbinary.thread.ThreadPool")

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

-- class table ThreadFactoryUtil is declared before the requires
ThreadFactoryUtil.__index = ThreadFactoryUtil
ThreadFactoryUtil.className = "ThreadFactoryUtil"
ThreadFactoryUtil.javaClassName = "org.allbinary.thread.ThreadFactoryUtil"

function ThreadFactoryUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function ThreadFactoryUtil._jinit(self)
    ThreadFactoryUtil._init_fields(self)
    return self
end

function ThreadFactoryUtil.new()
    return ThreadFactoryUtil._jinit(setmetatable({}, ThreadFactoryUtil))
end


function ThreadFactoryUtil.getInstance()
        return ThreadFactoryUtil.instance_f
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
        local thread = require("java.lang.Thread").new(runnable, tostring(runnable))
        self.logUtil:putF(tostring(thread), self, commonStrings.CONSTRUCTOR)
        return thread
end


function ThreadFactoryUtil:start(thread)
        thread:start()
end

ThreadFactoryUtil.instance_f = ThreadFactoryUtil.new()

return ThreadFactoryUtil

