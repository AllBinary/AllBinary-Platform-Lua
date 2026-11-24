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
-- package org.allbinary.media.image.comparison.motion

local AllMotionRectangles = {}
package.loaded["org.allbinary.media.image.comparison.motion.AllMotionRectangles"] = AllMotionRectangles

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
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local ImageComparisonResult = java_lazy("org.allbinary.media.image.comparison.ImageComparisonResult")
local PixelDelta = java_lazy("org.allbinary.media.image.comparison.pixel.PixelDelta")
local MotionRectangles = require("org.allbinary.media.image.comparison.motion.MotionRectangles")
local MotionRectangle = java_lazy("org.allbinary.media.image.comparison.motion.MotionRectangle")

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

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

-- class table AllMotionRectangles is declared before the requires
AllMotionRectangles.__index = AllMotionRectangles
AllMotionRectangles.className = "AllMotionRectangles"
AllMotionRectangles.javaClassName = "org.allbinary.media.image.comparison.motion.AllMotionRectangles"
setmetatable(AllMotionRectangles, {__index = MotionRectangles})


function AllMotionRectangles._jinit(self, imageComparisonResult)
    java_super_init(MotionRectangles, self, AllMotionRectangles.NAME, imageComparisonResult)
        -- super(...) made self above
        self:createMotionRectangles(imageComparisonResult)
    return self
end

function AllMotionRectangles.new(...)
    local self = setmetatable({}, AllMotionRectangles)
    AllMotionRectangles._jinit(self, ...)
    return self
end


-- throws Exception
function AllMotionRectangles:createMotionRectangles(imageComparisonInfo)
        local vector = imageComparisonInfo:getNonMatchingPixelVector()
        local size = vector:size()
        for index = 0, size - 1 do
            local pixelDelta = vector:get(index)
            self:addPixelDeltaToAMotionRectangle(pixelDelta)
        end
end
java_overload(AllMotionRectangles, "createMotionRectangles", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ImageComparisonResult")) end)


-- throws Exception
function AllMotionRectangles:addPixelDeltaToExistingMotionRectangle(pixelDelta)
        local vector = self:getVector()
        local size = vector:size()
        for index = 0, size - 1 do
            local motionRectangle = vector:get(index)
            if self:shouldPixelDeltaPartOfMotionRectangle(motionRectangle, pixelDelta) then
                local newWidth = pixelDelta:getPoint():getX() - motionRectangle:getRectangle().x
                local newHeight = pixelDelta:getPoint():getY() - motionRectangle:getRectangle().y
                if newWidth < motionRectangle:getRectangle().width then
                    newWidth = motionRectangle:getRectangle().width
                end
                if newHeight < motionRectangle:getRectangle().height then
                    newHeight = motionRectangle:getRectangle().height
                end
                motionRectangle:getRectangle():setSize(newWidth, newHeight)
                return true
            end
        end
        return false
end
java_overload(AllMotionRectangles, "addPixelDeltaToExistingMotionRectangle", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PixelDelta")) end)


-- throws Exception
function AllMotionRectangles:addPixelDeltaToAMotionRectangle(pixelDelta)
        if not self:addPixelDeltaToExistingMotionRectangle(pixelDelta) then
            local newRectangle = Rectangle.new(pixelDelta:getPoint():getX(), pixelDelta:getPoint():getY(), 1, 1)
            local motionRectangle = MotionRectangle.new(newRectangle)
            motionRectangle:getPixelDeltaVector():add(pixelDelta)
            self:getVector():add(motionRectangle)
        end
end
java_overload(AllMotionRectangles, "addPixelDeltaToAMotionRectangle", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PixelDelta")) end)


-- throws Exception
function AllMotionRectangles:shouldPixelDeltaPartOfMotionRectangle(motionRectangle, pixelDelta)
        local isPixelLeftOfTheRectangle = false
        if motionRectangle:getRectangle().y > pixelDelta:getPoint():getY() then
            error(require("java.lang.Exception").new("PixelAboveTheRectangle"), 0)
        end
        if motionRectangle:getRectangle().x > pixelDelta:getPoint():getX() then
            isPixelLeftOfTheRectangle = true
        end
        if not isPixelLeftOfTheRectangle then
            return self:isPixelDeltaLikelyPartOfMotionRectangle(motionRectangle, pixelDelta)
        end
        return false
end
java_overload(AllMotionRectangles, "shouldPixelDeltaPartOfMotionRectangle", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "MotionRectangle")) and (java_a2 == nil or java_is(java_a2, "PixelDelta")) end)


-- throws Exception
function AllMotionRectangles:isPixelDeltaLikelyPartOfMotionRectangle(motionRectangle, pixelDelta)
        local maxX = motionRectangle:getRectangle().x + motionRectangle:getRectangle().width
        local maxY = motionRectangle:getRectangle().y + motionRectangle:getRectangle().height
        local horizontalDistance = pixelDelta:getPoint():getX() - maxX
        local verticalDistance = pixelDelta:getPoint():getY() - maxY
        if horizontalDistance < self.MAX_PIXEL_DISTANCE_THRESHOLD and verticalDistance < self.MAX_PIXEL_DISTANCE_THRESHOLD then
            return true
        end
        return false
end
java_overload(AllMotionRectangles, "isPixelDeltaLikelyPartOfMotionRectangle", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "MotionRectangle")) and (java_a2 == nil or java_is(java_a2, "PixelDelta")) end)

AllMotionRectangles.NAME = "allMotionRectangles_"

return AllMotionRectangles

