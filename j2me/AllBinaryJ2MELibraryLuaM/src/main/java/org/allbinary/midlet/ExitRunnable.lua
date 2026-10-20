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
-- package org.allbinary.midlet

-- local NullCanvas = require("javax.microedition.lcdui.NullCanvas")
local Processor = require("org.allbinary.canvas.Processor")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
-- java.lang.Runnable has no Lua module
local Runnable = {}

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ExitRunnable = {}
ExitRunnable.__index = ExitRunnable
ExitRunnable.className = "ExitRunnable"

function ExitRunnable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.midlet = nil
    self.processor = nil
    self.isProgress = nil
end


function ExitRunnable.new(midlet, processor, isProgress)
    local self = setmetatable({}, ExitRunnable)
    self:_init_fields()
        self.midlet = midlet
        self.isProgress = isProgress
        self.processor = processor
    return self
end


function ExitRunnable:run()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START_RUNNABLE, self, self.commonStrings.RUN)
            self.midlet:destroyAppInRunnable(false, self.isProgress)
            self.midlet:setDisplay(NullCanvas.NULL_CANVAS)
            self.midlet:notifyDestroyed()
            self.logUtil:putF(self.commonStrings.END_RUNNABLE, self, self.commonStrings.RUN)
            self.processor:process()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
            local try_ok, try_error = pcall(function()
                self.processor:process()
            end)
            if not try_ok then
                local e2 = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
            end
        end
end

return ExitRunnable

