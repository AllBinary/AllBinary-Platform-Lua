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

local MultiSelectPaintable = {}
package.loaded["org.allbinary.game.layer.MultiSelectPaintable"] = MultiSelectPaintable

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
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local SelectionHudPaintable = require("org.allbinary.game.layer.SelectionHudPaintable")
local RTSLayer = java_lazy("org.allbinary.game.layer.RTSLayer")

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

-- class table MultiSelectPaintable is declared before the requires
MultiSelectPaintable.__index = MultiSelectPaintable
MultiSelectPaintable.className = "MultiSelectPaintable"
MultiSelectPaintable.javaClassName = "org.allbinary.game.layer.MultiSelectPaintable"
setmetatable(MultiSelectPaintable, {__index = SelectionHudPaintable})

function MultiSelectPaintable:_init_fields()
    self.rootNameList = BasicArrayListD.new()
    self.totalCharArray = NullUtil.getInstance().NULL_CHAR_ARRAY
    self.rootNamesString = StringUtil.getInstance().EMPTY_STRING
    self.TOTAL = "Total Selected: "
    self.backgroundColor = require("allbinary_java").number_value(BasicColorFactory.getInstance().GREY, "intValue")
    if self.totalWidth == nil then self.totalWidth = 0 end
    if self.textLine2Y == nil then self.textLine2Y = 0 end
end


function MultiSelectPaintable._jinit(self)
    java_super_init(SelectionHudPaintable, self)
    MultiSelectPaintable._init_fields(self)
    return self
end

function MultiSelectPaintable.new(...)
    local self = setmetatable({}, MultiSelectPaintable)
    MultiSelectPaintable._jinit(self, ...)
    return self
end


function MultiSelectPaintable:updateMeasurement(graphics)
        java_super(SelectionHudPaintable, "updateMeasurement", 1)(self, graphics)
        local font = graphics:getFont()
        self.totalWidth = font:stringWidth(self.TOTAL)
        self.textLine2Y = (self.y + font:getHeight())
end
java_overload(MultiSelectPaintable, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function MultiSelectPaintable:update(list)
        self:clear()
        local size = list:size()
        self.totalCharArray = self:getPrimitiveLongUtil():getCharArray(size)
        for index = list:size() - 1, 0, -1 do
            local rtsLayer = list:get(index)
            if not (self.rootNameList:contains(rtsLayer:getRootName())) then
                self.rootNameList:add(rtsLayer:getRootName())
            end
        end
        local COMMA_SEP = CommonSeps.getInstance().COMMA_SEP
        local stringBuffer = StringMaker.new()
        for index = self.rootNameList:size() - 1, 0, -1 do
            local rootName = self.rootNameList:get(index)
            stringBuffer:append(rootName)
            if not rawequal(index, 0) then
                stringBuffer:append(COMMA_SEP)
            end
        end
        self.rootNamesString = tostring(stringBuffer)
end
java_overload(MultiSelectPaintable, "update", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


function MultiSelectPaintable:clear()
        self.rootNameList:clear()
end
java_overload(MultiSelectPaintable, "clear", 0)


function MultiSelectPaintable:paint(graphics)
        graphics:setColor(self.backgroundColor)
        graphics:drawRect(self:getX(), self.y, self:getWidth(), self:getHeight())
        graphics:setColor(self:getColor())
        graphics:drawString(self.TOTAL, self.textX, self.y, 0)
        graphics:drawChars(self.totalCharArray, 0, self:getPrimitiveLongUtil():getCurrentTotalDigits(), self.textX + self.totalWidth, self.y, 0)
        graphics:drawString(self.rootNamesString, self.textX, self.textLine2Y, 0)
end
java_overload(MultiSelectPaintable, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

return MultiSelectPaintable

