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

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local QuoteRequest = require("org.allbinary.business.user.quoterequest.QuoteRequest")
local BasicDataTableInterface = require("org.allbinary.data.tables.BasicDataTableInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local QuoteRequestEntityInterface = {}
QuoteRequestEntityInterface.__index = QuoteRequestEntityInterface
QuoteRequestEntityInterface.className = "QuoteRequestEntityInterface"
setmetatable(QuoteRequestEntityInterface, {__index = BasicDataTableInterface})


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

