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

local CommonButtons = {}
package.loaded["org.allbinary.input.motion.button.CommonButtons"] = CommonButtons

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

local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")

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

-- class table CommonButtons is declared before the requires
CommonButtons.__index = CommonButtons
CommonButtons.className = "CommonButtons"
CommonButtons.javaClassName = "org.allbinary.input.motion.button.CommonButtons"

function CommonButtons:_init_fields()
    if self.STANDARD_BUTTON_SIZE == nil then self.STANDARD_BUTTON_SIZE = nil end
    if self.NORMAL_BUTTON == nil then self.NORMAL_BUTTON = nil end
    if self.LARGE_BUTTON == nil then self.LARGE_BUTTON = nil end
end


function CommonButtons.getInstance()
        return CommonButtons.instance_f
end


function CommonButtons._jinit(self)
    CommonButtons._init_fields(self)
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

function CommonButtons.new(...)
    local self = setmetatable({}, CommonButtons)
    CommonButtons._jinit(self, ...)
    return self
end

CommonButtons.instance_f = CommonButtons.new()

return CommonButtons

