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

local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")

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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WeaponLayerArrayLayerCircularStaticPool = {}
WeaponLayerArrayLayerCircularStaticPool.__index = WeaponLayerArrayLayerCircularStaticPool
WeaponLayerArrayLayerCircularStaticPool.className = "WeaponLayerArrayLayerCircularStaticPool"

function WeaponLayerArrayLayerCircularStaticPool:_init_fields()
    self.MAX = 5
    self.circularIndexUtil = CircularIndexUtil.createInstance(self.MAX)
    self.WEAPONLAYER_ARRAY = nil
    self.TWO_WEAPONLAYER_ARRAY = nil
    self.THREE_WEAPONLAYER_ARRAY = nil
end

function WeaponLayerArrayLayerCircularStaticPool.new()
    local self = setmetatable({}, WeaponLayerArrayLayerCircularStaticPool)
    self:_init_fields()
    return self
end


function WeaponLayerArrayLayerCircularStaticPool.getInstance()
        return WeaponLayerArrayLayerCircularStaticPool.instance
end


function WeaponLayerArrayLayerCircularStaticPool:init()
        local WEAPONLAYER_ARRAY = java_new_array(nil, self.MAX * 2)
        local TWO_WEAPONLAYER_ARRAY = java_new_array(nil, self.MAX)
        local THREE_WEAPONLAYER_ARRAY = java_new_array(nil, self.MAX)
        for index = 0, self.MAX - 1 do
            WEAPONLAYER_ARRAY[index + 1] = java_new_array(nil, 1)
            TWO_WEAPONLAYER_ARRAY[index + 1] = java_new_array(nil, 2)
            THREE_WEAPONLAYER_ARRAY[index + 1] = java_new_array(nil, 3)
        end
        self.WEAPONLAYER_ARRAY = WEAPONLAYER_ARRAY
        self.TWO_WEAPONLAYER_ARRAY = TWO_WEAPONLAYER_ARRAY
        self.THREE_WEAPONLAYER_ARRAY = THREE_WEAPONLAYER_ARRAY
end


function WeaponLayerArrayLayerCircularStaticPool:getWeaponLayerArrays(size)
        if size == 1 then
            return self.WEAPONLAYER_ARRAY
        elseif size == 2 then
            return self.TWO_WEAPONLAYER_ARRAY
        elseif size == 3 then
            return self.THREE_WEAPONLAYER_ARRAY
        end
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function WeaponLayerArrayLayerCircularStaticPool:getInstanceArray(size)
        local weaponLayerArray = self:getWeaponLayerArrays(size)[self.circularIndexUtil:getIndex() + 1]
        self.circularIndexUtil:next()
        return weaponLayerArray
end

WeaponLayerArrayLayerCircularStaticPool.instance = WeaponLayerArrayLayerCircularStaticPool.new()

return WeaponLayerArrayLayerCircularStaticPool

