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
-- package org.allbinary.business.advertisement

local AdConfiguration = {}
package.loaded["org.allbinary.business.advertisement.AdConfiguration"] = AdConfiguration

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

local Direction = java_lazy("org.allbinary.direction.Direction")
local GameState = java_lazy("org.allbinary.game.state.GameState")

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

-- class table AdConfiguration is declared before the requires
AdConfiguration.__index = AdConfiguration
AdConfiguration.className = "AdConfiguration"
AdConfiguration.javaClassName = "org.allbinary.business.advertisement.AdConfiguration"

function AdConfiguration:_init_fields()
    if self.INNERACTIVE == nil then self.INNERACTIVE = nil end
    if self.LEADBOLT == nil then self.LEADBOLT = nil end
    if self.ADMOB == nil then self.ADMOB = nil end
end


function AdConfiguration._jinit(self, advertIdArray)
    AdConfiguration._init_fields(self)
        self.INNERACTIVE = advertIdArray[1]
        self.ADMOB = advertIdArray[2]
        self.LEADBOLT = advertIdArray[3]
    return self
end

function AdConfiguration.new(...)
    local self = setmetatable({}, AdConfiguration)
    AdConfiguration._jinit(self, ...)
    return self
end


function AdConfiguration:getValidAdSpots()
        return java_new_array(nil, 0)
end


function AdConfiguration:process(gameState)
end


function AdConfiguration:processDemo(state)
end


function AdConfiguration:setShowAds()
end


function AdConfiguration:setToggleAds(showAds)
end


function AdConfiguration:isShowAds()
        return true
end

return AdConfiguration

