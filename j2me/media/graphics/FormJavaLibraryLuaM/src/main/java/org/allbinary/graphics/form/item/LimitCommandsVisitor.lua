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
-- package org.allbinary.graphics.form.item

-- local Command = require("javax.microedition.lcdui.Command")
local GameCommandsFactory = require("org.allbinary.game.commands.GameCommandsFactory")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local ScreenInfo = require("org.allbinary.graphics.form.ScreenInfo")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local Visitor = require("org.allbinary.logic.util.visitor.Visitor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LimitCommandsVisitor = {}
LimitCommandsVisitor.__index = LimitCommandsVisitor
LimitCommandsVisitor.className = "LimitCommandsVisitor"
setmetatable(LimitCommandsVisitor, {__index = Visitor})

function LimitCommandsVisitor:_init_fields()
    self.isNotSmallDisplay = nil
end


function LimitCommandsVisitor.new()
    local self = setmetatable(Visitor.new(), LimitCommandsVisitor)
    self:_init_fields()
        local displayInfo = DisplayInfoSingleton.getInstance()
        self.isNotSmallDisplay = (displayInfo:isPortrait() and displayInfo:getLastHeight() > ScreenInfo.getInstance().SMALL_WIDTH) or (not displayInfo:isPortrait() and displayInfo:getLastHeight() > ScreenInfo.getInstance().SMALL_HEIGHT)
    return self
end


function LimitCommandsVisitor:visit(anyType)
        local command = anyType
        local booleanFactory = BooleanFactory.getInstance()
        if self.isNotSmallDisplay or command:getPriority() == 1 or command == GameCommandsFactory.getInstance().EXIT_COMMAND or command == GameCommandsFactory.getInstance().EXIT_WITHOUT_PROGRESS_COMMAND then
            return booleanFactory.TRUE
        else
            return booleanFactory.FALSE
        end
end

return LimitCommandsVisitor

