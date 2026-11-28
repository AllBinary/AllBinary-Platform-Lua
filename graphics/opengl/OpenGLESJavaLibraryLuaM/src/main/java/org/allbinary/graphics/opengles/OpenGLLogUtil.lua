-- Generated Code Do Not Modify
-- package org.allbinary.graphics.opengles

local OpenGLLogUtil = {}
package.loaded["org.allbinary.graphics.opengles.OpenGLLogUtil"] = OpenGLLogUtil

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
local Image = java_lazy("javax.microedition.lcdui.Image")
local OpenGLStrings = java_lazy("org.allbinary.image.opengles.OpenGLStrings")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table OpenGLLogUtil is declared before the requires
OpenGLLogUtil.__index = OpenGLLogUtil
OpenGLLogUtil.className = "OpenGLLogUtil"
OpenGLLogUtil.javaClassName = "org.allbinary.graphics.opengles.OpenGLLogUtil"

function OpenGLLogUtil:_init_fields()
    self.MAX_TEXTURE = " Max Texture Size: "
    self.LOG_ERROR = "logError"
    self.IMAGE = " Image: "
end

function OpenGLLogUtil._jinit(self)
    OpenGLLogUtil._init_fields(self)
    return self
end

function OpenGLLogUtil.new()
    return OpenGLLogUtil._jinit(setmetatable({}, OpenGLLogUtil))
end


function OpenGLLogUtil.getInstance()
        return OpenGLLogUtil.instance_f
end


function OpenGLLogUtil:logError_j1(gl)
        local error = gl:glGetError()
        if not rawequal(error, GL10.GL_NO_ERROR) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append(OpenGLStrings.getInstance().GL_ERROR_LABEL)
            stringBuffer:appendint(error)
            if rawequal(error, 1281) then
                stringBuffer:append(self.MAX_TEXTURE)
                local maxTextureSize = java_typed_array("I", java_new_array(0, 1))
                gl:glGetIntegerv(GL10.GL_MAX_TEXTURE_SIZE, maxTextureSize, 0)
                stringBuffer:appendint(maxTextureSize[1])
            end
            if rawequal(error, 1280) then
                PreLogUtil.put(tostring(stringBuffer), self, OpenGLStrings.getInstance().SET)
            else
                ForcedLogUtil.log(tostring(stringBuffer), self)
            end
        end
end


function OpenGLLogUtil:logError_j2(gl, image)
        local error = gl:glGetError()
        if not rawequal(error, GL10.GL_NO_ERROR) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append(OpenGLStrings.getInstance().GL_ERROR_LABEL)
            stringBuffer:appendint(error)
            if rawequal(error, 1281) then
                stringBuffer:append(self.MAX_TEXTURE)
                local maxTextureSize = java_typed_array("I", java_new_array(0, 1))
                gl:glGetIntegerv(GL10.GL_MAX_TEXTURE_SIZE, maxTextureSize, 0)
                stringBuffer:appendint(maxTextureSize[1])
            end
            stringBuffer:append(self.IMAGE)
            stringBuffer:append(tostring(image))
            PreLogUtil.put(tostring(stringBuffer), self, self.LOG_ERROR)
        end
end
function OpenGLLogUtil:logError(...)
    local count = select("#", ...)
    if count == 1 then return self:logError_j1(...) end
    if count == 2 then return self:logError_j2(...) end
    error("No method logError takes " .. count .. " arguments")
end
OpenGLLogUtil.logError__jdispatcher = OpenGLLogUtil.logError

OpenGLLogUtil.instance_f = OpenGLLogUtil.new()

return OpenGLLogUtil

