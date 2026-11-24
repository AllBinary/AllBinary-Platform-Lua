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
-- package org.allbinary.animation

local IndexedAnimation = {}
package.loaded["org.allbinary.animation.IndexedAnimation"] = IndexedAnimation

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PrimitiveIntUtil = java_lazy("org.allbinary.logic.math.PrimitiveIntUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Animation = require("org.allbinary.animation.Animation")
local IndexedAnimationInterface = require("org.allbinary.animation.IndexedAnimationInterface")
local AnimationBehavior = java_lazy("org.allbinary.animation.AnimationBehavior")

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

-- class table IndexedAnimation is declared before the requires
IndexedAnimation.__index = IndexedAnimation
IndexedAnimation.className = "IndexedAnimation"
IndexedAnimation.javaClassName = "org.allbinary.animation.IndexedAnimation"
setmetatable(IndexedAnimation, {__index = Animation})
IndexedAnimation.java_implements = " IndexedAnimationInterface "
IndexedAnimation.java_interfaces = function() return {IndexedAnimationInterface} end

function IndexedAnimation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.animationBehaviorP == nil then self.animationBehaviorP = nil end
end


function IndexedAnimation._jinit(self, animationBehavior)
    java_super_init(Animation, self)
    IndexedAnimation._init_fields(self)
        self.animationBehaviorP = animationBehavior
    return self
end

function IndexedAnimation.new(...)
    local self = setmetatable({}, IndexedAnimation)
    IndexedAnimation._jinit(self, ...)
    return self
end


function IndexedAnimation:getAnimationBehavior()
        return self.animationBehaviorP
end
java_overload(IndexedAnimation, "getAnimationBehavior", 0)


function IndexedAnimation:reset()
        self.animationBehaviorP:reset()
        self:setFrame(0)
end
java_overload(IndexedAnimation, "reset", 0)


function IndexedAnimation:setFrame(index)
end
java_overload(IndexedAnimation, "setFrame", 1, function(java_a1) return true and type(java_a1) == "number" end)


function IndexedAnimation:getFrame()
        return 0
end
java_overload(IndexedAnimation, "getFrame", 0)


-- throws Exception
function IndexedAnimation:getAnimationSize()
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end
java_overload(IndexedAnimation, "getAnimationSize", 0)


function IndexedAnimation:getSize()
        return 0
end
java_overload(IndexedAnimation, "getSize", 0)


function IndexedAnimation:previousFrame()
end
java_overload(IndexedAnimation, "previousFrame", 0)


function IndexedAnimation:isLastFrame()
        if self:getFrame() == self:getSize() - 1 then
            return true
        else
            return false
        end
end
java_overload(IndexedAnimation, "isLastFrame", 0)


function IndexedAnimation:setSequence(sequence)
end
java_overload(IndexedAnimation, "setSequence", 1, function(java_a1) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and (java_a1.jt == nil or java_a1.jt == "I") and (java_a1[1] == nil or math.type(java_a1[1]) == "integer"))) end)


function IndexedAnimation:getSequence()
        return PrimitiveIntUtil.getArrayInstance()
end
java_overload(IndexedAnimation, "getSequence", 0)


function IndexedAnimation:setState(indexedAnimation)
        self:setFrame(indexedAnimation:getFrame())
        self:setDx(indexedAnimation:getDx())
        self:setDy(indexedAnimation:getDy())
end
java_overload(IndexedAnimation, "setState", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "IndexedAnimation")) end)


function IndexedAnimation:getWidth()
        return 0
end
java_overload(IndexedAnimation, "getWidth", 0)


function IndexedAnimation:getHeight()
        return 0
end
java_overload(IndexedAnimation, "getHeight", 0)

return IndexedAnimation

