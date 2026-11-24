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
-- package org.allbinary.opengles

local JOGL11 = {}
package.loaded["org.allbinary.opengles.JOGL11"] = JOGL11

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

local GL = java_lazy("com.jogamp.opengl.GL")
local GL2 = java_lazy("com.jogamp.opengl.GL2")
-- local Buffer = require("java.nio.Buffer")
-- local FloatBuffer = require("java.nio.FloatBuffer")
-- local IntBuffer = require("java.nio.IntBuffer")
-- local GL11 = require("javax.microedition.khronos.opengles.GL11")
local JOGL10 = require("org.allbinary.opengles.JOGL10")

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

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

--JOGLEToKhronosGL11
-- class table JOGL11 is declared before the requires
JOGL11.__index = JOGL11
JOGL11.className = "JOGL11"
JOGL11.javaClassName = "org.allbinary.opengles.JOGL11"
setmetatable(JOGL11, {__index = JOGL10})
JOGL11.java_implements = " GL11 "
JOGL11.java_interfaces = function() return {GL11} end

function JOGL11:_init_fields()
    if self.gl11 == nil then self.gl11 = nil end
end

function JOGL11._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return JOGL11._new1(self, ...)
    elseif count == 2 then return JOGL11._new2(self, ...)
    end
    error("No constructor of JOGL11 takes " .. count .. " arguments")
end

function JOGL11.new(...)
    local self = setmetatable({}, JOGL11)
    JOGL11._jinit(self, ...)
    return self
end


function JOGL11._new1(self, gl)
    JOGL11._jinit(self, gl, gl)
        -- this(...) made self above
    return self
end


function JOGL11._new2(self, gl, gl2)
    java_super_init(JOGL10, self, gl, gl2)
    JOGL11._init_fields(self)
        -- super(...) made self above
        self.gl11 = self:getJOGLGL()
    return self
end


function JOGL11:glBindBuffer(target, buffer)
        self.gl11:glBindBuffer(target, buffer)
