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
-- package org.allbinary.logic.communication.http.file.upload

local AbFile = require("org.allbinary.logic.io.file.AbFile")
local AbPath = require("org.allbinary.logic.io.path.AbPath")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HttpFilePermissionsUtil = {}
HttpFilePermissionsUtil.__index = HttpFilePermissionsUtil
HttpFilePermissionsUtil.className = "HttpFilePermissionsUtil"

function HttpFilePermissionsUtil.new()
    local self = setmetatable({}, HttpFilePermissionsUtil)
    return self
end


function HttpFilePermissionsUtil.getInstance()
        return HttpFilePermissionsUtil.instance
end


-- throws Exception
function HttpFilePermissionsUtil:create(path)
        local file = AbFile.createAbFileFromAbPath(path)
        if not file:isFile() then
            file:createNewFile()
        end
end

HttpFilePermissionsUtil.instance = HttpFilePermissionsUtil.new()

return HttpFilePermissionsUtil

