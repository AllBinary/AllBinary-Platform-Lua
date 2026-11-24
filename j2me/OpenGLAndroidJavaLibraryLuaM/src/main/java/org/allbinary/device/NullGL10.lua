-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.device

local NullGL10 = {}
package.loaded["org.allbinary.device.NullGL10"] = NullGL10

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

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
-- local Buffer = require("java.nio.Buffer")
-- local FloatBuffer = require("java.nio.FloatBuffer")
-- local IntBuffer = require("java.nio.IntBuffer")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")

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

-- class table NullGL10 is declared before the requires
NullGL10.__index = NullGL10
NullGL10.className = "NullGL10"
NullGL10.javaClassName = "org.allbinary.device.NullGL10"
NullGL10.java_implements = " GL10 "
NullGL10.java_interfaces = function() return {GL10} end

function NullGL10._jinit(self)
    return self
end

function NullGL10.new()
    return NullGL10._jinit(setmetatable({}, NullGL10))
end


function NullGL10:glActiveTexture(texture)
        return
end


function NullGL10:glAlphaFunc(func, ref)
        return
end


function NullGL10:glAlphaFuncx(func, ref)
end


function NullGL10:glBindTexture(target, texture)
        return
end


function NullGL10:glBlendFunc(sfactor, dfactor)
        return
end


function NullGL10:glClear(mask)
        return
end


function NullGL10:glClearColor(red, green, blue, alpha)
        return
end


function NullGL10:glClearColorx(red, green, blue, alpha)
end


function NullGL10:glClearDepthf(depth)
        return
end


function NullGL10:glClearDepthx(depth)
end


function NullGL10:glClearStencil(s)
        return
end


function NullGL10:glClientActiveTexture(texture)
        return
end


function NullGL10:glColor4f(red, green, blue, alpha)
        return
end


function NullGL10:glColor4x(red, green, blue, alpha)
end


function NullGL10:glColorMask(red, green, blue, alpha)
        return
end


function NullGL10:glColorPointer(size, type, stride, pointer)
        return
end


function NullGL10:glCompressedTexImage2D(target, level, internalformat, width, height, border, imageSize, data)
        return
end


function NullGL10:glCompressedTexSubImage2D(target, level, xoffset, yoffset, width, height, format, imageSize, data)
        return
end


function NullGL10:glCopyTexImage2D(target, level, internalformat, x, y, width, height, border)
        return
end


function NullGL10:glCopyTexSubImage2D(target, level, xoffset, yoffset, x, y, width, height)
        return
end


function NullGL10:glCullFace(mode)
        return
end


function NullGL10:glDeleteTextures_j3(n, textures, offset)
        return
end


function NullGL10:glDeleteTextures_j2(n, textures)
        return
end
function NullGL10:glDeleteTextures(...)
    local count = select("#", ...)
    if count == 3 then return self:glDeleteTextures_j3(...) end
    if count == 2 then return self:glDeleteTextures_j2(...) end
    error("No method glDeleteTextures takes " .. count .. " arguments")
end
NullGL10.glDeleteTextures__jdispatcher = NullGL10.glDeleteTextures


function NullGL10:glDepthFunc(func)
        return
end


function NullGL10:glDepthMask(flag)
        return
end


function NullGL10:glDepthRangef(zNear, zFar)
        return
end


function NullGL10:glDepthRangex(zNear, zFar)
end


function NullGL10:glDisable(cap)
        return
end


function NullGL10:glDisableClientState(array)
        return
end


function NullGL10:glDrawArrays(mode, first, count)
        return
end


function NullGL10:glDrawElements(mode, count, type, indices)
        return
end


function NullGL10:glEnable(cap)
        return
end


function NullGL10:glEnableClientState(array)
        return
end


function NullGL10:glFinish()
        return
end


function NullGL10:glFlush()
        return
end


function NullGL10:glFogf(pname, param)
        return
end


function NullGL10:glFogfv_j3(pname, params, offset)
        return
end


