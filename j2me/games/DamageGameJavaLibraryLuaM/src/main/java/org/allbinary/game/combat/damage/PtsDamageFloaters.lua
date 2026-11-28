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
-- package org.allbinary.game.combat.damage

local PtsDamageFloaters = {}
package.loaded["org.allbinary.game.combat.damage.PtsDamageFloaters"] = PtsDamageFloaters

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
local MyRandomFactory = java_lazy("org.allbinary.game.rand.MyRandomFactory")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorArrayIndexer = java_lazy("org.allbinary.graphics.color.BasicColorArrayIndexer")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local BasicColorSetUtil = java_lazy("org.allbinary.graphics.color.BasicColorSetUtil")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local CharArrayFactory = java_lazy("org.allbinary.logic.java.character.CharArrayFactory")
local PrimitiveLongUtil = java_lazy("org.allbinary.logic.math.PrimitiveLongUtil")
local CircularIndexUtil = java_lazy("org.allbinary.util.CircularIndexUtil")
local ViewPosition = java_lazy("org.allbinary.view.ViewPosition")
local ViewPositionBase = java_lazy("org.allbinary.view.ViewPositionBase")
local DamageFloaters = require("org.allbinary.game.combat.damage.DamageFloaters")

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

-- class table PtsDamageFloaters is declared before the requires
PtsDamageFloaters.__index = PtsDamageFloaters
PtsDamageFloaters.className = "PtsDamageFloaters"
PtsDamageFloaters.javaClassName = "org.allbinary.game.combat.damage.PtsDamageFloaters"
setmetatable(PtsDamageFloaters, {__index = DamageFloaters})

function PtsDamageFloaters:_init_fields()
    self.basicSetColorUtil = BasicColorSetUtil.getInstance()
    if self.layerInterface == nil then self.layerInterface = nil end
    self.lastDamage = java_typed_array("I", java_new_array(0, 5))
    self.lastDamageString = java_new_array("\0", 5, 0)
    self.lastDamageStringSizeArray = java_typed_array("I", java_new_array(0, 5))
    self.circularIndexUtil = CircularIndexUtil.createInstance(5)
    if self.primitiveLongUtil == nil then self.primitiveLongUtil = nil end
    self.myRandomFactory = MyRandomFactory.getInstance()
end


function PtsDamageFloaters._jinit(self, layerInterface)
    java_super_init(DamageFloaters, self)
    PtsDamageFloaters._init_fields(self)
        self.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(100000)
        self.layerInterface = layerInterface
        local CHAR_ARRAY = CharArrayFactory.getInstance():getZeroCharArray()
        for index = (self.lastDamageString.n or #self.lastDamageString) - 1, 0, -1 do
            self.lastDamageString[index + 1] = CHAR_ARRAY
        end
    return self
end

function PtsDamageFloaters.new(...)
    local self = setmetatable({}, PtsDamageFloaters)
    PtsDamageFloaters._jinit(self, ...)
    return self
end


function PtsDamageFloaters:add(damage)
        local index = self.circularIndexUtil:getIndex()
        self.lastDamage[index + 1] = damage
        self.lastDamageString[index + 1] = self.primitiveLongUtil:getCharArray(self.lastDamage[index + 1])
        self.lastDamageStringSizeArray[index + 1] = self.primitiveLongUtil:getCurrentTotalDigits()
        self.circularIndexUtil:next()
end
java_overload(PtsDamageFloaters, "add", 1, function(java_a1) return true and type(java_a1) == "number" end)


function PtsDamageFloaters:paint(graphics)
        local viewPosition = self.layerInterface:getViewPosition()
        local x = viewPosition:getX()
        local y = viewPosition:getY()
        for index = (self.lastDamage.n or #self.lastDamage) - 1, 0, -1 do
            if not rawequal(self.lastDamage[index + 1], 0) then
                local delta = 10 * (index + 2)
                self.basicSetColorUtil:setBasicColorP(graphics, PtsDamageFloaters.basicColorArrayIndexer:get())
                graphics:drawChars(self.lastDamageString[index + 1], 0, self.lastDamageStringSizeArray[index + 1], x - self.myRandomFactory:getNextInt(delta), y - delta, 0)
                PtsDamageFloaters.basicColorArrayIndexer:next()
            end
            self.lastDamage[index + 1] = 0
        end
end
java_overload(PtsDamageFloaters, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

PtsDamageFloaters.basicColorArrayIndexer = BasicColorArrayIndexer.new({BasicColorFactory.getInstance().WHITE, BasicColorFactory.getInstance().RED, BasicColorFactory.getInstance().YELLOW, BasicColorFactory.getInstance().BLUE})

return PtsDamageFloaters

