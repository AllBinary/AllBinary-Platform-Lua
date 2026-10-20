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

local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local DbConnectionInfo = require("org.allbinary.business.init.db.DbConnectionInfo")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--import org.allbinary.logic.communication.log.config.type.LogConfigTypes;
local DbInitInfo = {}
DbInitInfo.__index = DbInitInfo
DbInitInfo.className = "DbInitInfo"
setmetatable(DbInitInfo, {__index = DbConnectionInfo})


function DbInitInfo.new(initFileName, read)
    local self = setmetatable(DbConnectionInfo.new(), DbInitInfo)
        -- super(...) made self above
    return self
end


function DbInitInfo:getUrl()
        local url = DbConnectionInfo.getUrl(self)
        PreLogUtil.put("Url: " .. url, self, "getUrl")
        return url
end


-- throws Exception
function DbInitInfo:write()
end


-- throws Exception
function DbInitInfo:load()
end


function DbInitInfo:setHasRead(value)
end

return DbInitInfo

