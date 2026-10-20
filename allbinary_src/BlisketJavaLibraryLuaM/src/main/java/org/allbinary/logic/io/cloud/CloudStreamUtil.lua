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
-- package org.allbinary.logic.io

-- local InputStream = require("java.io.InputStream")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CloudStreamUtil = {}
CloudStreamUtil.__index = CloudStreamUtil
CloudStreamUtil.className = "CloudStreamUtil"

function CloudStreamUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function CloudStreamUtil.new()
    local self = setmetatable({}, CloudStreamUtil)
    self:_init_fields()
    return self
end


function CloudStreamUtil.getInstance()
        return CloudStreamUtil.instance
end


-- throws Exception
function CloudStreamUtil:getFile(file)
        local inputStream = AbFileInputStream.new(file)
        local available = inputStream:available()
        if available > 0 then
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Cloud File Bytes: " .. tostring(available), self, "processRequest()")
            end
        end
        return inputStream
end


-- throws Exception
function CloudStreamUtil:getFileAnyWhere(file)
        local inputStream = AbFileLocalInputStream.new(file)
        local available = inputStream:available()
        if available > 0 then
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Local File Bytes: " .. tostring(available), self, "processRequest()")
            end
        else
            inputStream = AbFileInputStream.new(file)
            available = inputStream:available()
            if available > 0 then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                    self.logUtil:putF("Cloud File Bytes: " .. tostring(available), self, "processRequest()")
                end
            end
        end
        return inputStream
end


-- throws Exception
function CloudStreamUtil:getFileLocal(file)
        local inputStream = AbFileLocalInputStream.new(file)
        local available = inputStream:available()
        if available > 0 then
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Local File Bytes: " .. tostring(available), self, "processRequest()")
            end
        end
        return inputStream
end

CloudStreamUtil.instance = CloudStreamUtil.new()

return CloudStreamUtil

