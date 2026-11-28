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

local TouchButtonsMappingPaintable = {}
package.loaded["org.allbinary.input.motion.button.TouchButtonsMappingPaintable"] = TouchButtonsMappingPaintable

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
local CellPositionFactory = java_lazy("org.allbinary.graphics.CellPositionFactory")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicTouchInputFactory = java_lazy("org.allbinary.input.motion.button.BasicTouchInputFactory")
local CommonButtons = java_lazy("org.allbinary.input.motion.button.CommonButtons")
local TouchButton = java_lazy("org.allbinary.input.motion.button.TouchButton")
local TouchButtonBlankResource = java_lazy("org.allbinary.input.motion.button.TouchButtonBlankResource")
local TouchButtonLocationHelper = java_lazy("org.allbinary.input.motion.button.TouchButtonLocationHelper")

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

-- class table TouchButtonsMappingPaintable is declared before the requires
TouchButtonsMappingPaintable.__index = TouchButtonsMappingPaintable
TouchButtonsMappingPaintable.className = "TouchButtonsMappingPaintable"
TouchButtonsMappingPaintable.javaClassName = "org.allbinary.input.motion.button.TouchButtonsMappingPaintable"
setmetatable(TouchButtonsMappingPaintable, {__index = Paintable})

function TouchButtonsMappingPaintable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.foregroundColor == nil then self.foregroundColor = 0 end
    self.paintableTable = java_new_array(nil, 0, 0)
    self.touchButtonLocationHelper = TouchButtonLocationHelper.new()
end


function TouchButtonsMappingPaintable._jinit(self, basicColor)
    java_super_init(Paintable, self)
    TouchButtonsMappingPaintable._init_fields(self)
        self.foregroundColor = require("allbinary_java").number_value(basicColor, "intValue")
        self:init()
    return self
end

function TouchButtonsMappingPaintable.new(...)
    local self = setmetatable({}, TouchButtonsMappingPaintable)
    TouchButtonsMappingPaintable._jinit(self, ...)
    return self
end


function TouchButtonsMappingPaintable:init()
        local try_ok, try_error, try_value = pcall(function()
            self.paintableTable = self:createPaintableTable()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "updateRectangle", e)
        end
end
java_overload(TouchButtonsMappingPaintable, "init", 0)


-- throws Exception
function TouchButtonsMappingPaintable:createPaintableTable()
        local totalColumns = self.touchButtonLocationHelper:getTotalColumns()
        local totalRows = self.touchButtonLocationHelper:getTotalRows()
        local paintableTable = java_new_array(nil, totalColumns, totalRows)
        local cellPositionFactory = CellPositionFactory.getInstance()
        local commonButtons = CommonButtons.getInstance()
        for index = totalColumns - 1, 0, -1 do
            for rowIndex = totalRows - 1, 0, -1 do
                self.paintableTable[index + 1][rowIndex + 1] = TouchButton.createButton(BasicTouchInputFactory.getInstance().NONE, TouchButtonBlankResource.getInstance(), commonButtons.NORMAL_BUTTON, cellPositionFactory:getInstanceColRow(index, rowIndex), self.touchButtonLocationHelper:getColumnsRemainderHalf(), self.touchButtonLocationHelper:getRowsRemainderHalf())
            end
        end
        return paintableTable
end
java_overload(TouchButtonsMappingPaintable, "createPaintableTable", 0)


function TouchButtonsMappingPaintable:paint(graphics)
        local totalColumns = self.touchButtonLocationHelper:getTotalColumns()
        local totalRows = self.touchButtonLocationHelper:getTotalRows()
        for index = totalColumns - 1, 0, -1 do
            for rowIndex = totalRows - 1, 0, -1 do
                self.paintableTable[index + 1][rowIndex + 1]:paint(graphics)
            end
        end
end
java_overload(TouchButtonsMappingPaintable, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

return TouchButtonsMappingPaintable

