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
-- package org.allbinary.media.image.comparison

local ImageComparatorConstraintsInterface = {}
package.loaded["org.allbinary.media.image.comparison.ImageComparatorConstraintsInterface"] = ImageComparatorConstraintsInterface

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

-- local Rectangle = require("java.awt.Rectangle")
-- local Color = require("java.awt.Color")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- Java interface
-- class table ImageComparatorConstraintsInterface is declared before the requires
ImageComparatorConstraintsInterface.__index = ImageComparatorConstraintsInterface
ImageComparatorConstraintsInterface.className = "ImageComparatorConstraintsInterface"
ImageComparatorConstraintsInterface.javaClassName = "org.allbinary.media.image.comparison.ImageComparatorConstraintsInterface"


function ImageComparatorConstraintsInterface:getMaxNonMatchingPixelDeltas()
    error("abstract method getMaxNonMatchingPixelDeltas")
end


function ImageComparatorConstraintsInterface:isCollisionWithAvoidRectangles_j1_1(rectangle)
    error("abstract method isCollisionWithAvoidRectangles")
end


function ImageComparatorConstraintsInterface:isCollisionWithAvoidRectangles_j1_2(point)
    error("abstract method isCollisionWithAvoidRectangles")
end
function ImageComparatorConstraintsInterface:isCollisionWithAvoidRectangles(...)
    local count = select("#", ...)
    if count == 1 then return self:isCollisionWithAvoidRectangles_j1(...) end
    error("No method isCollisionWithAvoidRectangles takes " .. count .. " arguments")
end
ImageComparatorConstraintsInterface.isCollisionWithAvoidRectangles__jdispatcher = ImageComparatorConstraintsInterface.isCollisionWithAvoidRectangles
function ImageComparatorConstraintsInterface:isCollisionWithAvoidRectangles_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Rectangle")) then return ImageComparatorConstraintsInterface.isCollisionWithAvoidRectangles_j1_1(self, ...) end
    return ImageComparatorConstraintsInterface.isCollisionWithAvoidRectangles_j1_2(self, ...)
end


function ImageComparatorConstraintsInterface:isColorAllowed(frame, point, color)
    error("abstract method isColorAllowed")
end


-- throws Exception
function ImageComparatorConstraintsInterface:isImageValid(bufferedImage)
    error("abstract method isImageValid")
end


function ImageComparatorConstraintsInterface:isFrameAllowed(frame)
    error("abstract method isFrameAllowed")
end

return ImageComparatorConstraintsInterface

