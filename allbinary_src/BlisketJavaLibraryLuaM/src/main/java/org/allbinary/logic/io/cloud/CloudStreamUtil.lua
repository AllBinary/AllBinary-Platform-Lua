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

local CloudStreamUtil = {}
package.loaded["org.allbinary.logic.io.CloudStreamUtil"] = CloudStreamUtil

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

local InputStream = java_lazy("java.io.InputStream")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

-- class table CloudStreamUtil is declared before the requires
CloudStreamUtil.__index = CloudStreamUtil
CloudStreamUtil.className = "CloudStreamUtil"
CloudStreamUtil.javaClassName = "org.allbinary.logic.io.CloudStreamUtil"

function CloudStreamUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function CloudStreamUtil._jinit(self)
    CloudStreamUtil._init_fields(self)
    return self
end

function CloudStreamUtil.new()
    return CloudStreamUtil._jinit(setmetatable({}, CloudStreamUtil))
end


function CloudStreamUtil.getInstance()
        return CloudStreamUtil.instance_f
end


-- throws Exception
function CloudStreamUtil:getFile(file)
        local inputStream = AbFileInputStream.createFromAbFile(file)
        local available = inputStream:available()
        if available > 0 then
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF(require("allbinary_java").to_string("Cloud File Bytes: ") .. require("allbinary_java").to_string(available), self, "processRequest()")
            end
        end
        return inputStream
end


-- throws Exception
function CloudStreamUtil:getFileAnyWhere(file)
        local inputStream = AbFileLocalInputStream.new(file)
        local available = inputStream:available()
        if available > 0 then
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF(require("allbinary_java").to_string("Local File Bytes: ") .. require("allbinary_java").to_string(available), self, "processRequest()")
            end
        else
            inputStream = AbFileInputStream.createFromAbFile(file)
            available = inputStream:available()
            if available > 0 then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                    self.logUtil:putF(require("allbinary_java").to_string("Cloud File Bytes: ") .. require("allbinary_java").to_string(available), self, "processRequest()")
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
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF(require("allbinary_java").to_string("Local File Bytes: ") .. require("allbinary_java").to_string(available), self, "processRequest()")
            end
        end
        return inputStream
end

CloudStreamUtil.instance_f = CloudStreamUtil.new()

return CloudStreamUtil