end
java_overload(JOGL11, "glBindBuffer", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function JOGL11:glBufferData(target, size, data, usage)
        self.gl11:glBufferData(target, size, data, usage)
end
java_overload(JOGL11, "glBufferData", 4, function(java_a1, java_a2, java_a3, java_a4) return true and type(java_a1) == "number" and type(java_a2) == "number" and (java_a3 == nil or java_is(java_a3, "Buffer")) and type(java_a4) == "number" end)


function JOGL11:glBufferSubData(target, offset, size, data)
        self.gl11:glBufferSubData(target, offset, size, data)
end
java_overload(JOGL11, "glBufferSubData", 4, function(java_a1, java_a2, java_a3, java_a4) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" and (java_a4 == nil or java_is(java_a4, "Buffer")) end)


function JOGL11:glClipPlanef_j3(plane, equation, offset)
        self.gl11:glClipPlanef(plane, equation, offset)
end


function JOGL11:glClipPlanef_j2(plane, equation)
        self.gl11:glClipPlanef(plane, equation)
end
function JOGL11:glClipPlanef(...)
    local count = select("#", ...)
    if count == 3 then return self:glClipPlanef_j3(...) end
    if count == 2 then return self:glClipPlanef_j2(...) end
    error("No method glClipPlanef takes " .. count .. " arguments")
end
JOGL11.glClipPlanef__jdispatcher = JOGL11.glClipPlanef


function JOGL11:glColor4ub(red, green, blue, alpha)
        self.gl11:glColor4ub(red, green, blue, alpha)
end
java_overload(JOGL11, "glColor4ub", 4, function(java_a1, java_a2, java_a3, java_a4) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" end)


function JOGL11:glColorPointer(size, type, stride, offset)
        self.gl11:glColorPointer(size, type, stride, offset)
end
java_overload(JOGL11, "glColorPointer", 4, function(java_a1, java_a2, java_a3, java_a4) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" end)


function JOGL11:glDeleteBuffers_j3(n, buffers, offset)
        self.gl11:glDeleteBuffers(n, buffers, offset)
end


function JOGL11:glDeleteBuffers_j2(n, buffers)
        self.gl11:glDeleteBuffers(n, buffers)
end
function JOGL11:glDeleteBuffers(...)
    local count = select("#", ...)
    if count == 3 then return self:glDeleteBuffers_j3(...) end
    if count == 2 then return self:glDeleteBuffers_j2(...) end
    error("No method glDeleteBuffers takes " .. count .. " arguments")
end
JOGL11.glDeleteBuffers__jdispatcher = JOGL11.glDeleteBuffers


function JOGL11:glDrawElements(mode, count, type, offset)
        self.gl11:glDrawElements(mode, count, type, offset)
end
java_overload(JOGL11, "glDrawElements", 4, function(java_a1, java_a2, java_a3, java_a4) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" end)


function JOGL11:glGenBuffers_j3(n, buffers, offset)
        self.gl11:glGenBuffers(n, buffers, offset)
end


function JOGL11:glGenBuffers_j2(n, buffers)
        self.gl11:glGenBuffers(n, buffers)
end
function JOGL11:glGenBuffers(...)
    local count = select("#", ...)
    if count == 3 then return self:glGenBuffers_j3(...) end
    if count == 2 then return self:glGenBuffers_j2(...) end
    error("No method glGenBuffers takes " .. count .. " arguments")
end
JOGL11.glGenBuffers__jdispatcher = JOGL11.glGenBuffers


function JOGL11:glGetBufferParameteriv_j4(target, pname, params, offset)
        self.gl11:glGetBufferParameteriv(target, pname, params, offset)
end


function JOGL11:glGetBufferParameteriv_j3(target, pname, params)
        self.gl11:glGetBufferParameteriv(target, pname, params)
end
function JOGL11:glGetBufferParameteriv(...)
    local count = select("#", ...)
    if count == 4 then return self:glGetBufferParameteriv_j4(...) end
    if count == 3 then return self:glGetBufferParameteriv_j3(...) end
    error("No method glGetBufferParameteriv takes " .. count .. " arguments")
end
JOGL11.glGetBufferParameteriv__jdispatcher = JOGL11.glGetBufferParameteriv


function JOGL11:glGetClipPlanef_j3(pname, eqn, offset)
        self.gl11:glGetClipPlanef(pname, eqn, offset)
end


function JOGL11:glGetClipPlanef_j2(pname, eqn)
        self.gl11:glGetClipPlanef(pname, eqn)
end
function JOGL11:glGetClipPlanef(...)
    local count = select("#", ...)
    if count == 3 then return self:glGetClipPlanef_j3(...) end
    if count == 2 then return self:glGetClipPlanef_j2(...) end
    error("No method glGetClipPlanef takes " .. count .. " arguments")
end
JOGL11.glGetClipPlanef__jdispatcher = JOGL11.glGetClipPlanef


function JOGL11:glGetFloatv_j3(pname, params, offset)
        self.gl11:glGetFloatv(pname, params, offset)
end


function JOGL11:glGetFloatv_j2(pname, params)
        self.gl11:glGetFloatv(pname, params)
end
function JOGL11:glGetFloatv(...)
    local count = select("#", ...)
    if count == 3 then return self:glGetFloatv_j3(...) end
    if count == 2 then return self:glGetFloatv_j2(...) end
    error("No method glGetFloatv takes " .. count .. " arguments")
end
JOGL11.glGetFloatv__jdispatcher = JOGL11.glGetFloatv


function JOGL11:glGetLightfv_j4(light, pname, params, offset)
        self.gl11:glGetLightfv(light, pname, params, offset)
end


function JOGL11:glGetLightfv_j3(light, pname, params)
        self.gl11:glGetLightfv(light, pname, params)
end
function JOGL11:glGetLightfv(...)
    local count = select("#", ...)
    if count == 4 then return self:glGetLightfv_j4(...) end
    if count == 3 then return self:glGetLightfv_j3(...) end
    error("No method glGetLightfv takes " .. count .. " arguments")
end
JOGL11.glGetLightfv__jdispatcher = JOGL11.glGetLightfv


function JOGL11:glGetMaterialfv_j4(face, pname, params, offset)
        self.gl11:glGetMaterialfv(face, pname, params, offset)
end


function JOGL11:glGetMaterialfv_j3(face, pname, params)
        self.gl11:glGetMaterialfv(face, pname, params)
end
function JOGL11:glGetMaterialfv(...)
    local count = select("#", ...)
    if count == 4 then return self:glGetMaterialfv_j4(...) end
    if count == 3 then return self:glGetMaterialfv_j3(...) end
    error("No method glGetMaterialfv takes " .. count .. " arguments")
end
JOGL11.glGetMaterialfv__jdispatcher = JOGL11.glGetMaterialfv


function JOGL11:glGetTexEnviv_j4(env, pname, params, offset)
        self.gl11:glGetTexEnviv(env, pname, params, offset)
end


function JOGL11:glGetTexEnviv_j3(env, pname, params)
        self.gl11:glGetTexEnviv(env, pname, params)
end
function JOGL11:glGetTexEnviv(...)
    local count = select("#", ...)
    if count == 4 then return self:glGetTexEnviv_j4(...) end
    if count == 3 then return self:glGetTexEnviv_j3(...) end
    error("No method glGetTexEnviv takes " .. count .. " arguments")
end
JOGL11.glGetTexEnviv__jdispatcher = JOGL11.glGetTexEnviv


function JOGL11:glGetTexParameterfv_j4(target, pname, params, offset)
        self.gl11:glGetTexParameterfv(target, pname, params, offset)
end


function JOGL11:glGetTexParameterfv_j3(target, pname, params)
        self.gl11:glGetTexParameterfv(target, pname, params)
end
function JOGL11:glGetTexParameterfv(...)
    local count = select("#", ...)
    if count == 4 then return self:glGetTexParameterfv_j4(...) end
    if count == 3 then return self:glGetTexParameterfv_j3(...) end
    error("No method glGetTexParameterfv takes " .. count .. " arguments")
end
JOGL11.glGetTexParameterfv__jdispatcher = JOGL11.glGetTexParameterfv


function JOGL11:glGetTexParameteriv_j4(target, pname, params, offset)
        self.gl11:glGetTexParameteriv(target, pname, params, offset)
end


function JOGL11:glGetTexParameteriv_j3(target, pname, params)
        self.gl11:glGetTexParameteriv(target, pname, params)
end
function JOGL11:glGetTexParameteriv(...)
    local count = select("#", ...)
    if count == 4 then return self:glGetTexParameteriv_j4(...) end
    if count == 3 then return self:glGetTexParameteriv_j3(...) end
    error("No method glGetTexParameteriv takes " .. count .. " arguments")
end
JOGL11.glGetTexParameteriv__jdispatcher = JOGL11.glGetTexParameteriv


function JOGL11:glIsBuffer(buffer)
        return self.gl11:glIsBuffer(buffer)
end
java_overload(JOGL11, "glIsBuffer", 1, function(java_a1) return true and type(java_a1) == "number" end)


function JOGL11:glIsEnabled(cap)
        return self.gl11:glIsEnabled(cap)
end
java_overload(JOGL11, "glIsEnabled", 1, function(java_a1) return true and type(java_a1) == "number" end)


function JOGL11:glIsTexture(texture)
        return self.gl11:glIsTexture(texture)
end
java_overload(JOGL11, "glIsTexture", 1, function(java_a1) return true and type(java_a1) == "number" end)


function JOGL11:glNormalPointer(type, stride, offset)
        self.gl11:glNormalPointer(type, stride, offset)
end
java_overload(JOGL11, "glNormalPointer", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" end)


function JOGL11:glPointParameterf(pname, param)
        self.gl11:glPointParameterf(pname, param)
end
java_overload(JOGL11, "glPointParameterf", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function JOGL11:glPointParameterfv_j3(pname, params, offset)
        self.gl11:glPointParameterfv(pname, params, offset)
end


function JOGL11:glPointParameterfv_j2(pname, params)
        self.gl11:glPointParameterfv(pname, params)
end
function JOGL11:glPointParameterfv(...)
    local count = select("#", ...)
    if count == 3 then return self:glPointParameterfv_j3(...) end
    if count == 2 then return self:glPointParameterfv_j2(...) end
    error("No method glPointParameterfv takes " .. count .. " arguments")
end
JOGL11.glPointParameterfv__jdispatcher = JOGL11.glPointParameterfv


function JOGL11:glTexCoordPointer(size, type, stride, offset)
        self.gl11:glTexCoordPointer(size, type, stride, offset)
end
java_overload(JOGL11, "glTexCoordPointer", 4, function(java_a1, java_a2, java_a3, java_a4) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" end)


function JOGL11:glTexEnvi(target, pname, param)
        self.gl11:glTexEnvi(target, pname, param)
end
java_overload(JOGL11, "glTexEnvi", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" end)


function JOGL11:glTexEnviv_j4(target, pname, params, offset)
        self.gl11:glTexEnviv(target, pname, params, offset)
end


function JOGL11:glTexEnviv_j3(target, pname, params)
        self.gl11:glTexEnviv(target, pname, params)
end
function JOGL11:glTexEnviv(...)
    local count = select("#", ...)
    if count == 4 then return self:glTexEnviv_j4(...) end
    if count == 3 then return self:glTexEnviv_j3(...) end
    error("No method glTexEnviv takes " .. count .. " arguments")
end
JOGL11.glTexEnviv__jdispatcher = JOGL11.glTexEnviv


function JOGL11:glTexParameterfv_j4(target, pname, params, offset)
        self.gl11:glTexParameterfv(target, pname, params, offset)
end


function JOGL11:glTexParameterfv_j3(target, pname, params)
        self.gl11:glTexParameterfv(target, pname, params)
end
function JOGL11:glTexParameterfv(...)
    local count = select("#", ...)
    if count == 4 then return self:glTexParameterfv_j4(...) end
    if count == 3 then return self:glTexParameterfv_j3(...) end
    error("No method glTexParameterfv takes " .. count .. " arguments")
end
JOGL11.glTexParameterfv__jdispatcher = JOGL11.glTexParameterfv


function JOGL11:glTexParameteri(target, pname, param)
        self.gl11:glTexParameteri(target, pname, param)
end
java_overload(JOGL11, "glTexParameteri", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" end)


function JOGL11:glTexParameteriv_j4(target, pname, params, offset)
        self.gl11:glTexParameteriv(target, pname, params, offset)
end


function JOGL11:glTexParameteriv_j3(target, pname, params)
        self.gl11:glTexParameteriv(target, pname, params)
end
function JOGL11:glTexParameteriv(...)
    local count = select("#", ...)
    if count == 4 then return self:glTexParameteriv_j4(...) end
    if count == 3 then return self:glTexParameteriv_j3(...) end
    error("No method glTexParameteriv takes " .. count .. " arguments")
end
JOGL11.glTexParameteriv__jdispatcher = JOGL11.glTexParameteriv


function JOGL11:glTexParameterxv(target, pname, params, offset)
        self.gl11:glTexParameteriv(target, pname, params, offset)
end
java_overload(JOGL11, "glTexParameterxv", 4, function(java_a1, java_a2, java_a3, java_a4) return true and type(java_a1) == "number" and type(java_a2) == "number" and (java_a3 == nil or (type(java_a3) == "table" and getmetatable(java_a3) == nil and (java_a3.jt == nil or java_a3.jt == "I") and (java_a3[1] == nil or math.type(java_a3[1]) == "integer"))) and type(java_a4) == "number" end)


function JOGL11:glVertexPointer(size, type, stride, offset)
        self.gl11:glVertexPointer(size, type, stride, offset)
end
java_overload(JOGL11, "glVertexPointer", 4, function(java_a1, java_a2, java_a3, java_a4) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" end)

return JOGL11

