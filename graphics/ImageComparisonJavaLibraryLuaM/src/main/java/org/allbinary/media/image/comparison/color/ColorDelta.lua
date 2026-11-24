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
-- package org.allbinary.media.image.comparison.color

local ColorDelta = {}
package.loaded["org.allbinary.media.image.comparison.color.ColorDelta"] = ColorDelta

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
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CacheableInterface = java_lazy("org.allbinary.logic.util.cache.CacheableInterface")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
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

-- class table ColorDelta is declared before the requires
ColorDelta.__index = ColorDelta
ColorDelta.className = "ColorDelta"
ColorDelta.javaClassName = "org.allbinary.media.image.comparison.color.ColorDelta"
ColorDelta.java_implements = " CacheableInterface "
ColorDelta.java_interfaces = function() return {CacheableInterface} end

function ColorDelta:_init_fields()
    if self.rgb1 == nil then self.rgb1 = 0 end
    if self.rgb2 == nil then self.rgb2 = 0 end
    if self.key == nil then self.key = nil end
end


function ColorDelta._jinit(self, rgb1, rgb2)
    ColorDelta._init_fields(self)
        self:setRgb1(rgb1)
        self:setRgb2(rgb2)
        self.key = ColorDelta.getKey(rgb1, rgb2)
    return self
end

function ColorDelta.new(...)
    local self = setmetatable({}, ColorDelta)
    ColorDelta._jinit(self, ...)
    return self
end


function ColorDelta:getKey()
        return self.key
end


function ColorDelta.getKey(rgb1, rgb2)
        return tostring(StringMaker.new():append(tostring(rgb1)):append(CommonSeps.getInstance().UNDERSCORE):append(tostring(rgb2)))
end


function ColorDelta:getRgb1()
        return self.rgb1
end


function ColorDelta:setRgb1(rgb1)
        self.rgb1 = rgb1
end


function ColorDelta:getRgb2()
        return self.rgb2
end


function ColorDelta:setRgb2(rgb2)
        self.rgb2 = rgb2
end


function ColorDelta:toString()
        return tostring(StringMaker.new():append("ColorDelta: "):append(StringUtil.getInstance():toString(self:getKey())):append(" RGB1: "):appendint(self:getRgb1()):append(" RGB2: "):appendint(self:getRgb2()))
end
ColorDelta.__tostring = function(self) return self:toString() end

return ColorDelta

