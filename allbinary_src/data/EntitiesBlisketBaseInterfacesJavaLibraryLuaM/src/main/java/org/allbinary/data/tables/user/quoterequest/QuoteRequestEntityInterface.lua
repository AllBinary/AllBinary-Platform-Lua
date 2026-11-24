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
-- package org.allbinary.data.tables.user.quoterequest

local QuoteRequestEntityInterface = {}
package.loaded["org.allbinary.data.tables.user.quoterequest.QuoteRequestEntityInterface"] = QuoteRequestEntityInterface

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
local QuoteRequest = java_lazy("org.allbinary.business.user.quoterequest.QuoteRequest")
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
-- class table QuoteRequestEntityInterface is declared before the requires
QuoteRequestEntityInterface.__index = QuoteRequestEntityInterface
QuoteRequestEntityInterface.className = "QuoteRequestEntityInterface"
QuoteRequestEntityInterface.javaClassName = "org.allbinary.data.tables.user.quoterequest.QuoteRequestEntityInterface"
setmetatable(QuoteRequestEntityInterface, {__index = BasicDataTableInterface})
QuoteRequestEntityInterface.java_interfaces = function() return {BasicDataTableInterface} end


-- throws Exception
function QuoteRequestEntityInterface:get(userName, id)
    error("abstract method get")
end


function QuoteRequestEntityInterface:getIds(userName)
    error("abstract method getIds")
end


function QuoteRequestEntityInterface:deleteWhere(key, value)
    error("abstract method deleteWhere")
end


function QuoteRequestEntityInterface:insert(values)
    error("abstract method insert")
end


function QuoteRequestEntityInterface:update(userName, updatedValues)
    error("abstract method update")
end

return QuoteRequestEntityInterface

