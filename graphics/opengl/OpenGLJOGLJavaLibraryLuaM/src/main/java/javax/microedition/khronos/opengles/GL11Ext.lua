-- Generated Code Do Not Modify
-- package javax.microedition.khronos.opengles

local GL11Ext = {}
package.loaded["javax.microedition.khronos.opengles.GL11Ext"] = GL11Ext

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

-- local Buffer = require("java.nio.Buffer")
-- local FloatBuffer = require("java.nio.FloatBuffer")
-- local IntBuffer = require("java.nio.IntBuffer")
-- local ShortBuffer = require("java.nio.ShortBuffer")
local GL = require("javax.microedition.khronos.opengles.GL")

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

-- Java interface
-- class table GL11Ext is declared before the requires
GL11Ext.__index = GL11Ext
GL11Ext.className = "GL11Ext"
GL11Ext.javaClassName = "javax.microedition.khronos.opengles.GL11Ext"
setmetatable(GL11Ext, {__index = GL})
GL11Ext.java_interfaces = function() return {GL} end


function GL11Ext:glTexParameterfv(target, pname, param, offset)
    error("abstract method glTexParameterfv")
end


function GL11Ext:glCurrentPaletteMatrixOES(matrixpaletteindex)
    error("abstract method glCurrentPaletteMatrixOES")
end


function GL11Ext:glDrawTexfOES(x, y, z, width, height)
    error("abstract method glDrawTexfOES")
end


function GL11Ext:glDrawTexfvOES_j2(coords, offset)
    error("abstract method glDrawTexfvOES")
end


function GL11Ext:glDrawTexfvOES_j1(coords)
    error("abstract method glDrawTexfvOES")
end
function GL11Ext:glDrawTexfvOES(...)
    local count = select("#", ...)
    if count == 2 then return self:glDrawTexfvOES_j2(...) end
    if count == 1 then return self:glDrawTexfvOES_j1(...) end
    local parent = getmetatable(GL11Ext).__index
    if parent.glDrawTexfvOES then return parent.glDrawTexfvOES(self, ...) end
    error("No method glDrawTexfvOES takes " .. count .. " arguments")
end
GL11Ext.glDrawTexfvOES__jdispatcher = GL11Ext.glDrawTexfvOES


function GL11Ext:glDrawTexiOES(x, y, z, width, height)
    error("abstract method glDrawTexiOES")
end


function GL11Ext:glDrawTexivOES_j2(coords, offset)
    error("abstract method glDrawTexivOES")
end


function GL11Ext:glDrawTexivOES_j1(coords)
    error("abstract method glDrawTexivOES")
end
function GL11Ext:glDrawTexivOES(...)
    local count = select("#", ...)
    if count == 2 then return self:glDrawTexivOES_j2(...) end
    if count == 1 then return self:glDrawTexivOES_j1(...) end
    local parent = getmetatable(GL11Ext).__index
    if parent.glDrawTexivOES then return parent.glDrawTexivOES(self, ...) end
    error("No method glDrawTexivOES takes " .. count .. " arguments")
end
GL11Ext.glDrawTexivOES__jdispatcher = GL11Ext.glDrawTexivOES


function GL11Ext:glDrawTexsOES(x, y, z, width, height)
    error("abstract method glDrawTexsOES")
end


function GL11Ext:glDrawTexsvOES_j2(coords, offset)
    error("abstract method glDrawTexsvOES")
end


function GL11Ext:glDrawTexsvOES_j1(coords)
    error("abstract method glDrawTexsvOES")
end
function GL11Ext:glDrawTexsvOES(...)
    local count = select("#", ...)
    if count == 2 then return self:glDrawTexsvOES_j2(...) end
    if count == 1 then return self:glDrawTexsvOES_j1(...) end
    local parent = getmetatable(GL11Ext).__index
    if parent.glDrawTexsvOES then return parent.glDrawTexsvOES(self, ...) end
    error("No method glDrawTexsvOES takes " .. count .. " arguments")
end
GL11Ext.glDrawTexsvOES__jdispatcher = GL11Ext.glDrawTexsvOES


function GL11Ext:glDrawTexxOES(x, y, z, width, height)
    error("abstract method glDrawTexxOES")
end


function GL11Ext:glDrawTexxvOES_j2(coords, offset)
    error("abstract method glDrawTexxvOES")
end


function GL11Ext:glDrawTexxvOES_j1(coords)
    error("abstract method glDrawTexxvOES")
end
function GL11Ext:glDrawTexxvOES(...)
    local count = select("#", ...)
    if count == 2 then return self:glDrawTexxvOES_j2(...) end
    if count == 1 then return self:glDrawTexxvOES_j1(...) end
    local parent = getmetatable(GL11Ext).__index
    if parent.glDrawTexxvOES then return parent.glDrawTexxvOES(self, ...) end
    error("No method glDrawTexxvOES takes " .. count .. " arguments")
