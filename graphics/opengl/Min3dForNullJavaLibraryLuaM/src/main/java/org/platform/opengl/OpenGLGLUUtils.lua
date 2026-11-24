-- Generated Code Do Not Modify
-- package org.platform.opengl

local OpenGLGLUUtils = {}
package.loaded["org.platform.opengl.OpenGLGLUUtils"] = OpenGLGLUUtils

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

-- local ByteBuffer = require("java.nio.ByteBuffer")
-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
local OpenGLBitmap = java_lazy("org.allbinary.graphics.OpenGLBitmap")
local OpenGLESImage = java_lazy("org.allbinary.image.opengles.OpenGLESImage")

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

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
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

-- class table OpenGLGLUUtils is declared before the requires
OpenGLGLUUtils.__index = OpenGLGLUUtils
OpenGLGLUUtils.className = "OpenGLGLUUtils"
OpenGLGLUUtils.javaClassName = "org.platform.opengl.OpenGLGLUUtils"

function OpenGLGLUUtils._jinit(self)
    return self
end

function OpenGLGLUUtils.new()
    return OpenGLGLUUtils._jinit(setmetatable({}, OpenGLGLUUtils))
end


function OpenGLGLUUtils.getInstance()
        return OpenGLGLUUtils.instance_f
end


function OpenGLGLUUtils:makeByteBuffer(bmp, flip)
        error(require("java.lang.RuntimeException").new(), 0)
end


function OpenGLGLUUtils:texImage2D_j8_1(gl, glVersion, target, level, generateMipMap, openGLESImage, border, flip)
        error(require("java.lang.RuntimeException").new(), 0)
end


function OpenGLGLUUtils:texImage2D_j8_2(gl, glVersion, target, level, generateMipMap, bitmap, border, flip)
        error(require("java.lang.RuntimeException").new(), 0)
end
function OpenGLGLUUtils:texImage2D(...)
    local count = select("#", ...)
    if count == 8 then return self:texImage2D_j8(...) end
    error("No method texImage2D takes " .. count .. " arguments")
end
OpenGLGLUUtils.texImage2D__jdispatcher = OpenGLGLUUtils.texImage2D
function OpenGLGLUUtils:texImage2D_j8(...)
    local java_a1, java_a2, java_a3, java_a4, java_a5, java_a6, java_a7, java_a8 = ...
    if true and (java_a1 == nil or java_is(java_a1, "GL10")) and (java_a2 == nil or type(java_a2) == "string") and math.type(java_a3) == "integer" and math.type(java_a4) == "integer" and type(java_a5) == "boolean" and (java_a6 == nil or java_is(java_a6, "OpenGLESImage")) and math.type(java_a7) == "integer" and type(java_a8) == "boolean" then return OpenGLGLUUtils.texImage2D_j8_1(self, ...) end
    return OpenGLGLUUtils.texImage2D_j8_2(self, ...)
end

OpenGLGLUUtils.instance_f = OpenGLGLUUtils.new()

return OpenGLGLUUtils

