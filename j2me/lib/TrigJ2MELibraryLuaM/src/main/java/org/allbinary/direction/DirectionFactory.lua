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
-- package org.allbinary.direction

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")
local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DirectionFactory = {}
DirectionFactory.__index = DirectionFactory
DirectionFactory.className = "DirectionFactory"

function DirectionFactory:_init_fields()
    self.NAME = "DIRECTION"
    self.LEFT = Direction.new(CommonPhoneStrings.getInstance().LEFT, "WEST", 0, 1)
    self.RIGHT = Direction.new(CommonPhoneStrings.getInstance().RIGHT, "EAST", 1, 0)
    self.DOWN = Direction.new(CommonPhoneStrings.getInstance().DOWN, "SOUTH", 2, 0)
    self.UP = Direction.new(CommonPhoneStrings.getInstance().UP, "NORTH", 3, 0)
    self.UP_LEFT = nil
    self.UP_RIGHT = nil
    self.DOWN_LEFT = nil
    self.DOWN_RIGHT = nil
    self.NOT_BORDERED_WITH = Direction.new("NOT_BORDERED_WITH", "NOT_BORDERED_WITH", 8, 0)
    self.NO_DIRECTION = Direction.new("NO_DIRECTION", "NO_DIRECTION", 9, 0)
    self.TOP = Direction.new("TOP", "TOP", 10, 0)
    self.BOTTOM = Direction.new("BOTTOM", "BOTTOM", 11, 0)
    self.ALL_DIRECTION = Direction.new("ALL_DIRECTION", "ALL_DIRECTION", 12, 0)
end


function DirectionFactory.getInstance()
        return DirectionFactory.instance
end


function DirectionFactory.new()
    local self = setmetatable({}, DirectionFactory)
    self:_init_fields()
        local stringBuffer = StringMaker.new()
        local commonSeps = CommonSeps.getInstance()
        self.UP_LEFT = Direction.new("UP LEFT", tostring(stringBuffer:append(self.UP:getOtherName()):append(commonSeps.SPACE):append(self.LEFT:getOtherName())), 4, 0)
        stringBuffer:delete(0, stringBuffer:length())
        self.UP_RIGHT = Direction.new("UP RIGHT", tostring(stringBuffer:append(self.UP:getOtherName()):append(commonSeps.SPACE):append(self.RIGHT:getOtherName())), 5, 0)
        stringBuffer:delete(0, stringBuffer:length())
        self.DOWN_LEFT = Direction.new("DOWN LEFT", tostring(stringBuffer:append(self.DOWN:getOtherName()):append(commonSeps.SPACE):append(self.LEFT:getOtherName())), 6, 0)
        stringBuffer:delete(0, stringBuffer:length())
        self.DOWN_RIGHT = Direction.new("DOWN RIGHT", tostring(stringBuffer:append(self.DOWN:getOtherName()):append(commonSeps.SPACE):append(self.RIGHT:getOtherName())), 7, 0)
    return self
end

DirectionFactory.instance = DirectionFactory.new()

return DirectionFactory

