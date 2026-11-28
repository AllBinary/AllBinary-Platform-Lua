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
-- package org.allbinary.input.automation.module

local ImageComparatorConstraints = {}
package.loaded["org.allbinary.input.automation.module.ImageComparatorConstraints"] = ImageComparatorConstraints

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

-- local Color = require("java.awt.Color")
-- local Rectangle = require("java.awt.Rectangle")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local RectangleCollisionUtil = java_lazy("org.allbinary.collision.RectangleCollisionUtil")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local ImageComparatorConstraintsInterface = java_lazy("org.allbinary.media.image.comparison.ImageComparatorConstraintsInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

-- class table ImageComparatorConstraints is declared before the requires
ImageComparatorConstraints.__index = ImageComparatorConstraints
ImageComparatorConstraints.className = "ImageComparatorConstraints"
ImageComparatorConstraints.javaClassName = "org.allbinary.input.automation.module.ImageComparatorConstraints"
ImageComparatorConstraints.java_implements = " ImageComparatorConstraintsInterface "
ImageComparatorConstraints.java_interfaces = function() return {ImageComparatorConstraintsInterface} end

function ImageComparatorConstraints:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.avoidVector == nil then self.avoidVector = nil end
    if self.maxNonMatchingPixelDeltas == nil then self.maxNonMatchingPixelDeltas = 0 end
    if self.doImageComparisonEveryNthFrame == nil then self.doImageComparisonEveryNthFrame = 0 end
end


function ImageComparatorConstraints._jinit(self, doImageComparisonEveryNthFrame)
    ImageComparatorConstraints._init_fields(self)
        self.doImageComparisonEveryNthFrame = doImageComparisonEveryNthFrame
        self:setAvoidVector(BasicArrayListD.new())
    return self
end

function ImageComparatorConstraints.new(...)
    local self = setmetatable({}, ImageComparatorConstraints)
    ImageComparatorConstraints._jinit(self, ...)
    return self
end


function ImageComparatorConstraints:getAvoidVector()
        return self.avoidVector
end


function ImageComparatorConstraints:isColorAllowed(frame, point, color)
        error(require("java.lang.RuntimeException").new(), 0)
end


function ImageComparatorConstraints:isCollisionWithAvoidRectangles_j1_1(rectangle)
        local isCollsionWithAvoidRectangles = false
        local avoidVector = self:getAvoidVector()
        local size = avoidVector:size()
        for index = 0, size - 1 do
            local avoidRectangle = avoidVector:get(index)
            if RectangleCollisionUtil.isCollision(avoidRectangle, rectangle) then
                isCollsionWithAvoidRectangles = true
            end
        end
        return isCollsionWithAvoidRectangles
end


function ImageComparatorConstraints:isCollisionWithAvoidRectangles_j1_2(point)
        local isCollsionWithAvoidRectangles = false
        local avoidVector = self:getAvoidVector()
        local size = avoidVector:size()
        for index = 0, size - 1 do
            local avoidRectangle = avoidVector:get(index)
            if RectangleCollisionUtil.isCollision(avoidRectangle, point) then
                isCollsionWithAvoidRectangles = true
                break
            end
        end
        return isCollsionWithAvoidRectangles
end
function ImageComparatorConstraints:isCollisionWithAvoidRectangles(...)
    local count = select("#", ...)
    if count == 1 then return self:isCollisionWithAvoidRectangles_j1(...) end
    error("No method isCollisionWithAvoidRectangles takes " .. count .. " arguments")
end
ImageComparatorConstraints.isCollisionWithAvoidRectangles__jdispatcher = ImageComparatorConstraints.isCollisionWithAvoidRectangles
function ImageComparatorConstraints:isCollisionWithAvoidRectangles_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Rectangle")) then return ImageComparatorConstraints.isCollisionWithAvoidRectangles_j1_1(self, ...) end
    return ImageComparatorConstraints.isCollisionWithAvoidRectangles_j1_2(self, ...)
end


function ImageComparatorConstraints:setAvoidVector(avoidVector)
        self.avoidVector = avoidVector
end


function ImageComparatorConstraints:getMaxNonMatchingPixelDeltas()
        return self.maxNonMatchingPixelDeltas
end


function ImageComparatorConstraints:setMaxNonMatchingPixelDeltas(maxNonMatchingPixelDeltas)
        self.maxNonMatchingPixelDeltas = maxNonMatchingPixelDeltas
end


function ImageComparatorConstraints:isFrameAllowed(frame)
        local remainder = (math.fmod((frame + 1), self.doImageComparisonEveryNthFrame))
        self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(" Frame: ") .. require("allbinary_java").to_string(frame)) .. require("allbinary_java").to_string(" remainder: ")) .. require("allbinary_java").to_string(remainder)) .. require("allbinary_java").to_string(" this.doImageComparisonEveryNthFrame: ")) .. require("allbinary_java").to_string(self.doImageComparisonEveryNthFrame), self, "isCollisionWithAvoidRectangles")
        if rawequal(remainder, 0) then
            return true
        else
            return false
        end
end


-- throws Exception
function ImageComparatorConstraints:isImageValid(bufferedImage)
        error(require("java.lang.RuntimeException").new(), 0)
end


function ImageComparatorConstraints:log()
        local avoidVector = self:getAvoidVector()
        local size = avoidVector:size()
        for index = 0, size - 1 do
            local avoidRectangle = avoidVector:get(index)
            self.logUtil:putF(require("allbinary_java").to_string("Avoid Rectangle: ") .. require("allbinary_java").to_string(avoidRectangle), self, "log")
        end
end

return ImageComparatorConstraints

