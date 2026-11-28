-- Generated Code Do Not Modify
-- package org.platform

local OpenGLResources = {}
package.loaded["org.platform.OpenGLResources"] = OpenGLResources

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table OpenGLResources is declared before the requires
OpenGLResources.__index = OpenGLResources
OpenGLResources.className = "OpenGLResources"
OpenGLResources.javaClassName = "org.platform.OpenGLResources"

function OpenGLResources._jinit(self)
    return self
end

function OpenGLResources.new()
    return OpenGLResources._jinit(setmetatable({}, OpenGLResources))
end


function OpenGLResources.getInstance()
        return OpenGLResources.instance_f
end


function OpenGLResources:init()
end


function OpenGLResources:isExcluded(name)
        error(require("java.lang.RuntimeException").new(), 0)
end


function OpenGLResources:getIdentifier(name, defType, defPackage)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function OpenGLResources:openRawResource(id)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function OpenGLResources:openRawResourceFromName(resourceName)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function OpenGLResources:getResourceAsStream(resourceName)
        error(require("java.lang.RuntimeException").new(), 0)
end


function OpenGLResources:getPackageName()
        error(require("java.lang.RuntimeException").new(), 0)
end

OpenGLResources.instance_f = OpenGLResources.new()

return OpenGLResources

