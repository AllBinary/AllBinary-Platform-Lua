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

local CommandTextItemArrayFactory = require("org.allbinary.graphics.form.item.CommandTextItemArrayFactory")
local LimitCommandsVisitor = require("org.allbinary.graphics.form.item.LimitCommandsVisitor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DemoLimitedCommandTextItemArrayFactory = {}
DemoLimitedCommandTextItemArrayFactory.__index = DemoLimitedCommandTextItemArrayFactory
DemoLimitedCommandTextItemArrayFactory.className = "DemoLimitedCommandTextItemArrayFactory"

function DemoLimitedCommandTextItemArrayFactory:_init_fields()
    self.commandTextItemArrayFactory = CommandTextItemArrayFactory.new(LimitCommandsVisitor.new())
end

function DemoLimitedCommandTextItemArrayFactory.new()
    local self = setmetatable({}, DemoLimitedCommandTextItemArrayFactory)
    self:_init_fields()
    return self
end


function DemoLimitedCommandTextItemArrayFactory.getInstance()
        return DemoLimitedCommandTextItemArrayFactory.instance
end


function DemoLimitedCommandTextItemArrayFactory:getCommandTextItemArrayFactory()
        return self.commandTextItemArrayFactory
end

DemoLimitedCommandTextItemArrayFactory.instance = DemoLimitedCommandTextItemArrayFactory.new()

return DemoLimitedCommandTextItemArrayFactory

