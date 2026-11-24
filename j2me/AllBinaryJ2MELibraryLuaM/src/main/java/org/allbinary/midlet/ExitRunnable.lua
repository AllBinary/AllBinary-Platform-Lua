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

local ExitRunnable = {}
package.loaded["org.allbinary.midlet.ExitRunnable"] = ExitRunnable

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

-- local NullCanvas = require("javax.microedition.lcdui.NullCanvas")
local Processor = java_lazy("org.allbinary.canvas.Processor")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Runnable = require("java.lang.Runnable")
local AllBinaryMidlet = java_lazy("org.allbinary.midlet.AllBinaryMidlet")

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

-- class table ExitRunnable is declared before the requires
ExitRunnable.__index = ExitRunnable
ExitRunnable.className = "ExitRunnable"
ExitRunnable.javaClassName = "org.allbinary.midlet.ExitRunnable"
ExitRunnable.java_implements = " Runnable "
ExitRunnable.java_interfaces = function() return {Runnable} end

function ExitRunnable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.midlet == nil then self.midlet = nil end
    if self.processor == nil then self.processor = nil end
    if self.isProgress == nil then self.isProgress = nil end
end


function ExitRunnable._jinit(self, midlet, processor, isProgress)
    ExitRunnable._init_fields(self)
        self.midlet = midlet
        self.isProgress = isProgress
        self.processor = processor
    return self
end

function ExitRunnable.new(...)
    local self = setmetatable({}, ExitRunnable)
    ExitRunnable._jinit(self, ...)
    return self
end


function ExitRunnable:run()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START_RUNNABLE, self, self.commonStrings.RUN)
            self.midlet:destroyAppInRunnable(false, self.isProgress)
            self.midlet:setDisplay(NullCanvas.NULL_CANVAS)
            self.midlet:notifyDestroyed()
            self.logUtil:putF(self.commonStrings.END_RUNNABLE, self, self.commonStrings.RUN)
            self.processor:process()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
            local try_ok, try_error, try_value = pcall(function()
                self.processor:process()
            end)
            if not try_ok then
                local e2 = try_error
                if type(e2) ~= "table" then e2 = require("java.lang.RuntimeException").new(tostring(e2)) end
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
            end
        end
end

return ExitRunnable

