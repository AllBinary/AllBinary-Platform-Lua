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
-- package org.allbinary.game.paint

local BasicGameDemoPaintable = {}
package.loaded["org.allbinary.game.paint.BasicGameDemoPaintable"] = BasicGameDemoPaintable

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

local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local NullPaintable = java_lazy("org.allbinary.graphics.paint.NullPaintable")
local Paintable = java_lazy("org.allbinary.graphics.paint.Paintable")
local StatePaintable = require("org.allbinary.graphics.paint.StatePaintable")

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

-- class table BasicGameDemoPaintable is declared before the requires
BasicGameDemoPaintable.__index = BasicGameDemoPaintable
BasicGameDemoPaintable.className = "BasicGameDemoPaintable"
BasicGameDemoPaintable.javaClassName = "org.allbinary.game.paint.BasicGameDemoPaintable"
setmetatable(BasicGameDemoPaintable, {__index = StatePaintable})

function BasicGameDemoPaintable:_init_fields()
    if self.mainDemoStatePaintable == nil then self.mainDemoStatePaintable = nil end
    if self.ownershipPaintable == nil then self.ownershipPaintable = nil end
    if self.helpPaintableInterface == nil then self.helpPaintableInterface = nil end
    self.currentStatePaintable = NullPaintable.getInstance()
end


function BasicGameDemoPaintable._jinit(self, mainDemoStatePaintable, ownershipPaintable, helpPaintableInterface)
    java_super_init(StatePaintable, self)
    BasicGameDemoPaintable._init_fields(self)
        self.mainDemoStatePaintable = mainDemoStatePaintable
        self:setCurrentStatePaintable(NullPaintable.getInstance())
        self.ownershipPaintable = ownershipPaintable
        self.helpPaintableInterface = helpPaintableInterface
    return self
end

function BasicGameDemoPaintable.new(...)
    local self = setmetatable({}, BasicGameDemoPaintable)
    BasicGameDemoPaintable._jinit(self, ...)
    return self
end


function BasicGameDemoPaintable:setState(state)
        if rawequal(state, 0) then
            self:setCurrentStatePaintable(self:getMainDemoStatePaintable())
        elseif rawequal(state, 1) then
            self:setCurrentStatePaintable(self.helpPaintableInterface)
        else
            self:setCurrentStatePaintable(self.ownershipPaintable)
        end
end
java_overload(BasicGameDemoPaintable, "setState", 1, function(java_a1) return true and type(java_a1) == "number" end)


function BasicGameDemoPaintable:paint(graphics)
        self:getCurrentStatePaintable():paint(graphics)
end
java_overload(BasicGameDemoPaintable, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function BasicGameDemoPaintable:getHelpPaintableInterface()
        return self.helpPaintableInterface
end
java_overload(BasicGameDemoPaintable, "getHelpPaintableInterface", 0)


function BasicGameDemoPaintable:setCurrentStatePaintable(currentStatePaintable)
        self.currentStatePaintable = currentStatePaintable
end
java_overload(BasicGameDemoPaintable, "setCurrentStatePaintable", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Paintable")) end)


function BasicGameDemoPaintable:getCurrentStatePaintable()
        return self.currentStatePaintable
end
java_overload(BasicGameDemoPaintable, "getCurrentStatePaintable", 0)


function BasicGameDemoPaintable:getMainDemoStatePaintable()
        return self.mainDemoStatePaintable
end
java_overload(BasicGameDemoPaintable, "getMainDemoStatePaintable", 0)

return BasicGameDemoPaintable

