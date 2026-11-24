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

local DirectionFactory = {}
package.loaded["org.allbinary.direction.DirectionFactory"] = DirectionFactory

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local Direction = java_lazy("org.allbinary.direction.Direction")

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

-- class table DirectionFactory is declared before the requires
DirectionFactory.__index = DirectionFactory
DirectionFactory.className = "DirectionFactory"
DirectionFactory.javaClassName = "org.allbinary.direction.DirectionFactory"

function DirectionFactory:_init_fields()
    self.NAME = "DIRECTION"
    self.LEFT = Direction.new(CommonPhoneStrings.getInstance().LEFT, "WEST", 0, 1)
    self.RIGHT = Direction.new(CommonPhoneStrings.getInstance().RIGHT, "EAST", 1, 0)
    self.DOWN = Direction.new(CommonPhoneStrings.getInstance().DOWN, "SOUTH", 2, 0)
    self.UP = Direction.new(CommonPhoneStrings.getInstance().UP, "NORTH", 3, 0)
    if self.UP_LEFT == nil then self.UP_LEFT = nil end
    if self.UP_RIGHT == nil then self.UP_RIGHT = nil end
    if self.DOWN_LEFT == nil then self.DOWN_LEFT = nil end
    if self.DOWN_RIGHT == nil then self.DOWN_RIGHT = nil end
    self.NOT_BORDERED_WITH = Direction.new("NOT_BORDERED_WITH", "NOT_BORDERED_WITH", 8, 0)
    self.NO_DIRECTION = Direction.new("NO_DIRECTION", "NO_DIRECTION", 9, 0)
    self.TOP = Direction.new("TOP", "TOP", 10, 0)
    self.BOTTOM = Direction.new("BOTTOM", "BOTTOM", 11, 0)
    self.ALL_DIRECTION = Direction.new("ALL_DIRECTION", "ALL_DIRECTION", 12, 0)
end


function DirectionFactory.getInstance()
        return DirectionFactory.instance_f
end


function DirectionFactory._jinit(self)
    DirectionFactory._init_fields(self)
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

function DirectionFactory.new(...)
    local self = setmetatable({}, DirectionFactory)
    DirectionFactory._jinit(self, ...)
    return self
end

DirectionFactory.instance_f = DirectionFactory.new()

return DirectionFactory

