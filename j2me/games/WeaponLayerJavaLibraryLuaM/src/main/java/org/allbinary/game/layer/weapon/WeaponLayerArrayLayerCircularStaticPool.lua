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
-- package org.allbinary.game.layer.weapon

local WeaponLayerArrayLayerCircularStaticPool = {}
package.loaded["org.allbinary.game.layer.weapon.WeaponLayerArrayLayerCircularStaticPool"] = WeaponLayerArrayLayerCircularStaticPool

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

local CircularIndexUtil = java_lazy("org.allbinary.util.CircularIndexUtil")
local WeaponLayer = java_lazy("org.allbinary.game.layer.weapon.WeaponLayer")

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

-- class table WeaponLayerArrayLayerCircularStaticPool is declared before the requires
WeaponLayerArrayLayerCircularStaticPool.__index = WeaponLayerArrayLayerCircularStaticPool
WeaponLayerArrayLayerCircularStaticPool.className = "WeaponLayerArrayLayerCircularStaticPool"
WeaponLayerArrayLayerCircularStaticPool.javaClassName = "org.allbinary.game.layer.weapon.WeaponLayerArrayLayerCircularStaticPool"

function WeaponLayerArrayLayerCircularStaticPool:_init_fields()
    self.MAX = 5
    self.circularIndexUtil = CircularIndexUtil.createInstance(self.MAX)
    self.WEAPONLAYER_ARRAY = java_new_array(nil, self.MAX * 2)
    self.TWO_WEAPONLAYER_ARRAY = java_new_array(nil, self.MAX)
    self.THREE_WEAPONLAYER_ARRAY = java_new_array(nil, self.MAX)
end

function WeaponLayerArrayLayerCircularStaticPool._jinit(self)
    WeaponLayerArrayLayerCircularStaticPool._init_fields(self)
    return self
end

function WeaponLayerArrayLayerCircularStaticPool.new()
    return WeaponLayerArrayLayerCircularStaticPool._jinit(setmetatable({}, WeaponLayerArrayLayerCircularStaticPool))
end


function WeaponLayerArrayLayerCircularStaticPool.getInstance()
        return WeaponLayerArrayLayerCircularStaticPool.instance_f
end


function WeaponLayerArrayLayerCircularStaticPool:init()
        for index = 0, self.MAX - 1 do
            self.WEAPONLAYER_ARRAY[index + 1] = java_new_array(nil, 1)
            self.TWO_WEAPONLAYER_ARRAY[index + 1] = java_new_array(nil, 2)
            self.THREE_WEAPONLAYER_ARRAY[index + 1] = java_new_array(nil, 3)
        end
        self.WEAPONLAYER_ARRAY = self.WEAPONLAYER_ARRAY
        self.TWO_WEAPONLAYER_ARRAY = self.TWO_WEAPONLAYER_ARRAY
        self.THREE_WEAPONLAYER_ARRAY = self.THREE_WEAPONLAYER_ARRAY
end


function WeaponLayerArrayLayerCircularStaticPool:getWeaponLayerArrays(size)
        if rawequal(size, 1) then
            return self.WEAPONLAYER_ARRAY
        elseif rawequal(size, 2) then
            return self.TWO_WEAPONLAYER_ARRAY
        elseif rawequal(size, 3) then
            return self.THREE_WEAPONLAYER_ARRAY
        end
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function WeaponLayerArrayLayerCircularStaticPool:getInstanceArray(size)
        local weaponLayerArray = self:getWeaponLayerArrays(size)[self.circularIndexUtil:getIndex() + 1]
        self.circularIndexUtil:next()
        return weaponLayerArray
end

WeaponLayerArrayLayerCircularStaticPool.instance_f = WeaponLayerArrayLayerCircularStaticPool.new()

return WeaponLayerArrayLayerCircularStaticPool

