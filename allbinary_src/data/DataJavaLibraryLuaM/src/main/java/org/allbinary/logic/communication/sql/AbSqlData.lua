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
-- package org.allbinary.logic.communication.sql


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbSqlData = {}
AbSqlData.__index = AbSqlData
AbSqlData.className = "AbSqlData"


function AbSqlData.new()
    local self = setmetatable({}, AbSqlData)
    return self
end

AbSqlData.ANYSINGLECHARACTERMATCH = "_"
AbSqlData.ANYMULTICHARACTERMATCH = "%"
AbSqlData.MAXNUM = 19
AbSqlData.MINSTRING = 1
AbSqlData.MAXSTRING = 255
AbSqlData.MAXBLOB = 32000

return AbSqlData

