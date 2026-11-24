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

local PressStartMenuPaintable = {}
package.loaded["org.allbinary.game.paint.PressStartMenuPaintable"] = PressStartMenuPaintable

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
local AppletUtil = java_lazy("org.allbinary.AppletUtil")
local Anchor = java_lazy("org.allbinary.graphics.Anchor")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = java_lazy("org.allbinary.graphics.font.UpdateMyFontProcessor")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local TouchScreenFactory = java_lazy("org.allbinary.input.motion.button.TouchScreenFactory")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")

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

-- class table PressStartMenuPaintable is declared before the requires
PressStartMenuPaintable.__index = PressStartMenuPaintable
PressStartMenuPaintable.className = "PressStartMenuPaintable"
PressStartMenuPaintable.javaClassName = "org.allbinary.game.paint.PressStartMenuPaintable"
setmetatable(PressStartMenuPaintable, {__index = Paintable})
PressStartMenuPaintable.java_implements = " UpdateMyFontInterface "
PressStartMenuPaintable.java_interfaces = function() return {UpdateMyFontInterface} end

function PressStartMenuPaintable:_init_fields()
    self.displayInfo = DisplayInfoSingleton.getInstance()
    self.PRESS_START = "Press Screen To Start"
    self.KEY_START = "Press or Click F2 To Begin"
    self.MENU_START = "Press Start From The Menu To Begin"
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.startString = StringUtil.getInstance().EMPTY_STRING
    self.timeDelayHelper = TimeDelayHelper.new(1100)
    if self.flash == nil then self.flash = false end
    self.anchor = Anchor.TOP_LEFT
    if self.beginWidth == nil then self.beginWidth = 0 end
    if self.line == nil then self.line = 0 end
end


function PressStartMenuPaintable._jinit(self)
    java_super_init(Paintable, self)
    PressStartMenuPaintable._init_fields(self)
        if TouchScreenFactory.getInstance():isTouch() then
            self.startString = self.PRESS_START
        elseif AppletUtil.isAppletLoader(self) then
            self.startString = self.KEY_START
        else
            self.startString = self.MENU_START
        end
    return self
end

function PressStartMenuPaintable.new(...)
    local self = setmetatable({}, PressStartMenuPaintable)
    PressStartMenuPaintable._jinit(self, ...)
    return self
end


function PressStartMenuPaintable:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.beginWidth = (((graphics:getFont():stringWidth(self.startString)) // (1 << (1))))
        self.line = (4 * MyFontProcessor.defaultCharWidth(font)) + (((font:getHeight()) // (1 << (1))))
        self.myFontProcessor = MyFontProcessor.getInstance()
end
java_overload(PressStartMenuPaintable, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function PressStartMenuPaintable:paint(graphics)
        if self.timeDelayHelper:isTimeTNT() then
            if self:isFlash() then
                self:setFlash(false)
            else
                self:setFlash(true)
            end
        end
        if self:isFlash() then
            self.myFontProcessor:process(graphics)
            graphics:drawString(self.startString, self.displayInfo:getLastHalfWidth() - self.beginWidth, self.displayInfo:getLastHeight() - self.line, self.anchor)
        end
end
java_overload(PressStartMenuPaintable, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function PressStartMenuPaintable:setFlash(flash)
        self.flash = flash
end
java_overload(PressStartMenuPaintable, "setFlash", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function PressStartMenuPaintable:isFlash()
        return self.flash
end
java_overload(PressStartMenuPaintable, "isFlash", 0)

return PressStartMenuPaintable

