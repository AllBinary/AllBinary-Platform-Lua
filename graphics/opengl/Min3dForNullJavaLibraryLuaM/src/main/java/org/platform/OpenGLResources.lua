-- Generated Code Do Not Modify
-- package org.platform

-- local InputStream = require("java.io.InputStream")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OpenGLResources = {}
OpenGLResources.__index = OpenGLResources
OpenGLResources.className = "OpenGLResources"

function OpenGLResources.new()
    local self = setmetatable({}, OpenGLResources)
    return self
end


function OpenGLResources.getInstance()
        return OpenGLResources.instance
end


function OpenGLResources:init()
end


function OpenGLResources:isExcluded(name)
        error(java_exception("RuntimeException"), 0)
end


function OpenGLResources:getIdentifier(name, defType, defPackage)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function OpenGLResources:openRawResource(id)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function OpenGLResources:openRawResourceFromName(resourceName)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function OpenGLResources:getResourceAsStream(resourceName)
        error(java_exception("RuntimeException"), 0)
end


function OpenGLResources:getPackageName()
        error(java_exception("RuntimeException"), 0)
end

OpenGLResources.instance = OpenGLResources.new()

return OpenGLResources

