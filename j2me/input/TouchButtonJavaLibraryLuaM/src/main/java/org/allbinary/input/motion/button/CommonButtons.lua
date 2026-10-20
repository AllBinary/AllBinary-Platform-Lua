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
-- package org.allbinary.input.motion.button

local PointFactory = require("org.allbinary.graphics.PointFactory")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CommonButtons = {}
CommonButtons.__index = CommonButtons
CommonButtons.className = "CommonButtons"

function CommonButtons:_init_fields()
    self.STANDARD_BUTTON_SIZE = nil
    self.NORMAL_BUTTON = nil
    self.LARGE_BUTTON = nil
end


function CommonButtons.getInstance()
        return CommonButtons.instance
end


function CommonButtons.new()
    local self = setmetatable({}, CommonButtons)
    self:_init_fields()
        local displayInfo = DisplayInfoSingleton.getInstance()
        local commonButtonSize = 128
        while commonButtonSize > 64 do
            local totalColumns = displayInfo:getLastWidth() / commonButtonSize
            local totalRows = displayInfo:getLastHeight() / commonButtonSize
            local max = totalColumns
            if totalRows > max then
                max = totalRows
            end
            if max > 9 then
                break
            end
            commonButtonSize = ((commonButtonSize) // (1 << (1)))
        end
        self.STANDARD_BUTTON_SIZE = commonButtonSize
        self.NORMAL_BUTTON = Rectangle.new(PointFactory.getInstance().ZERO_ZERO, self.STANDARD_BUTTON_SIZE, self.STANDARD_BUTTON_SIZE)
        self.LARGE_BUTTON = Rectangle.new(PointFactory.getInstance().ZERO_ZERO, self.STANDARD_BUTTON_SIZE << 1, self.STANDARD_BUTTON_SIZE << 1)
    return self
end

CommonButtons.instance = CommonButtons.new()

return CommonButtons

