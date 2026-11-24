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
-- package org.allbinary.thirdparty.store

local ThirdPartyStore = {}
package.loaded["org.allbinary.thirdparty.store.ThirdPartyStore"] = ThirdPartyStore

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

local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")

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

-- class table ThirdPartyStore is declared before the requires
ThirdPartyStore.__index = ThirdPartyStore
ThirdPartyStore.className = "ThirdPartyStore"
ThirdPartyStore.javaClassName = "org.allbinary.thirdparty.store.ThirdPartyStore"

function ThirdPartyStore:_init_fields()
    if self.authorized == nil then self.authorized = false end
    if self.name_f == nil then self.name_f = nil end
end


function ThirdPartyStore._jinit(self, name)
    ThirdPartyStore._init_fields(self)
        self.name_f = name
    return self
end

function ThirdPartyStore.new(...)
    local self = setmetatable({}, ThirdPartyStore)
    ThirdPartyStore._jinit(self, ...)
    return self
end


function ThirdPartyStore:authorize(clientInformationInterface)
end


function ThirdPartyStore:isAuthorized()
        return self.authorized
end


function ThirdPartyStore:setAuthorized(authorized)
        self.authorized = authorized
end


function ThirdPartyStore:getName()
        return self.name_f
end

return ThirdPartyStore

