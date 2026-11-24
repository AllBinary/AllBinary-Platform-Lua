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
-- package org.allbinary.business.init.db

local InitDbHelperFactory = {}
package.loaded["org.allbinary.business.init.db.InitDbHelperFactory"] = InitDbHelperFactory

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

local AbeFactory = java_lazy("org.allbinary.logic.system.loader.AbeFactory")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local LicensingException = java_lazy("org.allbinary.logic.system.security.licensing.LicensingException")

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

-- class table InitDbHelperFactory is declared before the requires
InitDbHelperFactory.__index = InitDbHelperFactory
InitDbHelperFactory.className = "InitDbHelperFactory"
InitDbHelperFactory.javaClassName = "org.allbinary.business.init.db.InitDbHelperFactory"


function InitDbHelperFactory._jinit(self)
    return self
end

function InitDbHelperFactory.new(...)
    local self = setmetatable({}, InitDbHelperFactory)
    InitDbHelperFactory._jinit(self, ...)
    return self
end


-- throws LicensingException
function InitDbHelperFactory.getInstance_j2(abeClientInformation, databaseConnectionInfoInterface)
        local params = java_new_array(nil, 1)
        local classes = java_new_array(nil, 1)
        classes[1] = DatabaseConnectionInfoInterface
        params[1] = databaseConnectionInfoInterface
        local anyType = AbeFactory.getInstance():getInstance(abeClientInformation, InitDbHelperFactory.CLASSNAME, classes, params)
        return anyType
end


-- throws LicensingException
function InitDbHelperFactory.getInstance_j1(abeClientInformation)
        local anyType = AbeFactory.getInstance():getInstance(abeClientInformation, InitDbHelperFactory.CLASSNAME, nil, nil)
        return anyType
end
function InitDbHelperFactory.getInstance(...)
    local count = select("#", ...)
    if count == 2 then return InitDbHelperFactory.getInstance_j2(...) end
    if count == 1 then return InitDbHelperFactory.getInstance_j1(...) end
    error("No method getInstance takes " .. count .. " arguments")
end
InitDbHelperFactory.getInstance__jdispatcher = InitDbHelperFactory.getInstance

InitDbHelperFactory.CLASSNAME = "org.allbinary.business.installer.InitDbCrypted"

return InitDbHelperFactory

