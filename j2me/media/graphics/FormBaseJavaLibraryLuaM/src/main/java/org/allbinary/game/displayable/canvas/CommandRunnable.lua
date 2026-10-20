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

-- local Command = require("javax.microedition.lcdui.Command")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
local MyCanvas = require("org.allbinary.graphics.displayable.MyCanvas")
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

local CommandRunnable = {}
CommandRunnable.__index = CommandRunnable
CommandRunnable.className = "CommandRunnable"

function CommandRunnable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.commandFormInputProcessor = nil
    self.command = nil
end


function CommandRunnable.new(commandFormInputProcessor, command)
    local self = setmetatable({}, CommandRunnable)
    self:_init_fields()
        self.commandFormInputProcessor = commandFormInputProcessor
        self.command = command
    return self
end


function CommandRunnable:run()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START_RUNNABLE, self, self.commonStrings.RUN)
            local canvas = self.commandFormInputProcessor:getCanvas()
            local commandListener = canvas:getCustomCommandListener()
            commandListener:commandAction(self.command, canvas)
            self.logUtil:putF(self.commonStrings.END_RUNNABLE, self, self.commonStrings.RUN)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end

return CommandRunnable

