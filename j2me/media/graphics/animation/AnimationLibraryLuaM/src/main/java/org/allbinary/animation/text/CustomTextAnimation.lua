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
-- package org.allbinary.animation.text

local CustomTextAnimation = {}
package.loaded["org.allbinary.animation.text.CustomTextAnimation"] = CustomTextAnimation

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
local AnimationBehavior = java_lazy("org.allbinary.animation.AnimationBehavior")
local FontDebugFactory = java_lazy("org.allbinary.graphics.font.FontDebugFactory")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local TextAnimation = require("org.allbinary.animation.text.TextAnimation")
local TextInterface = require("org.allbinary.animation.text.TextInterface")
local TextChangeListener = java_lazy("org.allbinary.animation.text.TextChangeListener")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

-- class table CustomTextAnimation is declared before the requires
CustomTextAnimation.__index = CustomTextAnimation
CustomTextAnimation.className = "CustomTextAnimation"
CustomTextAnimation.javaClassName = "org.allbinary.animation.text.CustomTextAnimation"
setmetatable(CustomTextAnimation, {__index = TextAnimation})
CustomTextAnimation.java_implements = " TextInterface "
CustomTextAnimation.java_interfaces = function() return {TextInterface} end

function CustomTextAnimation:_init_fields()
    self.fontDebugFactory = FontDebugFactory.getInstance()
    if self.fontSize == nil then self.fontSize = nil end
    if self.font == nil then self.font = nil end
    self.lastText = StringUtil.getInstance().INIT_STRING
    self.hasChanged = true
    if self.textWidth == nil then self.textWidth = 0 end
end


function CustomTextAnimation._jinit(self, text, fontSize, animationBehavior)
    java_super_init(TextAnimation, self, text, animationBehavior)
    CustomTextAnimation._init_fields(self)
        -- super(...) made self above
        self.fontSize = fontSize
        self.font = Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, fontSize)
    return self
end

function CustomTextAnimation.new(...)
    local self = setmetatable({}, CustomTextAnimation)
    CustomTextAnimation._jinit(self, ...)
    return self
end


function CustomTextAnimation:paintXY(graphics, x, y)
        self.myFontProcessor:process(graphics)
        local existingFont = graphics:getFont()
        self.fontDebugFactory:setFont(self.font, graphics)
        java_super(TextAnimation, "paintXYNoUpdate", 3)(self, graphics, x, y)
        self.fontDebugFactory:setFont(existingFont, graphics)
end
java_overload(CustomTextAnimation, "paintXY", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and type(java_a3) == "number" end)


function CustomTextAnimation:setScale(scaleX, scaleY)
        if scaleX ~= scaleY then
            error(require("java.lang.RuntimeException").new(), 0)
        end
        self.hasChanged = true
        self.font = Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, java_int(((self.fontSize + 0.0) * scaleX)))
end
java_overload(CustomTextAnimation, "setScale", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function CustomTextAnimation:setTextWithOnMeasure(text, textChangeListener)
        java_super(TextAnimation, "setTextWithOnMeasure", 2)(self, text, textChangeListener)
end
java_overload(CustomTextAnimation, "setTextWithOnMeasure", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or java_is(java_a2, "TextChangeListener")) end)


function CustomTextAnimation:setText(text)
        if self.lastText ~= text then
            self.hasChanged = true
            self.lastText = text
            java_super(TextAnimation, "setText", 1)(self, text)
        end
end
java_overload(CustomTextAnimation, "setText", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function CustomTextAnimation:getText()
        return self.lastText
end
java_overload(CustomTextAnimation, "getText", 0)


function CustomTextAnimation:getWidth()
        if self.hasChanged then
            self.textWidth = self.font:stringWidth(self.textArrayP[1])
            self.hasChanged = false
        end
        return self.textWidth
end
java_overload(CustomTextAnimation, "getWidth", 0)


function CustomTextAnimation:getFontHeight()
        return self.font:getHeight()
end
java_overload(CustomTextAnimation, "getFontHeight", 0)

return CustomTextAnimation

