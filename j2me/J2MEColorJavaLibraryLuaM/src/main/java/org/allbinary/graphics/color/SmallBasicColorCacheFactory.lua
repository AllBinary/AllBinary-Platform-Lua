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
-- package org.allbinary.graphics.color

local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SmallBasicColorCacheFactory = {}
SmallBasicColorCacheFactory.__index = SmallBasicColorCacheFactory
SmallBasicColorCacheFactory.className = "SmallBasicColorCacheFactory"

function SmallBasicColorCacheFactory:_init_fields()
    self.SIZE = 255
    self.INDEX_TO_COLOR = java_new_array(0, self.SIZE)
    self.BASIC_COLOR_ARRAY = java_new_array(nil, self.SIZE)
    self.colorIndex = 0
end


function SmallBasicColorCacheFactory.getInstance()
        return SmallBasicColorCacheFactory.instance
end


function SmallBasicColorCacheFactory.new()
    local self = setmetatable({}, SmallBasicColorCacheFactory)
    self:_init_fields()
    return self
end


function SmallBasicColorCacheFactory:add(basicDefaultColor)
        self.BASIC_COLOR_ARRAY[self.colorIndex + 1] = basicDefaultColor
        self.INDEX_TO_COLOR[self.colorIndex + 1] = math.tointeger(basicDefaultColor // 1)
        self.colorIndex = self.colorIndex + 1
end


function SmallBasicColorCacheFactory:getAndOrCreate(colorAsInt)
        local basicColor = nil
        for index = 0, self.SIZE - 1 do
            if self.INDEX_TO_COLOR[index + 1] == colorAsInt then
                return self.BASIC_COLOR_ARRAY[index + 1]
            end
        end
        local ALPHA_MASK = 0xFF000000
        basicColor = BasicColorFactory.getInstance():createInstanceAN(colorAsInt & ALPHA_MASK, colorAsInt & 0x00FFFFFF, StringUtil.getInstance().EMPTY_STRING)
        self:add(basicColor)
        return basicColor
end

SmallBasicColorCacheFactory.instance = SmallBasicColorCacheFactory.new()

return SmallBasicColorCacheFactory

