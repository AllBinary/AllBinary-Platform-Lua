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
-- package org.allbinary.graphics.form.item

local CustomTextBox = {}
package.loaded["org.allbinary.graphics.form.item.CustomTextBox"] = CustomTextBox

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

-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local J2MEUtil = java_lazy("org.allbinary.J2MEUtil")
local GameCommandCanvas = require("org.allbinary.game.displayable.canvas.GameCommandCanvas")
local Input = java_lazy("org.allbinary.game.input.Input")
local InputFactory = java_lazy("org.allbinary.game.input.InputFactory")
local PlatformKeyFactory = java_lazy("org.allbinary.game.input.PlatformKeyFactory")
local RawKeyEventListener = java_lazy("org.allbinary.game.input.event.RawKeyEventListener")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local TextItemVisitor = java_lazy("org.allbinary.graphics.form.item.validation.TextItemVisitor")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local ABTextFieldItem = java_lazy("org.allbinary.graphics.form.item.ABTextFieldItem")

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

-- class table CustomTextBox is declared before the requires
CustomTextBox.__index = CustomTextBox
CustomTextBox.className = "CustomTextBox"
CustomTextBox.javaClassName = "org.allbinary.graphics.form.item.CustomTextBox"
setmetatable(CustomTextBox, {__index = GameCommandCanvas})
CustomTextBox.java_implements = " RawKeyEventListener "
CustomTextBox.java_interfaces = function() return {RawKeyEventListener} end

function CustomTextBox:_init_fields()
    if self.textFieldItem == nil then self.textFieldItem = nil end
    self.inputFactory = InputFactory.getInstance()
end


function CustomTextBox._jinit(self, cmdListener, label, text, maxSize, constraints, font, backgroundBasicColor, foregroundBasicColor)
    java_super_init(GameCommandCanvas, self, cmdListener, label, backgroundBasicColor, foregroundBasicColor)
    CustomTextBox._init_fields(self)
        -- super(...) made self above
        local stringUtil = StringUtil.getInstance()
        local textFieldItem = ABTextFieldItem.new(self, TextItemVisitor.new(), stringUtil.EMPTY_STRING, stringUtil.EMPTY_STRING, maxSize, 0, stringUtil.EMPTY_STRING, font, backgroundBasicColor, foregroundBasicColor)
        textFieldItem:setString(text)
        self.textFieldItem = textFieldItem
        self:setTitle(label)
    return self
end

function CustomTextBox.new(...)
    local self = setmetatable({}, CustomTextBox)
    CustomTextBox._jinit(self, ...)
    return self
end


function CustomTextBox:submit()
end
java_overload(CustomTextBox, "submit", 0)


function CustomTextBox:onEventRaw(keyCode, deviceId, repeated)
        self.logUtil:putF(tostring(StringMaker.new():append(self.commonStrings.START):appendint(keyCode)), self, "onEvent")
        self:keyPressedByDevice(keyCode, deviceId)
end
java_overload(CustomTextBox, "onEventRaw", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "boolean" end)


function CustomTextBox:keyPressed(keyCode)
        self:keyPressedByDevice(keyCode, 0)
end
java_overload(CustomTextBox, "keyPressed", 1, function(java_a1) return true and type(java_a1) == "number" end)


function CustomTextBox:keyReleased(keyCode)
        self:keyReleasedByDevice(keyCode, 0)
end
java_overload(CustomTextBox, "keyReleased", 1, function(java_a1) return true and type(java_a1) == "number" end)


function CustomTextBox:keyRepeated(keyCode)
        self:keyRepeatedByDevice(keyCode, 0)
end
java_overload(CustomTextBox, "keyRepeated", 1, function(java_a1) return true and type(java_a1) == "number" end)


function CustomTextBox:keyPressedByDevice(keyCode, deviceId)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(tostring(StringMaker.new():append(CommonSeps.getInstance().SPACE):appendint(keyCode)), self, self.gameInputStrings.KEY_PRESSED)
            local platformKeyFactory = PlatformKeyFactory.getInstance()
            local input = self.inputFactory:getInstanceById(keyCode)
            if platformKeyFactory:isSubmission(input) then
                self:submit()
            else
                self.textFieldItem:keyPressed(keyCode)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.gameInputStrings.KEY_PRESSED, e)
        end
end
java_overload(CustomTextBox, "keyPressedByDevice", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function CustomTextBox:keyReleasedByDevice(keyCode, deviceId)
end
java_overload(CustomTextBox, "keyReleasedByDevice", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function CustomTextBox:paint(graphics)
        graphics:setColor(self.backgroundColor)
        graphics:fillRect(0, 0, self.displayInfo:getLastWidth(), self.displayInfo:getLastHeight())
        graphics:setColor(self.foregroundColor)
        if not J2MEUtil.isJ2ME() then
            graphics:drawString(self:getTitle(), 8, 1, 0)
        end
        self:paintXY(graphics, 8, graphics:getFont():getHeight() + 2)
        java_super(GameCommandCanvas, "paint", 1)(self, graphics)
end
java_overload(CustomTextBox, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function CustomTextBox:paintXY(graphics, x, y)
        self.textFieldItem:paintXY(graphics, x, y)
end
java_overload(CustomTextBox, "paintXY", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and type(java_a3) == "number" end)


function CustomTextBox:getTextFieldItem()
        return self.textFieldItem
end
java_overload(CustomTextBox, "getTextFieldItem", 0)

return CustomTextBox

