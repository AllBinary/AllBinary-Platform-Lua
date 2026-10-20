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
-- package org.allbinary.graphics.displayable.command

-- local Command = require("javax.microedition.lcdui.Command")
local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MyCommandsFactory = {}
MyCommandsFactory.__index = MyCommandsFactory
MyCommandsFactory.className = "MyCommandsFactory"

function MyCommandsFactory:_init_fields()
    self.NO_COMMAND = Command.new(StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING, -1, -1)
    self.GAUGE_CHANGE = Command.new("GAUGE_CHANGE", StringUtil.getInstance().EMPTY_STRING, Command.ITEM, 1)
    self.SET_DISPLAYABLE = Command.new("Display", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 2)
    self.PAUSE_COMMAND = Command.new("Pause", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 0)
    self.RESUME_COMMAND = Command.new("Resume", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 0)
end


function MyCommandsFactory.getInstance()
        return MyCommandsFactory.instance
end


function MyCommandsFactory.new()
    local self = setmetatable({}, MyCommandsFactory)
    self:_init_fields()
    return self
end

MyCommandsFactory.instance = MyCommandsFactory.new()

return MyCommandsFactory