end
GL11Ext.glDrawTexxvOES__jdispatcher = GL11Ext.glDrawTexxvOES


function GL11Ext:glEnable(cap)
    error("abstract method glEnable")
end


function GL11Ext:glEnableClientState(array)
    error("abstract method glEnableClientState")
end


function GL11Ext:glLoadPaletteFromModelViewMatrixOES()
    error("abstract method glLoadPaletteFromModelViewMatrixOES")
end


function GL11Ext:glMatrixIndexPointerOES_j4_1(size, type, stride, pointer)
    error("abstract method glMatrixIndexPointerOES")
end


function GL11Ext:glMatrixIndexPointerOES_j4_2(size, type, stride, offset)
    error("abstract method glMatrixIndexPointerOES")
end
function GL11Ext:glMatrixIndexPointerOES(...)
    local count = select("#", ...)
    if count == 4 then return self:glMatrixIndexPointerOES_j4(...) end
    local parent = getmetatable(GL11Ext).__index
    if parent.glMatrixIndexPointerOES then return parent.glMatrixIndexPointerOES(self, ...) end
    error("No method glMatrixIndexPointerOES takes " .. count .. " arguments")
end
GL11Ext.glMatrixIndexPointerOES__jdispatcher = GL11Ext.glMatrixIndexPointerOES
function GL11Ext:glMatrixIndexPointerOES_j4(...)
    local java_a1, java_a2, java_a3, java_a4 = ...
    if true and math.type(java_a1) == "integer" and math.type(java_a2) == "integer" and math.type(java_a3) == "integer" and (java_a4 == nil or java_is(java_a4, "Buffer")) then return GL11Ext.glMatrixIndexPointerOES_j4_1(self, ...) end
    return GL11Ext.glMatrixIndexPointerOES_j4_2(self, ...)
end


function GL11Ext:glWeightPointerOES_j4_1(size, type, stride, pointer)
    error("abstract method glWeightPointerOES")
end


function GL11Ext:glWeightPointerOES_j4_2(size, type, stride, offset)
    error("abstract method glWeightPointerOES")
end
function GL11Ext:glWeightPointerOES(...)
    local count = select("#", ...)
    if count == 4 then return self:glWeightPointerOES_j4(...) end
    local parent = getmetatable(GL11Ext).__index
    if parent.glWeightPointerOES then return parent.glWeightPointerOES(self, ...) end
    error("No method glWeightPointerOES takes " .. count .. " arguments")
end
GL11Ext.glWeightPointerOES__jdispatcher = GL11Ext.glWeightPointerOES
function GL11Ext:glWeightPointerOES_j4(...)
    local java_a1, java_a2, java_a3, java_a4 = ...
    if true and math.type(java_a1) == "integer" and math.type(java_a2) == "integer" and math.type(java_a3) == "integer" and (java_a4 == nil or java_is(java_a4, "Buffer")) then return GL11Ext.glWeightPointerOES_j4_1(self, ...) end
    return GL11Ext.glWeightPointerOES_j4_2(self, ...)
end

GL11Ext.GL_MATRIX_INDEX_ARRAY_BUFFER_BINDING_OES = 35742
GL11Ext.GL_MATRIX_INDEX_ARRAY_OES = 34884
GL11Ext.GL_MATRIX_INDEX_ARRAY_POINTER_OES = 34889
GL11Ext.GL_MATRIX_INDEX_ARRAY_SIZE_OES = 34886
GL11Ext.GL_MATRIX_INDEX_ARRAY_STRIDE_OES = 34888
GL11Ext.GL_MATRIX_INDEX_ARRAY_TYPE_OES = 34887
GL11Ext.GL_MATRIX_PALETTE_OES = 34880
GL11Ext.GL_MAX_PALETTE_MATRICES_OES = 34882
GL11Ext.GL_MAX_VERTEX_UNITS_OES = 34468
GL11Ext.GL_TEXTURE_CROP_RECT_OES = 35741
GL11Ext.GL_WEIGHT_ARRAY_BUFFER_BINDING_OES = 34974
GL11Ext.GL_WEIGHT_ARRAY_OES = 34477
GL11Ext.GL_WEIGHT_ARRAY_POINTER_OES = 34476
GL11Ext.GL_WEIGHT_ARRAY_SIZE_OES = 34475
GL11Ext.GL_WEIGHT_ARRAY_STRIDE_OES = 34474
GL11Ext.GL_WEIGHT_ARRAY_TYPE_OES = 34473

return GL11Ext

