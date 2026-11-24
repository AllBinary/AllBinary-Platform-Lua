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
-- package org.allbinary.game.layer.hud.basic

local VelocityWidget = {}
package.loaded["org.allbinary.game.layer.hud.basic.VelocityWidget"] = VelocityWidget

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

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local OpenGLFeatureUtil = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureUtil")
local BasicHud = require("org.allbinary.game.graphics.hud.BasicHud")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local MathUtil = java_lazy("org.allbinary.logic.math.MathUtil")
local PrimitiveLongSingleton = java_lazy("org.allbinary.logic.math.PrimitiveLongSingleton")
local PrimitiveLongUtil = java_lazy("org.allbinary.logic.math.PrimitiveLongUtil")

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

-- class table VelocityWidget is declared before the requires
VelocityWidget.__index = VelocityWidget
VelocityWidget.className = "VelocityWidget"
VelocityWidget.javaClassName = "org.allbinary.game.layer.hud.basic.VelocityWidget"
setmetatable(VelocityWidget, {__index = BasicHud})

function VelocityWidget:_init_fields()
    self.KILOMETERS_PER_HOUR_STR = {" ", "k", "m", "/", "h"}
    self.totalChars = (self.KILOMETERS_PER_HOUR_STR.n or #self.KILOMETERS_PER_HOUR_STR)
    if self.velocity == nil then self.velocity = nil end
    if self.maxVelocity == nil then self.maxVelocity = nil end
    self.string_ = PrimitiveLongSingleton.getInstance().ZERO
    self.totalDigits = 1
    if self.powerOfTenVelocity == nil then self.powerOfTenVelocity = nil end
    if self.primitiveLongUtil == nil then self.primitiveLongUtil = nil end
    self.offset = 0
    self.offset2 = 0
end


function VelocityWidget._jinit(self, powerOfTenVelocity, location, direction, basicColor)
    java_super_init(BasicHud, self, location, direction, 2, basicColor)
    VelocityWidget._init_fields(self)
        -- super(...) made self above
        self.powerOfTenVelocity = powerOfTenVelocity
        self.maxVelocity = powerOfTenVelocity
        self.velocity = 0
        self.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(powerOfTenVelocity)
        self.updateMaxHeight = 14
    return self
end

function VelocityWidget.new(...)
    local self = setmetatable({}, VelocityWidget)
    VelocityWidget._jinit(self, ...)
    return self
end


function VelocityWidget:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.updateMaxWidth = font:getSize() * (5 + MathUtil.getInstance():getTotalDigits(self.powerOfTenVelocity) + 1)
        java_super(BasicHud, "updateMeasurement", 1)(self, graphics)
        self.offset = MyFontProcessor.defaultStringWidth(font, self.primitiveLongUtil:getMaxDigits()) + MyFontProcessor.defaultStringWidth(font, 2)
        self.offset2 = self.offset - MyFontProcessor.defaultStringWidth(font, self.totalDigits) - MyFontProcessor.defaultStringWidth(font, 2)
end
java_overload(VelocityWidget, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function VelocityWidget:get()
        return self.velocity
end
java_overload(VelocityWidget, "get", 0)


function VelocityWidget:add(value)
        self:set(self.velocity + value)
end
java_overload(VelocityWidget, "add", 1, function(java_a1) return true and type(java_a1) == "number" end)


function VelocityWidget:set(value)
        local lastVelocity = self.velocity
        self.velocity = value
        if self.velocity > self.maxVelocity then
            self.velocity = 0
        end
        if lastVelocity ~= self.velocity then
            self.string_ = self.primitiveLongUtil:getCharArray(self.velocity * 18)
            if OpenGLFeatureUtil.getInstance():isAnyThreed() then
                self.totalDigits = self.primitiveLongUtil:getCurrentTotalDigits() + 1
            else
                self.totalDigits = self.primitiveLongUtil:getCurrentTotalDigits()
            end
            self.myFontProcessor = self.updateMyFontProcessor
        end
end
java_overload(VelocityWidget, "set", 1, function(java_a1) return true and type(java_a1) == "number" end)


function VelocityWidget:reduce(value)
        self:set(self.velocity - value)
end
java_overload(VelocityWidget, "reduce", 1, function(java_a1) return true and type(java_a1) == "number" end)


function VelocityWidget:paint(graphics)
        java_super(BasicHud, "paintDXY", 9)(self, graphics, self.string_, 0, self.totalDigits, self.KILOMETERS_PER_HOUR_STR, 0, self.totalChars, self.offset2, self.offset)
end
java_overload(VelocityWidget, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

return VelocityWidget

