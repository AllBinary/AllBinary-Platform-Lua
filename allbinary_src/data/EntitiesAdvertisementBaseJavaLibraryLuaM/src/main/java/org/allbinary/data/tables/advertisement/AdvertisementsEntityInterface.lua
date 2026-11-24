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
-- package org.allbinary.data.tables.advertisement

local AdvertisementsEntityInterface = {}
package.loaded["org.allbinary.data.tables.advertisement.AdvertisementsEntityInterface"] = AdvertisementsEntityInterface

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

local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local BasicDataTableInterface = require("org.allbinary.data.tables.BasicDataTableInterface")

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
-- class table AdvertisementsEntityInterface is declared before the requires
AdvertisementsEntityInterface.__index = AdvertisementsEntityInterface
AdvertisementsEntityInterface.className = "AdvertisementsEntityInterface"
AdvertisementsEntityInterface.javaClassName = "org.allbinary.data.tables.advertisement.AdvertisementsEntityInterface"
setmetatable(AdvertisementsEntityInterface, {__index = BasicDataTableInterface})
AdvertisementsEntityInterface.java_interfaces = function() return {BasicDataTableInterface} end


function AdvertisementsEntityInterface:delete(value)
    error("abstract method delete")
end


function AdvertisementsEntityInterface:insert(values)
    error("abstract method insert")
end


function AdvertisementsEntityInterface:update(updatedValues)
    error("abstract method update")
end

return AdvertisementsEntityInterface

