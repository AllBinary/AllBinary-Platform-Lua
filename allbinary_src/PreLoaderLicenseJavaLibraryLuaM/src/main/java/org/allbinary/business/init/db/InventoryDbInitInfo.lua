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

local DbInitInfo = require("org.allbinary.business.init.db.DbInitInfo")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InventoryDbInitInfo = {}
InventoryDbInitInfo.__index = InventoryDbInitInfo
InventoryDbInitInfo.className = "InventoryDbInitInfo"
setmetatable(InventoryDbInitInfo, {__index = DbInitInfo})

function InventoryDbInitInfo.new(...)
    local count = select("#", ...)
    if count == 0 then return InventoryDbInitInfo._new0(...)
    elseif count == 1 then return InventoryDbInitInfo._new1(...)
    end
end


function InventoryDbInitInfo._new0()
    local self = setmetatable(DbInitInfo.new(InventoryDbInitInfo.INITFILE, true), InventoryDbInitInfo)
        -- super(...) made self above
    return self
end


function InventoryDbInitInfo._new1(read)
    local self = setmetatable(DbInitInfo.new(InventoryDbInitInfo.INITFILE, read), InventoryDbInitInfo)
        -- super(...) made self above
    return self
end

InventoryDbInitInfo.INITFILE = "inventorydbinitdata.dat"

return InventoryDbInitInfo

