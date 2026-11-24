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

local GamePerformanceInitUpdatePaintable = {}
package.loaded["org.allbinary.game.displayable.canvas.GamePerformanceInitUpdatePaintable"] = GamePerformanceInitUpdatePaintable

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
local GameStatisticsFactory = java_lazy("org.allbinary.canvas.GameStatisticsFactory")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = java_lazy("org.allbinary.graphics.font.UpdateMyFontProcessor")
local InitUpdatePaintable = require("org.allbinary.graphics.paint.InitUpdatePaintable")

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

-- class table GamePerformanceInitUpdatePaintable is declared before the requires
GamePerformanceInitUpdatePaintable.__index = GamePerformanceInitUpdatePaintable
GamePerformanceInitUpdatePaintable.className = "GamePerformanceInitUpdatePaintable"
GamePerformanceInitUpdatePaintable.javaClassName = "org.allbinary.game.displayable.canvas.GamePerformanceInitUpdatePaintable"
setmetatable(GamePerformanceInitUpdatePaintable, {__index = InitUpdatePaintable})
GamePerformanceInitUpdatePaintable.java_implements = " UpdateMyFontInterface "
GamePerformanceInitUpdatePaintable.java_interfaces = function() return {UpdateMyFontInterface} end

function GamePerformanceInitUpdatePaintable:_init_fields()
    self.halfHeight = DisplayInfoSingleton.getInstance():getLastHalfHeight()
    self.yArray = {jt = "I", self.halfHeight + 30, self.halfHeight + 30, self.halfHeight + 30 + 15, self.halfHeight + 30 + 15, self.halfHeight + 30 + 30, self.halfHeight + 30 + 30, self.halfHeight + 30 + 45, self.halfHeight + 30 + 45}
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.baseRefreshHelperCharArray = java_new_array("\0", 0, 0)
    if self.defaultStringWidth == nil then self.defaultStringWidth = 0 end
    self.RED = math.tointeger(BasicColorFactory.getInstance().RED // 1)
end

function GamePerformanceInitUpdatePaintable._jinit(self)
    java_super_init(InitUpdatePaintable, self)
    GamePerformanceInitUpdatePaintable._init_fields(self)
    return self
end

function GamePerformanceInitUpdatePaintable.new()
    return GamePerformanceInitUpdatePaintable._jinit(setmetatable({}, GamePerformanceInitUpdatePaintable))
end


function GamePerformanceInitUpdatePaintable:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.defaultStringWidth = MyFontProcessor.defaultStringWidth(font, 2)
        self.myFontProcessor = MyFontProcessor.getInstance()
end
java_overload(GamePerformanceInitUpdatePaintable, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function GamePerformanceInitUpdatePaintable:init()
end
java_overload(GamePerformanceInitUpdatePaintable, "init", 0)


function GamePerformanceInitUpdatePaintable:update()
        self.baseRefreshHelperCharArray = GameStatisticsFactory.getInstance():to2DCharArray()
end
java_overload(GamePerformanceInitUpdatePaintable, "update", 0)


function GamePerformanceInitUpdatePaintable:paint(graphics)
        self.myFontProcessor:process(graphics)
        graphics:setColor(self.RED)
        local charArray = nil
        local charArray2 = nil
        local size2 = 0
        local size3 = 0
        local size = (self.baseRefreshHelperCharArray.n or #self.baseRefreshHelperCharArray) - 2
        for index = size, 0, -2 do
            charArray = self.baseRefreshHelperCharArray[index + 1]
            charArray2 = self.baseRefreshHelperCharArray[index + 1 + 1]
            size2 = (charArray.n or #charArray)
            size3 = (charArray2.n or #charArray2)
            graphics:drawChars(charArray, 0, size2, 0, self.yArray[index + 1], 0)
            graphics:drawChars(charArray2, 0, size3, size2 * self.defaultStringWidth, self.yArray[index + 1 + 1], 0)
        end
end
java_overload(GamePerformanceInitUpdatePaintable, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

return GamePerformanceInitUpdatePaintable

