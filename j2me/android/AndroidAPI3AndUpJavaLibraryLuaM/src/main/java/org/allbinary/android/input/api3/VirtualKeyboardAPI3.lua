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
-- package org.allbinary.android.input.api3

local VirtualKeyboardAPI3 = {}
package.loaded["org.allbinary.android.input.api3.VirtualKeyboardAPI3"] = VirtualKeyboardAPI3

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

local Activity = java_lazy("android.app.Activity")
local VirtualKeyboard = require("org.allbinary.android.input.VirtualKeyboard")
local VirtualKeyboardEvent = java_lazy("org.allbinary.input.event.VirtualKeyboardEvent")
local VirtualKeyboardEventHandler = java_lazy("org.allbinary.input.event.VirtualKeyboardEventHandler")
local VirtualKeyboardEventListenerInterface = java_lazy("org.allbinary.input.event.VirtualKeyboardEventListenerInterface")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local HideVirtualKeyboardRunnable = java_lazy("org.allbinary.android.input.api3.HideVirtualKeyboardRunnable")
local ShowVirtualKeyboardRunnable = java_lazy("org.allbinary.android.input.api3.ShowVirtualKeyboardRunnable")

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

-- class table VirtualKeyboardAPI3 is declared before the requires
VirtualKeyboardAPI3.__index = VirtualKeyboardAPI3
VirtualKeyboardAPI3.className = "VirtualKeyboardAPI3"
VirtualKeyboardAPI3.javaClassName = "org.allbinary.android.input.api3.VirtualKeyboardAPI3"
setmetatable(VirtualKeyboardAPI3, {__index = VirtualKeyboard})
VirtualKeyboardAPI3.java_implements = " VirtualKeyboardEventListenerInterface "
VirtualKeyboardAPI3.java_interfaces = function() return {VirtualKeyboardEventListenerInterface} end

function VirtualKeyboardAPI3:_init_fields()
    if self.virtualKeyboard == nil then self.virtualKeyboard = false end
    if self.activity == nil then self.activity = nil end
    if self.showVirtualKeyboardRunnable == nil then self.showVirtualKeyboardRunnable = nil end
    if self.hideVirtualKeyboardRunnable == nil then self.hideVirtualKeyboardRunnable = nil end
end


function VirtualKeyboardAPI3._jinit(self, activity)
    java_super_init(VirtualKeyboard, self)
    VirtualKeyboardAPI3._init_fields(self)
        -- super(...) made self above
        self.activity = activity
        self.showVirtualKeyboardRunnable = ShowVirtualKeyboardRunnable.new(self.activity)
        self.hideVirtualKeyboardRunnable = HideVirtualKeyboardRunnable.new(self.activity)
        local virtualKeyboardEventHandler = VirtualKeyboardEventHandler.getInstance()
        virtualKeyboardEventHandler:removeAllListeners()
        virtualKeyboardEventHandler:addListenerInterface(self)
    return self
end

function VirtualKeyboardAPI3.new(...)
    local self = setmetatable({}, VirtualKeyboardAPI3)
    VirtualKeyboardAPI3._jinit(self, ...)
    return self
end


function VirtualKeyboardAPI3:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end
java_overload(VirtualKeyboardAPI3, "onEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryEventObject")) end)


function VirtualKeyboardAPI3:onVirtualKeyboardEvent(virtualKeyboardEvent)
        local isShow = virtualKeyboardEvent:getSource()
        if isShow then
            self:showVirtualKeyboard()
        else
            self:hideVirtualKeyboard()
        end
end
java_overload(VirtualKeyboardAPI3, "onVirtualKeyboardEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "VirtualKeyboardEvent")) end)


function VirtualKeyboardAPI3:forceHide()
        self:hideVirtualKeyboard()
end
java_overload(VirtualKeyboardAPI3, "forceHide", 0)


function VirtualKeyboardAPI3:hide()
        if self.virtualKeyboard then
            self:forceHide()
        end
end
java_overload(VirtualKeyboardAPI3, "hide", 0)


function VirtualKeyboardAPI3:showVirtualKeyboard()
        self.activity:runOnUiThread(self.showVirtualKeyboardRunnable)
        self.virtualKeyboard = true
end
java_overload(VirtualKeyboardAPI3, "showVirtualKeyboard", 0)


function VirtualKeyboardAPI3:hideVirtualKeyboard()
        self.activity:runOnUiThread(self.hideVirtualKeyboardRunnable)
        self.virtualKeyboard = false
end
java_overload(VirtualKeyboardAPI3, "hideVirtualKeyboard", 0)

VirtualKeyboardAPI3.MAX_API = require("java.lang.Integer").MAX_VALUE
VirtualKeyboardAPI3.MIN_API = 3

return VirtualKeyboardAPI3

