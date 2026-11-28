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
-- package org.allbinary.game.displayable.canvas

local BasicPopupMenuPaintable = {}
package.loaded["org.allbinary.game.displayable.canvas.BasicPopupMenuPaintable"] = BasicPopupMenuPaintable

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

local Font = java_lazy("javax.microedition.lcdui.Font")
local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local AndroidUtil = java_lazy("org.allbinary.AndroidUtil")
local J2MEUtil = java_lazy("org.allbinary.J2MEUtil")
local Animation = java_lazy("org.allbinary.animation.Animation")
local NullAnimationFactory = java_lazy("org.allbinary.animation.NullAnimationFactory")
local RectangleFilledAnimation = java_lazy("org.allbinary.animation.vector.RectangleFilledAnimation")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local SWTUtil = java_lazy("org.allbinary.game.layer.SWTUtil")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local BasicColorSetUtil = java_lazy("org.allbinary.graphics.color.BasicColorSetUtil")
local DrawVerticalStringUtil = java_lazy("org.allbinary.graphics.draw.DrawVerticalStringUtil")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = java_lazy("org.allbinary.graphics.font.UpdateMyFontProcessor")
local OpenGLFeatureFactory = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local OpenGLFeatureUtil = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureUtil")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local SWTJOGLProcessor = java_lazy("org.allbinary.graphics.threed.SWTJOGLProcessor")

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

-- class table BasicPopupMenuPaintable is declared before the requires
BasicPopupMenuPaintable.__index = BasicPopupMenuPaintable
BasicPopupMenuPaintable.className = "BasicPopupMenuPaintable"
BasicPopupMenuPaintable.javaClassName = "org.allbinary.game.displayable.canvas.BasicPopupMenuPaintable"
setmetatable(BasicPopupMenuPaintable, {__index = Paintable})
BasicPopupMenuPaintable.java_implements = " UpdateMyFontInterface "
BasicPopupMenuPaintable.java_interfaces = function() return {UpdateMyFontInterface} end

function BasicPopupMenuPaintable:_init_fields()
    self.basicSetColorUtil = BasicColorSetUtil.getInstance()
    self.drawStringUtil = DrawVerticalStringUtil.getInstance()
    if self.label == nil then self.label = nil end
    if self.foregroundBasicColor == nil then self.foregroundBasicColor = nil end
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    if self.rectangle == nil then self.rectangle = nil end
    if self.BORDER == nil then self.BORDER = 0 end
    if self.heightOffset == nil then self.heightOffset = 0 end
    if self.offset == nil then self.offset = 0 end
    if self.animationInterface == nil then self.animationInterface = nil end
end


function BasicPopupMenuPaintable._jinit(self, rectangle, backgroundBasicColor, foregroundBasicColor)
    java_super_init(Paintable, self)
    BasicPopupMenuPaintable._init_fields(self)
        self.foregroundBasicColor = foregroundBasicColor
        self.label = BasicPopupMenuPaintable.NAME
        self.rectangle = rectangle
        if J2MEUtil.isJ2ME() or J2MEUtil.isHTML() then
            self.animationInterface = NullAnimationFactory.getFactoryInstance():getInstance(0)
        else
            self.animationInterface = RectangleFilledAnimation.new(self.rectangle:getWidth(), self.rectangle:getHeight(), BasicColorFactory.getInstance().TRANSPARENT_GREY)
        end
        self:init(rectangle)
    return self
end

function BasicPopupMenuPaintable.new(...)
    local self = setmetatable({}, BasicPopupMenuPaintable)
    BasicPopupMenuPaintable._jinit(self, ...)
    return self
end


function BasicPopupMenuPaintable:updateMeasurement(graphics)
        local font = graphics:getFont()
        local features = Features.getInstance()
        local isOpenGL = features:isDefault(OpenGLFeatureFactory.getInstance().OPENGL)
        self.drawStringUtil:updateMeasurement(graphics, self.label)
        local BORDER = 0
        if J2MEUtil.isHTML() or isOpenGL then
            BORDER = MyFontProcessor.defaultCharWidth(font) / 2
        elseif AndroidUtil.isAndroid() or J2MEUtil.isJ2SE() or SWTUtil.isSWT then
            BORDER = MyFontProcessor.defaultCharWidth(font)
        else
            BORDER = MyFontProcessor.defaultCharWidth(font) * 2
        end
        self.BORDER = BORDER
        self.heightOffset = self.rectangle:getHeight() - (font:getHeight() * BasicPopupMenuPaintable.NAME:length())
        if OpenGLFeatureUtil.getInstance():isAnyThreed() then
            self.heightOffset = self.heightOffset - (font:getHeight() + 2)
            if AndroidUtil.isAndroid() then
                self.heightOffset = font:getHeight()
            else
                self.heightOffset = self.heightOffset - (font:getHeight() + 2)
            end
        end
        self.offset = (((self.heightOffset) // (1 << (1)))) + ((function() if SWTJOGLProcessor.getInstance():isJOGL() then return 4 else return 0 end end)())
        self.myFontProcessor = MyFontProcessor.getInstance()
end
java_overload(BasicPopupMenuPaintable, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


-- throws Exception
function BasicPopupMenuPaintable:init(rectangle)
        self.rectangle = rectangle
        local width = self.rectangle:getWidth()
        local height = self.rectangle:getHeight()
        if J2MEUtil.isJ2ME() or J2MEUtil.isHTML() then
        else
            local rectangleFilledAnimation = self.animationInterface
            rectangleFilledAnimation:setWidth(width)
            rectangleFilledAnimation:setHeight(height)
        end
end
java_overload(BasicPopupMenuPaintable, "init", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Rectangle")) end)


function BasicPopupMenuPaintable:paint(graphics)
        self.myFontProcessor:process(graphics)
        local point = self.rectangle:getPoint()
        local x = point:getX()
        local y = point:getY()
        local width = self.rectangle:getWidth()
        local height = self.rectangle:getHeight()
        self.animationInterface:paintXY(graphics, x, y)
        self.basicSetColorUtil:setBasicColorP(graphics, self.foregroundBasicColor)
        self.drawStringUtil:paintVerticle(graphics, self.label, x + self.BORDER, y + self.offset, 0)
        graphics:drawRect(x, y, width, height)
end
java_overload(BasicPopupMenuPaintable, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

BasicPopupMenuPaintable.NAME = "MENU"

return BasicPopupMenuPaintable

