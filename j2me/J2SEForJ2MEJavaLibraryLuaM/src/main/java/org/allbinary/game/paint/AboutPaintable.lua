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

local AboutPaintable = {}
package.loaded["org.allbinary.game.paint.AboutPaintable"] = AboutPaintable

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
local Anchor = java_lazy("org.allbinary.graphics.Anchor")
local CanvasStrings = java_lazy("org.allbinary.graphics.displayable.CanvasStrings")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = java_lazy("org.allbinary.graphics.font.UpdateMyFontProcessor")
local Paintable = require("org.allbinary.graphics.paint.Paintable")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

--J2SEForJ2ME
-- class table AboutPaintable is declared before the requires
AboutPaintable.__index = AboutPaintable
AboutPaintable.className = "AboutPaintable"
AboutPaintable.javaClassName = "org.allbinary.game.paint.AboutPaintable"
setmetatable(AboutPaintable, {__index = Paintable})
AboutPaintable.java_implements = " UpdateMyFontInterface "
AboutPaintable.java_interfaces = function() return {UpdateMyFontInterface} end

function AboutPaintable:_init_fields()
    self.displayInfoSingleton = DisplayInfoSingleton.getInstance()
    self.ABOUT = CanvasStrings.getInstance().ABOUT
    if self.info == nil then self.info = nil end
    if self.developers == nil then self.developers = nil end
    self.paintableArray = {self}
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    if self.charHeight == nil then self.charHeight = 0 end
    if self.aboutBeginWidth == nil then self.aboutBeginWidth = 0 end
    if self.infoBeginWidth == nil then self.infoBeginWidth = nil end
    if self.developersBeginWidth == nil then self.developersBeginWidth = nil end
    self.anchor = Anchor.TOP_LEFT
end


function AboutPaintable.getInstance(info, developers)
        return AboutPaintable.new(info, developers)
end


function AboutPaintable._jinit(self, info, developers)
    java_super_init(Paintable, self)
    AboutPaintable._init_fields(self)
        self.info = info
        self.infoBeginWidth = java_typed_array("I", java_new_array(0, (self.info.n or #self.info)))
        self.developers = developers
        self.developersBeginWidth = java_typed_array("I", java_new_array(0, (self.developers.n or #self.developers)))
    return self
end

function AboutPaintable.new(...)
    local self = setmetatable({}, AboutPaintable)
    AboutPaintable._jinit(self, ...)
    return self
end


function AboutPaintable:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.charHeight = font:getHeight()
        self.aboutBeginWidth = (((font:stringWidth(self.ABOUT)) // (1 << (1))))
        local infoSize = (self.info.n or #self.info)
        for index = 0, infoSize - 1 do
            self.infoBeginWidth[index + 1] = (((font:stringWidth(self.info[index + 1])) // (1 << (1))))
        end
        local size = (self.developers.n or #self.developers)
        for index = 0, size - 1 do
            self.developersBeginWidth[index + 1] = (((font:stringWidth(self.developers[index + 1])) // (1 << (1))))
        end
        self.myFontProcessor = MyFontProcessor.getInstance()
end
java_overload(AboutPaintable, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function AboutPaintable:getPaintableArrayInstance()
        return self.paintableArray
end
java_overload(AboutPaintable, "getPaintableArrayInstance", 0)


function AboutPaintable:paint(graphics)
        self.myFontProcessor:process(graphics)
        local halfWidth = self.displayInfoSingleton:getLastHalfWidth()
        graphics:drawString(self.ABOUT, halfWidth - self.aboutBeginWidth, 2 * self.charHeight, self.anchor)
        local infoSize = (self.info.n or #self.info)
        for index = 0, infoSize - 1 do
            graphics:drawString(self.info[index + 1], halfWidth - self.infoBeginWidth[index + 1], (4 + index) * self.charHeight, self.anchor)
        end
        local size = (self.developers.n or #self.developers)
        for index = 0, size - 1 do
            graphics:drawString(self.developers[index + 1], halfWidth - self.developersBeginWidth[index + 1], (5 + infoSize + index) * self.charHeight, self.anchor)
        end
end
java_overload(AboutPaintable, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

return AboutPaintable

