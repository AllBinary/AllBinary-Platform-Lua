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
-- package org.allbinary.business.advertisement.area

local AdvertisementAreaInterface = {}
package.loaded["org.allbinary.business.advertisement.area.AdvertisementAreaInterface"] = AdvertisementAreaInterface

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

local AdvertisementAreaConstraintsInterface = java_lazy("org.allbinary.business.advertisement.area.AdvertisementAreaConstraintsInterface")

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

-- Java interface
-- class table AdvertisementAreaInterface is declared before the requires
AdvertisementAreaInterface.__index = AdvertisementAreaInterface
AdvertisementAreaInterface.className = "AdvertisementAreaInterface"
AdvertisementAreaInterface.javaClassName = "org.allbinary.business.advertisement.area.AdvertisementAreaInterface"


function AdvertisementAreaInterface:getName()
    error("abstract method getName")
end


function AdvertisementAreaInterface:getStoreName()
    error("abstract method getStoreName")
end


function AdvertisementAreaInterface:getDescription()
    error("abstract method getDescription")
end


function AdvertisementAreaInterface:getConstraints()
    error("abstract method getConstraints")
end


function AdvertisementAreaInterface:getCampaign()
    error("abstract method getCampaign")
end


function AdvertisementAreaInterface:setName(name)
    error("abstract method setName")
end


function AdvertisementAreaInterface:setStoreName(storeName)
    error("abstract method setStoreName")
end


function AdvertisementAreaInterface:setDescription(description)
    error("abstract method setDescription")
end


function AdvertisementAreaInterface:setConstraints(advertisementConstraintsInterface)
    error("abstract method setConstraints")
end


function AdvertisementAreaInterface:setCampaign(campaign)
    error("abstract method setCampaign")
end

return AdvertisementAreaInterface