function NullGL10:glFogfv_j2(pname, params)
        return
end
function NullGL10:glFogfv(...)
    local count = select("#", ...)
    if count == 3 then return self:glFogfv_j3(...) end
    if count == 2 then return self:glFogfv_j2(...) end
    error("No method glFogfv takes " .. count .. " arguments")
end
NullGL10.glFogfv__jdispatcher = NullGL10.glFogfv


function NullGL10:glFogx(pname, param)
end


function NullGL10:glFogxv_j3(pname, params, offset)
end


function NullGL10:glFogxv_j2(pname, params)
end
function NullGL10:glFogxv(...)
    local count = select("#", ...)
    if count == 3 then return self:glFogxv_j3(...) end
    if count == 2 then return self:glFogxv_j2(...) end
    error("No method glFogxv takes " .. count .. " arguments")
end
NullGL10.glFogxv__jdispatcher = NullGL10.glFogxv


function NullGL10:glFrontFace(mode)
        return
end


function NullGL10:glFrustumf(left, right, bottom, top, zNear, zFar)
        return
end


function NullGL10:glFrustumx(left, right, bottom, top, zNear, zFar)
end


function NullGL10:glGenTextures_j3(n, textures, offset)
        return
end


function NullGL10:glGenTextures_j2(n, textures)
        return
end
function NullGL10:glGenTextures(...)
    local count = select("#", ...)
    if count == 3 then return self:glGenTextures_j3(...) end
    if count == 2 then return self:glGenTextures_j2(...) end
    error("No method glGenTextures takes " .. count .. " arguments")
end
NullGL10.glGenTextures__jdispatcher = NullGL10.glGenTextures


function NullGL10:glGetError()
        return 0
end


function NullGL10:glGetIntegerv_j3(pname, params, offset)
        return
end


function NullGL10:glGetIntegerv_j2(pname, params)
        return
end
function NullGL10:glGetIntegerv(...)
    local count = select("#", ...)
    if count == 3 then return self:glGetIntegerv_j3(...) end
    if count == 2 then return self:glGetIntegerv_j2(...) end
    error("No method glGetIntegerv takes " .. count .. " arguments")
end
NullGL10.glGetIntegerv__jdispatcher = NullGL10.glGetIntegerv


function NullGL10:glGetString(name)
        return StringUtil.getInstance().EMPTY_STRING
end


function NullGL10:glHint(target, mode)
        return
end


function NullGL10:glLightModelf(pname, param)
        return
end


function NullGL10:glLightModelfv_j3(pname, params, offset)
        return
end


function NullGL10:glLightModelfv_j2(pname, params)
        return
end
function NullGL10:glLightModelfv(...)
    local count = select("#", ...)
    if count == 3 then return self:glLightModelfv_j3(...) end
    if count == 2 then return self:glLightModelfv_j2(...) end
    error("No method glLightModelfv takes " .. count .. " arguments")
end
NullGL10.glLightModelfv__jdispatcher = NullGL10.glLightModelfv


function NullGL10:glLightModelx(pname, param)
end


function NullGL10:glLightModelxv_j3(pname, params, offset)
end


function NullGL10:glLightModelxv_j2(pname, params)
end
function NullGL10:glLightModelxv(...)
    local count = select("#", ...)
    if count == 3 then return self:glLightModelxv_j3(...) end
    if count == 2 then return self:glLightModelxv_j2(...) end
    error("No method glLightModelxv takes " .. count .. " arguments")
end
NullGL10.glLightModelxv__jdispatcher = NullGL10.glLightModelxv


function NullGL10:glLightf(light, pname, param)
        return
end


function NullGL10:glLightfv_j4(light, pname, params, offset)
        return
end


function NullGL10:glLightfv_j3(light, pname, params)
        return
end
function NullGL10:glLightfv(...)
    local count = select("#", ...)
    if count == 4 then return self:glLightfv_j4(...) end
    if count == 3 then return self:glLightfv_j3(...) end
    error("No method glLightfv takes " .. count .. " arguments")
