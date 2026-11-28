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

local SmallBasicColorCacheFactory = {}
package.loaded["org.allbinary.graphics.color.SmallBasicColorCacheFactory"] = SmallBasicColorCacheFactory

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

local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

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

-- class table SmallBasicColorCacheFactory is declared before the requires
SmallBasicColorCacheFactory.__index = SmallBasicColorCacheFactory
SmallBasicColorCacheFactory.className = "SmallBasicColorCacheFactory"
SmallBasicColorCacheFactory.javaClassName = "org.allbinary.graphics.color.SmallBasicColorCacheFactory"

function SmallBasicColorCacheFactory:_init_fields()
    self.SIZE = 255
    self.INDEX_TO_COLOR = java_typed_array("I", java_new_array(0, self.SIZE))
    self.BASIC_COLOR_ARRAY = java_new_array(nil, self.SIZE)
    self.colorIndex = 0
end


function SmallBasicColorCacheFactory.getInstance()
        return SmallBasicColorCacheFactory.instance_f
end


function SmallBasicColorCacheFactory._jinit(self)
    SmallBasicColorCacheFactory._init_fields(self)
    return self
end

function SmallBasicColorCacheFactory.new(...)
    local self = setmetatable({}, SmallBasicColorCacheFactory)
    SmallBasicColorCacheFactory._jinit(self, ...)
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
            if rawequal(self.INDEX_TO_COLOR[index + 1], colorAsInt) then
                return self.BASIC_COLOR_ARRAY[index + 1]
            end
        end
        local ALPHA_MASK = (0xFF000000 - 0x100000000)
        basicColor = BasicColorFactory.getInstance():createInstanceAN(colorAsInt & ALPHA_MASK, colorAsInt & 0x00FFFFFF, StringUtil.getInstance().EMPTY_STRING)
        self:add(basicColor)
        return basicColor
end

SmallBasicColorCacheFactory.instance_f = SmallBasicColorCacheFactory.new()

return SmallBasicColorCacheFactory

