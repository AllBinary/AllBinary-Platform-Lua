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
-- package org.allbinary.game.displayable.canvas

local CommandRunnable = {}
package.loaded["org.allbinary.game.displayable.canvas.CommandRunnable"] = CommandRunnable

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

-- local Command = require("javax.microedition.lcdui.Command")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
local MyCanvas = java_lazy("org.allbinary.graphics.displayable.MyCanvas")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Runnable = require("java.lang.Runnable")
local CommandFormInputProcessor = java_lazy("org.allbinary.game.displayable.canvas.CommandFormInputProcessor")

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

-- class table CommandRunnable is declared before the requires
CommandRunnable.__index = CommandRunnable
CommandRunnable.className = "CommandRunnable"
CommandRunnable.javaClassName = "org.allbinary.game.displayable.canvas.CommandRunnable"
CommandRunnable.java_implements = " Runnable "
CommandRunnable.java_interfaces = function() return {Runnable} end

function CommandRunnable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.commandFormInputProcessor == nil then self.commandFormInputProcessor = nil end
    if self.command == nil then self.command = nil end
end


function CommandRunnable._jinit(self, commandFormInputProcessor, command)
    CommandRunnable._init_fields(self)
        self.commandFormInputProcessor = commandFormInputProcessor
        self.command = command
    return self
end

function CommandRunnable.new(...)
    local self = setmetatable({}, CommandRunnable)
    CommandRunnable._jinit(self, ...)
    return self
end


function CommandRunnable:run()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START_RUNNABLE, self, self.commonStrings.RUN)
            local canvas = self.commandFormInputProcessor:getCanvas()
            local commandListener = canvas:getCustomCommandListener()
            commandListener:commandAction(self.command, canvas)
            self.logUtil:putF(self.commonStrings.END_RUNNABLE, self, self.commonStrings.RUN)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end

return CommandRunnable