end
NullGL10.glLightfv__jdispatcher = NullGL10.glLightfv


function NullGL10:glLightx(light, pname, param)
end


function NullGL10:glLightxv_j4(light, pname, params, offset)
end


function NullGL10:glLightxv_j3(light, pname, params)
end
function NullGL10:glLightxv(...)
    local count = select("#", ...)
    if count == 4 then return self:glLightxv_j4(...) end
    if count == 3 then return self:glLightxv_j3(...) end
    error("No method glLightxv takes " .. count .. " arguments")
end
NullGL10.glLightxv__jdispatcher = NullGL10.glLightxv


function NullGL10:glLineWidth(width)
        return
end


function NullGL10:glLineWidthx(width)
end


function NullGL10:glLoadIdentity()
        return
end


function NullGL10:glLoadMatrixf_j2(m, offset)
        return
end


function NullGL10:glLoadMatrixf_j1(m)
        return
end
function NullGL10:glLoadMatrixf(...)
    local count = select("#", ...)
    if count == 2 then return self:glLoadMatrixf_j2(...) end
    if count == 1 then return self:glLoadMatrixf_j1(...) end
    error("No method glLoadMatrixf takes " .. count .. " arguments")
end
NullGL10.glLoadMatrixf__jdispatcher = NullGL10.glLoadMatrixf


function NullGL10:glLoadMatrixx_j2(m, offset)
end


function NullGL10:glLoadMatrixx_j1(m)
end
function NullGL10:glLoadMatrixx(...)
    local count = select("#", ...)
    if count == 2 then return self:glLoadMatrixx_j2(...) end
    if count == 1 then return self:glLoadMatrixx_j1(...) end
    error("No method glLoadMatrixx takes " .. count .. " arguments")
end
NullGL10.glLoadMatrixx__jdispatcher = NullGL10.glLoadMatrixx


function NullGL10:glLogicOp(opcode)
        return
end


function NullGL10:glMaterialf(face, pname, param)
        return
end


function NullGL10:glMaterialfv_j4(face, pname, params, offset)
        return
end


function NullGL10:glMaterialfv_j3(face, pname, params)
        return
end
function NullGL10:glMaterialfv(...)
    local count = select("#", ...)
    if count == 4 then return self:glMaterialfv_j4(...) end
    if count == 3 then return self:glMaterialfv_j3(...) end
    error("No method glMaterialfv takes " .. count .. " arguments")
end
NullGL10.glMaterialfv__jdispatcher = NullGL10.glMaterialfv


function NullGL10:glMaterialx(face, pname, param)
end


function NullGL10:glMaterialxv_j4(face, pname, params, offset)
end


function NullGL10:glMaterialxv_j3(face, pname, params)
end
function NullGL10:glMaterialxv(...)
    local count = select("#", ...)
    if count == 4 then return self:glMaterialxv_j4(...) end
    if count == 3 then return self:glMaterialxv_j3(...) end
    error("No method glMaterialxv takes " .. count .. " arguments")
end
NullGL10.glMaterialxv__jdispatcher = NullGL10.glMaterialxv


function NullGL10:glMatrixMode(mode)
        return
end


function NullGL10:glMultMatrixf_j2(m, offset)
        return
end


function NullGL10:glMultMatrixf_j1(m)
        return
end
function NullGL10:glMultMatrixf(...)
    local count = select("#", ...)
    if count == 2 then return self:glMultMatrixf_j2(...) end
    if count == 1 then return self:glMultMatrixf_j1(...) end
    error("No method glMultMatrixf takes " .. count .. " arguments")
end
NullGL10.glMultMatrixf__jdispatcher = NullGL10.glMultMatrixf


function NullGL10:glMultMatrixx_j2(m, offset)
end


function NullGL10:glMultMatrixx_j1(m)
end
function NullGL10:glMultMatrixx(...)
    local count = select("#", ...)
    if count == 2 then return self:glMultMatrixx_j2(...) end
    if count == 1 then return self:glMultMatrixx_j1(...) end
    error("No method glMultMatrixx takes " .. count .. " arguments")
