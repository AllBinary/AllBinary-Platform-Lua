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
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local ABTextItem = require("org.allbinary.graphics.form.item.ABTextItem")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CommandTextItem = {}
CommandTextItem.__index = CommandTextItem
CommandTextItem.className = "CommandTextItem"
setmetatable(CommandTextItem, {__index = ABTextItem})

function CommandTextItem:_init_fields()
    self.command = nil
end


function CommandTextItem.new(command, layout, altText, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(ABTextItem.new(command:getLabel(), layout, altText, backgroundBasicColor, foregroundBasicColor), CommandTextItem)
    self:_init_fields()
        -- super(...) made self above
        self.command = command
    return self
end


function CommandTextItem:isFocusable()
        return true
end


function CommandTextItem:getCommand()
        return self.command
end

return CommandTextItem

