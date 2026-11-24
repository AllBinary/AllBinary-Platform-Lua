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
-- package org.allbinary.animation.image

local ImageArraySpecialAnimation = {}
package.loaded["org.allbinary.animation.image.ImageArraySpecialAnimation"] = ImageArraySpecialAnimation

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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
local AnimationBehavior = java_lazy("org.allbinary.animation.AnimationBehavior")
local SpecialAnimationInterface = java_lazy("org.allbinary.animation.special.SpecialAnimationInterface")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local GameTickTimeDelayHelperFactory = java_lazy("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local ImageArrayAnimation = require("org.allbinary.animation.image.ImageArrayAnimation")

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

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

-- class table ImageArraySpecialAnimation is declared before the requires
ImageArraySpecialAnimation.__index = ImageArraySpecialAnimation
ImageArraySpecialAnimation.className = "ImageArraySpecialAnimation"
ImageArraySpecialAnimation.javaClassName = "org.allbinary.animation.image.ImageArraySpecialAnimation"
setmetatable(ImageArraySpecialAnimation, {__index = ImageArrayAnimation})
ImageArraySpecialAnimation.java_implements = " SpecialAnimationInterface "
ImageArraySpecialAnimation.java_interfaces = function() return {SpecialAnimationInterface} end

function ImageArraySpecialAnimation:_init_fields()
    self.timeDelayHelper = TimeDelayHelper.new(270)
    self.loopCount = 0
    self.loopCountTotal = 1
end


function ImageArraySpecialAnimation._jinit(self, imageArray, animationBehavior)
    java_super_init(ImageArrayAnimation, self, imageArray, animationBehavior)
    ImageArraySpecialAnimation._init_fields(self)
        -- super(...) made self above
        self:reset()
    return self
end

function ImageArraySpecialAnimation.new(...)
    local self = setmetatable({}, ImageArraySpecialAnimation)
    ImageArraySpecialAnimation._jinit(self, ...)
    return self
end


function ImageArraySpecialAnimation:getLoopCount()
        return self.loopCount
end
java_overload(ImageArraySpecialAnimation, "getLoopCount", 0)


function ImageArraySpecialAnimation:setLastFrame()
        self.circularIndexUtil:setIndex(self.circularIndexUtil:getSize() - 1)
end
java_overload(ImageArraySpecialAnimation, "setLastFrame", 0)


function ImageArraySpecialAnimation:reset()
        self:setFrame(self:getSize() - 1)
        self.loopCount = 0
end
java_overload(ImageArraySpecialAnimation, "reset", 0)


function ImageArraySpecialAnimation:nextFrame()
        if self:getFrame() > 0 then
            if self.timeDelayHelper:isTime(GameTickTimeDelayHelperFactory.getInstance().startTime) then
                self:previousFrame()
                if self:getFrame() == 0 then
                    self.loopCount = self.loopCount + 1
                end
            end
        end
end
java_overload(ImageArraySpecialAnimation, "nextFrame", 0)


function ImageArraySpecialAnimation:isComplete()
        if self.loopCount < self.loopCountTotal or self:getFrame() ~= 0 then
            return false
        else
            return true
        end
end
java_overload(ImageArraySpecialAnimation, "isComplete", 0)


function ImageArraySpecialAnimation:paintXY(graphics, x, y)
        x = DisplayInfoSingleton.getInstance():getLastHalfWidth() - (((self:getImage(self.circularIndexUtil:getIndex()):getWidth()) // (1 << (1))))
        y = 5
        java_super(ImageArrayAnimation, "paintXY", 3)(self, graphics, x, y)
end
java_overload(ImageArraySpecialAnimation, "paintXY", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and type(java_a3) == "number" end)

return ImageArraySpecialAnimation

