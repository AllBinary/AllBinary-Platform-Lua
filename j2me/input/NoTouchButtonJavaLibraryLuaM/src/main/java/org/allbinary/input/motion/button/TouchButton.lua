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
-- package org.allbinary.input.motion.button

local TouchButton = {}
package.loaded["org.allbinary.input.motion.button.TouchButton"] = TouchButton

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
local Animation = java_lazy("org.allbinary.animation.Animation")
local AnimationInterface = java_lazy("org.allbinary.animation.AnimationInterface")
local CellPosition = java_lazy("org.allbinary.graphics.CellPosition")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local RectangleFactory = java_lazy("org.allbinary.graphics.RectangleFactory")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local TouchButtonInput = java_lazy("org.allbinary.input.motion.button.TouchButtonInput")

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

-- class table TouchButton is declared before the requires
TouchButton.__index = TouchButton
TouchButton.className = "TouchButton"
TouchButton.javaClassName = "org.allbinary.input.motion.button.TouchButton"
setmetatable(TouchButton, {__index = Paintable})

function TouchButton:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.touchButtonInput == nil then self.touchButtonInput = nil end
    if self.animationInterface == nil then self.animationInterface = nil end
    if self.rawRectangle == nil then self.rawRectangle = nil end
    if self.xBorder == nil then self.xBorder = 0 end
    if self.yBorder == nil then self.yBorder = 0 end
    self.rectangle = RectangleFactory.SINGLETON
    if self.cellPosition == nil then self.cellPosition = nil end
    if self.animationX == nil then self.animationX = 0 end
    if self.animationY == nil then self.animationY = 0 end
end


function TouchButton._jinit(self, touchButtonInput, animationInterface, rawRectangle, cellPosition, xBorder, yBorder)
    java_super_init(Paintable, self)
    TouchButton._init_fields(self)
        self.touchButtonInput = touchButtonInput
        self.animationInterface = animationInterface
        self.rawRectangle = rawRectangle
        self.cellPosition = cellPosition
        self.xBorder = xBorder
        self.yBorder = yBorder
        self:updateRectangle()
        self.logUtil:putF(tostring(StringMaker.new():append("Created: "):append(tostring(self))), self, self.commonStrings.CONSTRUCTOR)
    return self
end

function TouchButton.new(...)
    local self = setmetatable({}, TouchButton)
    TouchButton._jinit(self, ...)
    return self
end


function TouchButton:paint(graphics)
        self.animationInterface:paintXY(graphics, self.animationX, self.animationY)
end
java_overload(TouchButton, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function TouchButton:updateRectangle()
        local try_ok, try_error, try_value = pcall(function()
            local x = self.rawRectangle:getWidth() * self.cellPosition:getColumn()
            local y = self.rawRectangle:getHeight() * self.cellPosition:getRow()
            local pointFactory = PointFactory.getInstance()
            self.rectangle = Rectangle.new(pointFactory:createXY(x + self.xBorder, y + self.yBorder), self.rawRectangle:getWidth(), self.rawRectangle:getHeight())
            local point = self.rectangle:getPoint()
            self.animationX = point:getX()
            self.animationY = point:getY()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "updateRectangle", e)
        end
end
java_overload(TouchButton, "updateRectangle", 0)


function TouchButton:getCellPositionP()
        return self.cellPosition
end
java_overload(TouchButton, "getCellPositionP", 0)


function TouchButton:getRectangleP()
        return self.rectangle
end
java_overload(TouchButton, "getRectangleP", 0)


function TouchButton:getTouchButtonInput()
        return self.touchButtonInput
end
java_overload(TouchButton, "getTouchButtonInput", 0)


function TouchButton:toString()
        local stringBuffer = StringMaker.new()
        local stringUtil = StringUtil.getInstance()
        stringBuffer:append("TouchButton: ")
        stringBuffer:append(stringUtil:toString(self.rectangle))
        stringBuffer:append(" CellPosition: ")
        stringBuffer:append(stringUtil:toString(self.cellPosition))
        stringBuffer:append(" xBorder: ")
        stringBuffer:appendint(self.xBorder)
        stringBuffer:append(" yBorder: ")
        stringBuffer:appendint(self.yBorder)
        return tostring(stringBuffer)
end
java_overload(TouchButton, "toString", 0)
TouchButton.__tostring = function(self) return self:toString() end

return TouchButton

