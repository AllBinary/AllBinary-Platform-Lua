-- Generated Code Do Not Modify
-- package org.allbinary.graphics.opengles.shader

local OpenGLObject3dProcessor = {}
package.loaded["org.allbinary.graphics.opengles.shader.OpenGLObject3dProcessor"] = OpenGLObject3dProcessor

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

local GL10 = java_lazy("javax.microedition.khronos.opengles.GL10")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table OpenGLObject3dProcessor is declared before the requires
OpenGLObject3dProcessor.__index = OpenGLObject3dProcessor
OpenGLObject3dProcessor.className = "OpenGLObject3dProcessor"
OpenGLObject3dProcessor.javaClassName = "org.allbinary.graphics.opengles.shader.OpenGLObject3dProcessor"

function OpenGLObject3dProcessor:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
end

function OpenGLObject3dProcessor._jinit(self)
    OpenGLObject3dProcessor._init_fields(self)
    return self
end

function OpenGLObject3dProcessor.new()
    return OpenGLObject3dProcessor._jinit(setmetatable({}, OpenGLObject3dProcessor))
end


function OpenGLObject3dProcessor:process_j2(gl, object3d)
end


function OpenGLObject3dProcessor:process_j3(gl, object3d, index)
end
function OpenGLObject3dProcessor:process(...)
    local count = select("#", ...)
    if count == 2 then return self:process_j2(...) end
    if count == 3 then return self:process_j3(...) end
    error("No method process takes " .. count .. " arguments")
end
OpenGLObject3dProcessor.process__jdispatcher = OpenGLObject3dProcessor.process

return OpenGLObject3dProcessor

