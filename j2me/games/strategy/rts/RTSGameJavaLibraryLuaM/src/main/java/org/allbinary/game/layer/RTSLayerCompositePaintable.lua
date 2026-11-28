-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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
-- package org.allbinary.game.layer

local RTSLayerCompositePaintable = {}
package.loaded["org.allbinary.game.layer.RTSLayerCompositePaintable"] = RTSLayerCompositePaintable

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
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local RTSLayer = java_lazy("org.allbinary.game.layer.RTSLayer")
local UpgradableRTSLayerHudPaintable = java_lazy("org.allbinary.game.layer.UpgradableRTSLayerHudPaintable")

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

-- class table RTSLayerCompositePaintable is declared before the requires
RTSLayerCompositePaintable.__index = RTSLayerCompositePaintable
RTSLayerCompositePaintable.className = "RTSLayerCompositePaintable"
RTSLayerCompositePaintable.javaClassName = "org.allbinary.game.layer.RTSLayerCompositePaintable"
setmetatable(RTSLayerCompositePaintable, {__index = Paintable})

function RTSLayerCompositePaintable:_init_fields()
    self.upgradeCost = StringUtil.getInstance().EMPTY_STRING
    self.downGradeCost = StringUtil.getInstance().EMPTY_STRING
    self.UPGRADE = "Up: $"
    self.DOWNGRADE = "Down: $-"
    if self.upgradableRTSLayerHudPaintable == nil then self.upgradableRTSLayerHudPaintable = nil end
end


function RTSLayerCompositePaintable._jinit(self, upgradableRTSLayerHudPaintable)
    java_super_init(Paintable, self)
    RTSLayerCompositePaintable._init_fields(self)
        self.upgradableRTSLayerHudPaintable = upgradableRTSLayerHudPaintable
    return self
end

function RTSLayerCompositePaintable.new(...)
    local self = setmetatable({}, RTSLayerCompositePaintable)
    RTSLayerCompositePaintable._jinit(self, ...)
    return self
end


function RTSLayerCompositePaintable:update(rtsLayer)
        if rtsLayer:isUpgradeable() then
            self:setUpgradeCost(tostring(StringMaker.new():append(self.UPGRADE):appendint(java_int(rtsLayer:getUpgradeCost()))))
        else
            self:setUpgradeCost(StringUtil.getInstance().EMPTY_STRING)
        end
        if rtsLayer:isDowngradeable() then
            self:setDownGradeCost(tostring(StringMaker.new():append(self.DOWNGRADE):appendint(java_int(rtsLayer:getDowngradeCost()))))
        else
            self:setDownGradeCost(StringUtil.getInstance().EMPTY_STRING)
        end
end
java_overload(RTSLayerCompositePaintable, "update", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSLayer")) end)


function RTSLayerCompositePaintable:paint(graphics)
        graphics:drawString(self:getDownGradeCost(), self.upgradableRTSLayerHudPaintable.textX, self.upgradableRTSLayerHudPaintable.costY1, 0)
        graphics:drawString(self:getUpgradeCost(), self.upgradableRTSLayerHudPaintable.textX, self.upgradableRTSLayerHudPaintable.costY, 0)
end
java_overload(RTSLayerCompositePaintable, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function RTSLayerCompositePaintable:setUpgradeCost(upgradeCost)
        self.upgradeCost = upgradeCost
end
java_overload(RTSLayerCompositePaintable, "setUpgradeCost", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function RTSLayerCompositePaintable:getUpgradeCost()
        return self.upgradeCost
end
java_overload(RTSLayerCompositePaintable, "getUpgradeCost", 0)


function RTSLayerCompositePaintable:setDownGradeCost(downGradeCost)
        self.downGradeCost = downGradeCost
end
java_overload(RTSLayerCompositePaintable, "setDownGradeCost", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function RTSLayerCompositePaintable:getDownGradeCost()
        return self.downGradeCost
end
java_overload(RTSLayerCompositePaintable, "getDownGradeCost", 0)

return RTSLayerCompositePaintable

