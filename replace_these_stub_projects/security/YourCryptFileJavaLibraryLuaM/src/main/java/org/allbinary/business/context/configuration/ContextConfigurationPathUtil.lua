-- Generated Code Do Not Modify
-- package org.allbinary.business.context.configuration

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

local ContextConfigurationPathUtil = {}
ContextConfigurationPathUtil.__index = ContextConfigurationPathUtil
ContextConfigurationPathUtil.className = "ContextConfigurationPathUtil"

function ContextConfigurationPathUtil.new()
    local self = setmetatable({}, ContextConfigurationPathUtil)
    return self
end


-- throws Exception
function ContextConfigurationPathUtil.getAbFile(contextName)
        return nil
end


-- throws Exception
function ContextConfigurationPathUtil.getAbPath(contextName)
        return nil
end


-- throws Exception
function ContextConfigurationPathUtil.getPath()
        return nil
end


function ContextConfigurationPathUtil.getFileName(contextName)
        return nil
end

return ContextConfigurationPathUtil

