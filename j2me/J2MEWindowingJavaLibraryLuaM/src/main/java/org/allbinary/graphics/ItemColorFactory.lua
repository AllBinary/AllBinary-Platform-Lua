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
-- package org.allbinary.graphics

local ItemColorFactory = {}
package.loaded["org.allbinary.graphics.ItemColorFactory"] = ItemColorFactory

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

-- class table ItemColorFactory is declared before the requires
ItemColorFactory.__index = ItemColorFactory
ItemColorFactory.className = "ItemColorFactory"
ItemColorFactory.javaClassName = "org.allbinary.graphics.ItemColorFactory"

function ItemColorFactory:_init_fields()
    self.INVERT_PAINT = (0xFF000000 - 0x100000000)
    self.PAINT = (0xFFe07718 - 0x100000000)
    self.TEXT_FIELD_NO_FOCUS = 0x7F7F7F
end

function ItemColorFactory._jinit(self)
    ItemColorFactory._init_fields(self)
    return self
end

function ItemColorFactory.new()
    return ItemColorFactory._jinit(setmetatable({}, ItemColorFactory))
end


function ItemColorFactory.getInstance()
        return ItemColorFactory.instance_f
end

ItemColorFactory.instance_f = ItemColorFactory.new()

return ItemColorFactory