end
NullGL10.glMultMatrixx__jdispatcher = NullGL10.glMultMatrixx


function NullGL10:glMultiTexCoord4f(target, s, t, r, q)
        return
end


function NullGL10:glMultiTexCoord4x(target, s, t, r, q)
end


function NullGL10:glNormal3f(nx, ny, nz)
        return
end


function NullGL10:glNormal3x(nx, ny, nz)
end


function NullGL10:glNormalPointer(type, stride, pointer)
        return
end


function NullGL10:glOrthof(left, right, bottom, top, zNear, zFar)
        return
end


function NullGL10:glOrthox(left, right, bottom, top, zNear, zFar)
end


function NullGL10:glPixelStorei(pname, param)
        return
end


function NullGL10:glPointSize(size)
        return
end


function NullGL10:glPointSizex(size)
end


function NullGL10:glPolygonOffset(factor, units)
        return
end


function NullGL10:glPolygonOffsetx(factor, units)
end


function NullGL10:glPopMatrix()
        return
end


function NullGL10:glPushMatrix()
        return
end


function NullGL10:glReadPixels(x, y, width, height, format, type, pixels)
        return
end


function NullGL10:glRotatef(angle, x, y, z)
        return
end


function NullGL10:glRotatex(angle, x, y, z)
        return
end


function NullGL10:glSampleCoverage(value, invert)
        return
end


function NullGL10:glSampleCoveragex(value, invert)
end


function NullGL10:glScalef(x, y, z)
        return
end


function NullGL10:glScalex(x, y, z)
        return
end


function NullGL10:glScissor(x, y, width, height)
        return
end


function NullGL10:glShadeModel(mode)
        return
end


function NullGL10:glStencilFunc(func, ref, mask)
        return
end


function NullGL10:glStencilMask(mask)
        return
end


function NullGL10:glStencilOp(fail, zfail, zpass)
        return
end


function NullGL10:glTexCoordPointer(size, type, stride, pointer)
        return
end


function NullGL10:glTexEnvf(target, pname, param)
        return
end


function NullGL10:glTexEnvfv_j4(target, pname, params, offset)
        return
end


function NullGL10:glTexEnvfv_j3(target, pname, params)
        return
end
function NullGL10:glTexEnvfv(...)
    local count = select("#", ...)
    if count == 4 then return self:glTexEnvfv_j4(...) end
    if count == 3 then return self:glTexEnvfv_j3(...) end
    error("No method glTexEnvfv takes " .. count .. " arguments")
end
NullGL10.glTexEnvfv__jdispatcher = NullGL10.glTexEnvfv


function NullGL10:glTexEnvx(target, pname, param)
end


function NullGL10:glTexEnvxv_j4(target, pname, params, offset)
end


function NullGL10:glTexEnvxv_j3(target, pname, params)
end
function NullGL10:glTexEnvxv(...)
    local count = select("#", ...)
    if count == 4 then return self:glTexEnvxv_j4(...) end
    if count == 3 then return self:glTexEnvxv_j3(...) end
    error("No method glTexEnvxv takes " .. count .. " arguments")
end
NullGL10.glTexEnvxv__jdispatcher = NullGL10.glTexEnvxv


function NullGL10:glTexImage2D(target, level, internalformat, width, height, border, format, type, pixels)
        return
end


function NullGL10:glTexParameterf(target, pname, param)
        return
end


function NullGL10:glTexParameterx(target, pname, param)
end


function NullGL10:glTexSubImage2D(target, level, xoffset, yoffset, width, height, format, type, pixels)
        return
end


function NullGL10:glTranslatef(x, y, z)
        return
end


function NullGL10:glTranslatex(x, y, z)
end


function NullGL10:glVertexPointer(size, type, stride, pointer)
        return
end


function NullGL10:glViewport(x, y, width, height)
        return
end

NullGL10.NULL_GL10 = NullGL10.new()

return NullGL10

