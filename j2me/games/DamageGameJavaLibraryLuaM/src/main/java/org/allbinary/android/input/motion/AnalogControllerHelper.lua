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
-- package org.allbinary.android.input.motion

local AnalogControllerHelper = {}
package.loaded["org.allbinary.android.input.motion.AnalogControllerHelper"] = AnalogControllerHelper

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

local CollidableDestroyableDamageableLayer = java_lazy("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")

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

-- class table AnalogControllerHelper is declared before the requires
AnalogControllerHelper.__index = AnalogControllerHelper
AnalogControllerHelper.className = "AnalogControllerHelper"
AnalogControllerHelper.javaClassName = "org.allbinary.android.input.motion.AnalogControllerHelper"

function AnalogControllerHelper:_init_fields()
    if self.reduceTimeFactor == nil then self.reduceTimeFactor = nil end
    self.SCALE_VALUE = AnalogControllerConfigurationFactory.getInstance().SCALE_VALUE
    self.rightTimeElapsedHelper = TimeDelayHelper.new(0)
    self.leftTimeElapsedHelper = TimeDelayHelper.new(0)
    self.downTimeElapsedHelper = TimeDelayHelper.new(0)
    self.upTimeElapsedHelper = TimeDelayHelper.new(0)
end


function AnalogControllerHelper._jinit(self, reduceTimeFactor)
    AnalogControllerHelper._init_fields(self)
        self.reduceTimeFactor = reduceTimeFactor
    return self
end

function AnalogControllerHelper.new(...)
    local self = setmetatable({}, AnalogControllerHelper)
    AnalogControllerHelper._jinit(self, ...)
    return self
end


-- throws Exception
function AnalogControllerHelper:right(collidableDestroyableDamageableLayer, xAnalogValue)
        self.rightTimeElapsedHelper.delay = ((((self.SCALE_VALUE - xAnalogValue)) // (1 << (self.reduceTimeFactor))))
        if self.rightTimeElapsedHelper:isTimeTNT() then
            collidableDestroyableDamageableLayer:right()
        end
end


-- throws Exception
function AnalogControllerHelper:left(collidableDestroyableDamageableLayer, xAnalogValue)
        self.leftTimeElapsedHelper.delay = ((((self.SCALE_VALUE + xAnalogValue)) // (1 << (self.reduceTimeFactor))))
        if self.leftTimeElapsedHelper:isTimeTNT() then
            collidableDestroyableDamageableLayer:left()
        end
end


-- throws Exception
function AnalogControllerHelper:up(collidableDestroyableDamageableLayer, xAnalogValue)
        self.upTimeElapsedHelper.delay = ((((self.SCALE_VALUE - xAnalogValue)) // (1 << (self.reduceTimeFactor))))
        if self.upTimeElapsedHelper:isTimeTNT() then
            collidableDestroyableDamageableLayer:up()
        end
end


-- throws Exception
function AnalogControllerHelper:down(collidableDestroyableDamageableLayer, xAnalogValue)
        self.downTimeElapsedHelper.delay = ((((self.SCALE_VALUE + xAnalogValue)) // (1 << (self.reduceTimeFactor))))
        if self.downTimeElapsedHelper:isTimeTNT() then
            collidableDestroyableDamageableLayer:down()
        end
end

return AnalogControllerHelper

