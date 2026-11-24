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
-- package org.allbinary.game.input

local DesktopDefaultGameInputMapping = {}
package.loaded["org.allbinary.game.input.DesktopDefaultGameInputMapping"] = DesktopDefaultGameInputMapping

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

local GamePersistanceStrings = java_lazy("org.allbinary.game.configuration.persistance.GamePersistanceStrings")
local InputToGameKeyMapping = java_lazy("org.allbinary.game.input.mapping.InputToGameKeyMapping")
local PersistentInputMapping = require("org.allbinary.game.input.mapping.PersistentInputMapping")

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

-- class table DesktopDefaultGameInputMapping is declared before the requires
DesktopDefaultGameInputMapping.__index = DesktopDefaultGameInputMapping
DesktopDefaultGameInputMapping.className = "DesktopDefaultGameInputMapping"
DesktopDefaultGameInputMapping.javaClassName = "org.allbinary.game.input.DesktopDefaultGameInputMapping"
setmetatable(DesktopDefaultGameInputMapping, {__index = PersistentInputMapping})


function DesktopDefaultGameInputMapping._jinit(self)
    java_super_init(PersistentInputMapping, self, GamePersistanceStrings.getInstance().DEFAULT_INPUT_MAPPING_RECORD_ID)
        -- super(...) made self above
        local inputToGameKeyMapping = self:getInputMapping()
        local pcKeyFactory = PCKeyFactory.getInstance()
        local gameKeyFactory = GameKeyFactory.getInstance()
        inputToGameKeyMapping:add(gameKeyFactory.FIRE, pcKeyFactory.ENTER)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM1, pcKeyFactory.FOUR)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM1, pcKeyFactory._P)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM1, pcKeyFactory.p)
        inputToGameKeyMapping:add(gameKeyFactory.UP, pcKeyFactory.DPAD_UP)
        inputToGameKeyMapping:add(gameKeyFactory.DOWN, pcKeyFactory.DPAD_DOWN)
        inputToGameKeyMapping:add(gameKeyFactory.LEFT, pcKeyFactory.DPAD_LEFT)
        inputToGameKeyMapping:add(gameKeyFactory.RIGHT, pcKeyFactory.DPAD_RIGHT)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM1, pcKeyFactory.FIVE)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM7, pcKeyFactory._Y)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM9, pcKeyFactory._I)
        inputToGameKeyMapping:add(gameKeyFactory.UP, pcKeyFactory._U)
        inputToGameKeyMapping:add(gameKeyFactory.LEFT, pcKeyFactory._H)
        inputToGameKeyMapping:add(gameKeyFactory.RIGHT, pcKeyFactory._J)
        inputToGameKeyMapping:add(gameKeyFactory.DOWN, pcKeyFactory._N)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM5, pcKeyFactory._M)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM7, pcKeyFactory.y)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM9, pcKeyFactory.i)
        inputToGameKeyMapping:add(gameKeyFactory.UP, pcKeyFactory.u)
        inputToGameKeyMapping:add(gameKeyFactory.LEFT, pcKeyFactory.h)
        inputToGameKeyMapping:add(gameKeyFactory.RIGHT, pcKeyFactory.j)
        inputToGameKeyMapping:add(gameKeyFactory.DOWN, pcKeyFactory.n)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM5, pcKeyFactory.m)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM7, pcKeyFactory._Q)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM9, pcKeyFactory._E)
        inputToGameKeyMapping:add(gameKeyFactory.UP, pcKeyFactory._W)
        inputToGameKeyMapping:add(gameKeyFactory.LEFT, pcKeyFactory._A)
        inputToGameKeyMapping:add(gameKeyFactory.RIGHT, pcKeyFactory._D)
        inputToGameKeyMapping:add(gameKeyFactory.DOWN, pcKeyFactory._S)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM5, pcKeyFactory._X)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM7, pcKeyFactory.q)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM9, pcKeyFactory.e)
        inputToGameKeyMapping:add(gameKeyFactory.UP, pcKeyFactory.w)
        inputToGameKeyMapping:add(gameKeyFactory.LEFT, pcKeyFactory.a)
        inputToGameKeyMapping:add(gameKeyFactory.RIGHT, pcKeyFactory.d)
        inputToGameKeyMapping:add(gameKeyFactory.DOWN, pcKeyFactory.s)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM5, pcKeyFactory.x)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM3, pcKeyFactory.THREE)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM0, pcKeyFactory.ZERO)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM0, pcKeyFactory.ONE)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM0, pcKeyFactory.SPACE)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_POUND, pcKeyFactory.DEL)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_POUND, pcKeyFactory.TWO)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_STAR, pcKeyFactory.ESCAPE)
        inputToGameKeyMapping:add(gameKeyFactory.KEY_STAR, pcKeyFactory.STAR)
        inputToGameKeyMapping:add(gameKeyFactory.LEVEL_DOWN, pcKeyFactory.COMMA)
        inputToGameKeyMapping:add(gameKeyFactory.LEVEL_UP, pcKeyFactory.PERIOD)
    return self
end

function DesktopDefaultGameInputMapping.new(...)
    local self = setmetatable({}, DesktopDefaultGameInputMapping)
    DesktopDefaultGameInputMapping._jinit(self, ...)
    return self
end

return DesktopDefaultGameInputMapping

