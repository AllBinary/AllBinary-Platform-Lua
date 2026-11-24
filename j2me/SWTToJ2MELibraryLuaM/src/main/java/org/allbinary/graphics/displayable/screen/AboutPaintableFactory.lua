--
-- AllBinary Open License Version 1
-- Copyright (c) 2022 AllBinary
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
-- package org.allbinary.graphics.displayable.screen

local AboutPaintableFactory = {}
package.loaded["org.allbinary.graphics.displayable.screen.AboutPaintableFactory"] = AboutPaintableFactory

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

local AboutPaintable = java_lazy("org.allbinary.game.paint.AboutPaintable")
local NullPaintable = java_lazy("org.allbinary.graphics.paint.NullPaintable")
local Paintable = java_lazy("org.allbinary.graphics.paint.Paintable")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")

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

-- class table AboutPaintableFactory is declared before the requires
AboutPaintableFactory.__index = AboutPaintableFactory
AboutPaintableFactory.className = "AboutPaintableFactory"
AboutPaintableFactory.javaClassName = "org.allbinary.graphics.displayable.screen.AboutPaintableFactory"

function AboutPaintableFactory:_init_fields()
    self.paintableArray = {NullPaintable.getInstance()}
end


function AboutPaintableFactory.getInstance()
        return AboutPaintableFactory.instance_f
end


function AboutPaintableFactory._jinit(self)
    AboutPaintableFactory._init_fields(self)
        local INFO = {"Built with the", "AllBinary Platform", StringUtil.getInstance().EMPTY_STRING, "Comments or Questions:", "support@allbinary.com"}
        local DEVELOPERS = {"Developed By:", "Travis Berthelot"}
        self.paintableArray = AboutPaintable.getInstance(INFO, DEVELOPERS):getPaintableArrayInstance()
    return self
end

function AboutPaintableFactory.new(...)
    local self = setmetatable({}, AboutPaintableFactory)
    AboutPaintableFactory._jinit(self, ...)
    return self
end

AboutPaintableFactory.instance_f = AboutPaintableFactory.new()

return AboutPaintableFactory

