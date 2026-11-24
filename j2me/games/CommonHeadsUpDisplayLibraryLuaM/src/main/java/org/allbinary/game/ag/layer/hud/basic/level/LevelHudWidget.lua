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
-- package org.allbinary.game.ag.layer.hud.basic.level

local LevelHudWidget = {}
package.loaded["org.allbinary.game.ag.layer.hud.basic.level.LevelHudWidget"] = LevelHudWidget

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
local BasicHud = require("org.allbinary.game.graphics.hud.BasicHud")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local PaintableInterface = java_lazy("org.allbinary.graphics.paint.PaintableInterface")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
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

local function java_chars(text)
    local chars = {}
    for index = 1, #text do chars[index] = string.sub(text, index, index) end
    return chars
end

-- class table LevelHudWidget is declared before the requires
LevelHudWidget.__index = LevelHudWidget
LevelHudWidget.className = "LevelHudWidget"
LevelHudWidget.javaClassName = "org.allbinary.game.ag.layer.hud.basic.level.LevelHudWidget"
setmetatable(LevelHudWidget, {__index = BasicHud})
LevelHudWidget.java_implements = " PaintableInterface "
LevelHudWidget.java_interfaces = function() return {PaintableInterface} end

function LevelHudWidget:_init_fields()
    if self.level == nil then self.level = nil end
    if self.maxlevel == nil then self.maxlevel = nil end
    if self.levelString == nil then self.levelString = nil end
    self.levelNumberCharArray = NullUtil.getInstance().NULL_CHAR_ARRAY
    if self.levelNumberTotalDigits == nil then self.levelNumberTotalDigits = 0 end
    if self.offset == nil then self.offset = 0 end
    if self.primitiveLongUtil == nil then self.primitiveLongUtil = nil end
end


-- throws Exception
function LevelHudWidget.createHud(maxlevel, location, direction)
        return LevelHudWidget.new(maxlevel, location, direction)
end


function LevelHudWidget._jinit(self, maxlevel, location, direction)
    java_super_init(BasicHud, self, location, direction, 2, BasicColorFactory.getInstance().GREY)
    LevelHudWidget._init_fields(self)
        -- super(...) made self above
        self.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(1000)
        local LEVEL = "Lv "
        self.levelString = java_chars(LEVEL)
        self.maxlevel = maxlevel
        self.level = maxlevel
        self:update()
        self.updateMaxHeight = 14
    return self
end

function LevelHudWidget.new(...)
    local self = setmetatable({}, LevelHudWidget)
    LevelHudWidget._jinit(self, ...)
    return self
end


function LevelHudWidget:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.updateMaxWidth = font:getSize() * 4
        self.offset = font:charsWidth(self.levelString, 0, (self.levelString.n or #self.levelString)) + font:getSize()
        java_super(BasicHud, "updateMeasurement", 1)(self, graphics)
end
java_overload(LevelHudWidget, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function LevelHudWidget:update()
        self.levelNumberCharArray = self.primitiveLongUtil:getCharArray(self.level)
        self.levelNumberTotalDigits = self.primitiveLongUtil:getCurrentTotalDigits()
end
java_overload(LevelHudWidget, "update", 0)


function LevelHudWidget:setLevel(level)
        self.level = level
        self:update()
end
java_overload(LevelHudWidget, "setLevel", 1, function(java_a1) return true and type(java_a1) == "number" end)


function LevelHudWidget:nextLevel()
        self.level = self.level + 1
        self:update()
end
java_overload(LevelHudWidget, "nextLevel", 0)


function LevelHudWidget:previousLevel()
        self.level = self.level - 1
        if self.level < 0 then
            self.level = 0
        end
        self:update()
end
java_overload(LevelHudWidget, "previousLevel", 0)


function LevelHudWidget:isComplete()
        if self.level <= self.maxlevel then
            return false
        else
            return true
        end
end
java_overload(LevelHudWidget, "isComplete", 0)


function LevelHudWidget:paint(graphics)
        java_super(BasicHud, "paintDX", 8)(self, graphics, self.levelString, 0, (self.levelString.n or #self.levelString), self.levelNumberCharArray, 0, self.levelNumberTotalDigits, self.offset)
end
java_overload(LevelHudWidget, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function LevelHudWidget:paintThreed(graphics)
end
java_overload(LevelHudWidget, "paintThreed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

return LevelHudWidget

