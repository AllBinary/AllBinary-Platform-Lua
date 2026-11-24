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

local SelectionHudPaintable = {}
package.loaded["org.allbinary.game.layer.SelectionHudPaintable"] = SelectionHudPaintable

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
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local Animation = java_lazy("org.allbinary.animation.Animation")
local NullAnimationFactory = java_lazy("org.allbinary.animation.NullAnimationFactory")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = java_lazy("org.allbinary.graphics.font.UpdateMyFontProcessor")
local InitUpdatePaintable = require("org.allbinary.graphics.paint.InitUpdatePaintable")
local CommonButtons = java_lazy("org.allbinary.input.motion.button.CommonButtons")
local TouchButtonLocationHelper = java_lazy("org.allbinary.input.motion.button.TouchButtonLocationHelper")
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

-- class table SelectionHudPaintable is declared before the requires
SelectionHudPaintable.__index = SelectionHudPaintable
SelectionHudPaintable.className = "SelectionHudPaintable"
SelectionHudPaintable.javaClassName = "org.allbinary.game.layer.SelectionHudPaintable"
setmetatable(SelectionHudPaintable, {__index = InitUpdatePaintable})
SelectionHudPaintable.java_implements = " UpdateMyFontInterface "
SelectionHudPaintable.java_interfaces = function() return {UpdateMyFontInterface} end

function SelectionHudPaintable:_init_fields()
    self.y = CommonButtons.getInstance().STANDARD_BUTTON_SIZE + 17
    if self.primitiveLongUtil == nil then self.primitiveLongUtil = nil end
    self.updateMyFontProcessor = UpdateMyFontProcessor.new(self)
    self.myFontProcessor = self.updateMyFontProcessor
    if self.x == nil then self.x = 0 end
    if self.textX == nil then self.textX = 0 end
    if self.imageX == nil then self.imageX = 0 end
    self.basicColor = BasicColorFactory.getInstance().BLACK
    if self.color == nil then self.color = 0 end
    if self.width == nil then self.width = 0 end
    if self.height == nil then self.height = 0 end
    self.name_f = StringUtil.getInstance().EMPTY_STRING
    self.animationInterface = NullAnimationFactory.getFactoryInstance():getInstance(0)
    self.backgroundColor = math.tointeger(BasicColorFactory.getInstance().GREY // 1)
end


function SelectionHudPaintable._jinit(self)
    java_super_init(InitUpdatePaintable, self)
    SelectionHudPaintable._init_fields(self)
        self:update()
        self.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(10000)
    return self
end

function SelectionHudPaintable.new(...)
    local self = setmetatable({}, SelectionHudPaintable)
    SelectionHudPaintable._jinit(self, ...)
    return self
end


function SelectionHudPaintable:updateMeasurement(graphics)
        local commonButtons = CommonButtons.getInstance()
        local font = graphics:getFont()
        self:setHeight(commonButtons.STANDARD_BUTTON_SIZE + font:getHeight())
        self.myFontProcessor = MyFontProcessor.getInstance()
end
java_overload(SelectionHudPaintable, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function SelectionHudPaintable:update()
        local commonButtons = CommonButtons.getInstance()
        local touchButtonLocationHelper = TouchButtonLocationHelper.new()
        local displayInfoSingleton = DisplayInfoSingleton.getInstance()
        self.x = commonButtons.STANDARD_BUTTON_SIZE + touchButtonLocationHelper:getColumnsRemainderHalf()
        self.textX = self:getX() + 4
        self.width = displayInfoSingleton:getLastWidth() - self:getX() * 2
        self.imageX = self:getWidth() + touchButtonLocationHelper:getColumnsRemainderHalf() - 10
        self.myFontProcessor = self.updateMyFontProcessor
end
java_overload(SelectionHudPaintable, "update", 0)


function SelectionHudPaintable:updateSelectionInfo()
end
java_overload(SelectionHudPaintable, "updateSelectionInfo", 0)


function SelectionHudPaintable:updateInfo()
end
java_overload(SelectionHudPaintable, "updateInfo", 0)


function SelectionHudPaintable:getPrimitiveLongUtil()
        return self.primitiveLongUtil
end
java_overload(SelectionHudPaintable, "getPrimitiveLongUtil", 0)


function SelectionHudPaintable:setAnimationInterface(animationInterface)
        self.animationInterface = animationInterface
end
java_overload(SelectionHudPaintable, "setAnimationInterface", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Animation")) end)


function SelectionHudPaintable:getAnimationInterface()
        return self.animationInterface
end
java_overload(SelectionHudPaintable, "getAnimationInterface", 0)


function SelectionHudPaintable:setName(name)
        self.name_f = name
end
java_overload(SelectionHudPaintable, "setName", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function SelectionHudPaintable:getName()
        return self.name_f
end
java_overload(SelectionHudPaintable, "getName", 0)


function SelectionHudPaintable:setBasicColorP(basicColor)
        self.basicColor = basicColor
        self:setColor(math.tointeger(basicColor // 1))
end
java_overload(SelectionHudPaintable, "setBasicColorP", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicColor")) end)


function SelectionHudPaintable:getBasicColorP()
        return self.basicColor
end
java_overload(SelectionHudPaintable, "getBasicColorP", 0)


function SelectionHudPaintable:setColor(color)
        self.color = color
end
java_overload(SelectionHudPaintable, "setColor", 1, function(java_a1) return true and type(java_a1) == "number" end)


function SelectionHudPaintable:getColor()
        return self.color
end
java_overload(SelectionHudPaintable, "getColor", 0)


function SelectionHudPaintable:getWidth()
        return self.width
end
java_overload(SelectionHudPaintable, "getWidth", 0)


function SelectionHudPaintable:setHeight(height)
        self.height = height
end
java_overload(SelectionHudPaintable, "setHeight", 1, function(java_a1) return true and type(java_a1) == "number" end)


function SelectionHudPaintable:getHeight()
        return self.height
end
java_overload(SelectionHudPaintable, "getHeight", 0)


function SelectionHudPaintable:getX()
        return self.x
end
java_overload(SelectionHudPaintable, "getX", 0)


function SelectionHudPaintable:paint(graphics)
        self.myFontProcessor:process(graphics)
        graphics:setColor(self.backgroundColor)
        graphics:drawRect(self:getX(), self.y, self:getWidth(), self:getHeight())
        graphics:setColor(self:getColor())
        graphics:drawString(self:getName(), self.textX, self.y, 0)
end
java_overload(SelectionHudPaintable, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

return SelectionHudPaintable

