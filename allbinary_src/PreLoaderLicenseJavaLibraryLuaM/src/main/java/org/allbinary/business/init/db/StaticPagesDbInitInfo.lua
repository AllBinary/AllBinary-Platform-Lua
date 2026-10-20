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

local StaticPagesDbInitInfo = {}
StaticPagesDbInitInfo.__index = StaticPagesDbInitInfo
StaticPagesDbInitInfo.className = "StaticPagesDbInitInfo"
setmetatable(StaticPagesDbInitInfo, {__index = DbInitInfo})

function StaticPagesDbInitInfo.new(...)
    local count = select("#", ...)
    if count == 0 then return StaticPagesDbInitInfo._new0(...)
    elseif count == 1 then return StaticPagesDbInitInfo._new1(...)
    end
end


function StaticPagesDbInitInfo._new0()
    local self = setmetatable(DbInitInfo.new(StaticPagesDbInitInfo.INITFILE, true), StaticPagesDbInitInfo)
        -- super(...) made self above
    return self
end


function StaticPagesDbInitInfo._new1(read)
    local self = setmetatable(DbInitInfo.new(StaticPagesDbInitInfo.INITFILE, read), StaticPagesDbInitInfo)
        -- super(...) made self above
    return self
end

StaticPagesDbInitInfo.INITFILE = "staticpagesbinitdata.dat"

return StaticPagesDbInitInfo

