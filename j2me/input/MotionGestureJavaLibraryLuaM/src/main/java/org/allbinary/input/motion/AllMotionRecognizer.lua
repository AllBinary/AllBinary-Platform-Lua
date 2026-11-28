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
-- package org.allbinary.input.motion

local AllMotionRecognizer = {}
package.loaded["org.allbinary.input.motion.AllMotionRecognizer"] = AllMotionRecognizer

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

local CustomGPoint = java_lazy("org.allbinary.graphics.CustomGPoint")
local GPointCircularPool = java_lazy("org.allbinary.graphics.GPointCircularPool")
local TouchButtonRecognizer = java_lazy("org.allbinary.input.motion.button.TouchButtonRecognizer")
local MotionGestureRecognizer = java_lazy("org.allbinary.input.motion.gesture.MotionGestureRecognizer")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local MotionRecognizer = require("org.allbinary.input.motion.MotionRecognizer")

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

-- class table AllMotionRecognizer is declared before the requires
AllMotionRecognizer.__index = AllMotionRecognizer
AllMotionRecognizer.className = "AllMotionRecognizer"
AllMotionRecognizer.javaClassName = "org.allbinary.input.motion.AllMotionRecognizer"
setmetatable(AllMotionRecognizer, {__index = MotionRecognizer})

function AllMotionRecognizer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.motionGestureRecognizer == nil then self.motionGestureRecognizer = nil end
    self.touchButtonProcessing = false
    if self.touchButtonRecognizer == nil then self.touchButtonRecognizer = nil end
    if self.id == nil then self.id = 0 end
    if self.lastX == nil then self.lastX = 0 end
    if self.lastY == nil then self.lastY = 0 end
end


function AllMotionRecognizer._jinit(self)
    java_super_init(MotionRecognizer, self)
    AllMotionRecognizer._init_fields(self)
        self.id = (function() local value = AllMotionRecognizer.index AllMotionRecognizer.index = value + 1 return value end)()
        self.motionGestureRecognizer = MotionGestureRecognizer.new(self.id)
        self.touchButtonRecognizer = TouchButtonRecognizer.new()
    return self
end

function AllMotionRecognizer.new(...)
    local self = setmetatable({}, AllMotionRecognizer)
    AllMotionRecognizer._jinit(self, ...)
    return self
end


-- throws Exception
function AllMotionRecognizer:processStartMotionEvent(x, y, deviceId, modifiers)
        if self.touchButtonRecognizer:pressTouchButtonInput(x, y, deviceId) then
            self.touchButtonProcessing = true
        end
        if not (self.touchButtonProcessing) then
            local point = AllMotionRecognizer.pointCircularPool:getNextInstance()
            point:setX(x)
            point:setY(y)
            self.motionGestureRecognizer:processPressedMotionEvent(point, deviceId, modifiers)
        end
end
java_overload(AllMotionRecognizer, "processStartMotionEvent", 4, function(java_a1, java_a2, java_a3, java_a4) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" end)


-- throws Exception
function AllMotionRecognizer:processEndMotionEvent(x, y, deviceId, modifiers)
        if self.touchButtonRecognizer:releaseTouchButtonInput(x, y, deviceId) then
        end
        if not (self.touchButtonProcessing) then
            local point = AllMotionRecognizer.pointCircularPool:getNextInstance()
            point:setX(x)
            point:setY(y)
            self.motionGestureRecognizer:processReleasedMotionEvent(point, deviceId, modifiers)
        end
        if self.touchButtonProcessing then
            self.touchButtonProcessing = false
        end
end
java_overload(AllMotionRecognizer, "processEndMotionEvent", 4, function(java_a1, java_a2, java_a3, java_a4) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" end)


-- throws Exception
function AllMotionRecognizer:processDraggedMotionEvent(x, y, deviceId, modifiers)
        if self.touchButtonProcessing then
            self.touchButtonRecognizer:pressTouchButtonInput(x, y, deviceId)
        end
        if not (self.touchButtonProcessing) then
            local point = AllMotionRecognizer.pointCircularPool:getNextInstance()
            point:setX(x)
            point:setY(y)
            self.motionGestureRecognizer:processDraggedMotionEvent(point, deviceId, modifiers)
        end
end
java_overload(AllMotionRecognizer, "processDraggedMotionEvent", 4, function(java_a1, java_a2, java_a3, java_a4) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" end)


-- throws Exception
function AllMotionRecognizer:processMovedMotionEvent(x, y, deviceId, modifiers)
        if not rawequal(x, self.lastX) or not rawequal(y, self.lastY) then
            self.lastX = x
            self.lastY = y
            local point = AllMotionRecognizer.pointCircularPool:getNextInstance()
            point:setX(x)
            point:setY(y)
            self.motionGestureRecognizer:processMovedMotionEvent(point, deviceId, modifiers)
        end
end
java_overload(AllMotionRecognizer, "processMovedMotionEvent", 4, function(java_a1, java_a2, java_a3, java_a4) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" end)


-- throws Exception
function AllMotionRecognizer:processScrolledMotionEvent(x, y, deviceId, modifiers)
        local point = AllMotionRecognizer.pointCircularPool:getNextInstance()
        point:setX(x)
        point:setY(y)
        self.motionGestureRecognizer:processScrolledMotionEvent(point, deviceId, modifiers)
end
java_overload(AllMotionRecognizer, "processScrolledMotionEvent", 4, function(java_a1, java_a2, java_a3, java_a4) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" end)


function AllMotionRecognizer:getMotionGestureRecognizer()
        return self.motionGestureRecognizer
end
java_overload(AllMotionRecognizer, "getMotionGestureRecognizer", 0)

AllMotionRecognizer.index = 0
AllMotionRecognizer.pointCircularPool = GPointCircularPool.new(40)

return AllMotionRecognizer

