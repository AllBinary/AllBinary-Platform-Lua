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
-- package org.allbinary.game.ag.layer.hud.basic

local NumberStringHud = {}
package.loaded["org.allbinary.game.ag.layer.hud.basic.NumberStringHud"] = NumberStringHud

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
local BasicHud = require("org.allbinary.game.graphics.hud.BasicHud")
local BasicHudFactory = java_lazy("org.allbinary.game.graphics.hud.BasicHudFactory")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local PaintableInterface = java_lazy("org.allbinary.graphics.paint.PaintableInterface")
local PrimitiveLongSingleton = java_lazy("org.allbinary.logic.math.PrimitiveLongSingleton")
local PrimitiveLongUtil = java_lazy("org.allbinary.logic.math.PrimitiveLongUtil")

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

local function java_chars(text)
    local chars = {}
    for index = 1, #text do chars[index] = string.sub(text, index, index) end
    return chars
end

-- class table NumberStringHud is declared before the requires
NumberStringHud.__index = NumberStringHud
NumberStringHud.className = "NumberStringHud"
NumberStringHud.javaClassName = "org.allbinary.game.ag.layer.hud.basic.NumberStringHud"
setmetatable(NumberStringHud, {__index = BasicHud})
NumberStringHud.java_implements = " PaintableInterface "
NumberStringHud.java_interfaces = function() return {PaintableInterface} end

function NumberStringHud:_init_fields()
    if self.primitiveLongUtil == nil then self.primitiveLongUtil = nil end
    if self.prependString == nil then self.prependString = nil end
    if self.PREPEND_STRING == nil then self.PREPEND_STRING = nil end
    if self.value == nil then self.value = nil end
    if self.max == nil then self.max = nil end
    if self.offset == nil then self.offset = 0 end
    if self.valueString == nil then self.valueString = nil end
    if self.valueTotalDigits == nil then self.valueTotalDigits = 0 end
end


function NumberStringHud._jinit(self, prependString, max, location, direction, bufferZone, basicColor)
    java_super_init(BasicHud, self, location, direction, bufferZone, basicColor)
    NumberStringHud._init_fields(self)
        -- super(...) made self above
        self.prependString = prependString
        self.PREPEND_STRING = java_chars(prependString)
        self.valueString = PrimitiveLongSingleton.getInstance().NUMBER_CHAR_ARRAYS[1]
        self.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(max + 1)
        self.max = max
        self.value = 0
        if direction == 0 then
            error(require("java.lang.RuntimeException").new(BasicHudFactory.getInstance().DIRECTION_EXCEPTION), 0)
        end
    return self
end

function NumberStringHud.new(...)
    local self = setmetatable({}, NumberStringHud)
    NumberStringHud._jinit(self, ...)
    return self
end


function NumberStringHud:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.offset = font:stringWidth(self.prependString) + MyFontProcessor.defaultCharWidth(font)
        java_super(BasicHud, "updateMeasurement", 1)(self, graphics)
end
java_overload(NumberStringHud, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function NumberStringHud:get()
        return self.value
end
java_overload(NumberStringHud, "get", 0)


function NumberStringHud:add(value)
        self:set(self.value + value)
end
java_overload(NumberStringHud, "add", 1, function(java_a1) return true and type(java_a1) == "number" end)


function NumberStringHud:set(value)
        self.value = value
        if self.value > self.max then
            self.value = 0
        end
        self.valueString = self.primitiveLongUtil:getCharArray(self.value)
        self.valueTotalDigits = self.primitiveLongUtil:getCurrentTotalDigits()
end
java_overload(NumberStringHud, "set", 1, function(java_a1) return true and type(java_a1) == "number" end)


function NumberStringHud:reduce(value)
        self:set(self.value - value)
end
java_overload(NumberStringHud, "reduce", 1, function(java_a1) return true and type(java_a1) == "number" end)


function NumberStringHud:paint(graphics)
        java_super(BasicHud, "paintDX", 8)(self, graphics, self.PREPEND_STRING, 0, (self.PREPEND_STRING.n or #self.PREPEND_STRING), self.valueString, 0, self.valueTotalDigits, self.offset)
end
java_overload(NumberStringHud, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function NumberStringHud:paintXY(graphics, x, y)
        self.myFontProcessor:process(graphics)
        local charArray = self.PREPEND_STRING
        local len = (self.PREPEND_STRING.n or #self.PREPEND_STRING)
        local charArray2 = self.valueString
        local len2 = self.valueTotalDigits
        self.basicSetColorUtil:setBasicColorP(graphics, self:getBasicColorP())
        graphics:drawChars(charArray, 0, len, x, y, 0)
        graphics:drawChars(charArray2, 0, len2, x - self.offset, y, 0)
end
java_overload(NumberStringHud, "paintXY", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and type(java_a3) == "number" end)


function NumberStringHud:paintThreed(graphics)
end
java_overload(NumberStringHud, "paintThreed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

return NumberStringHud

