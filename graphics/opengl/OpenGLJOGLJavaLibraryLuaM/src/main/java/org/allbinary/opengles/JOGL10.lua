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

local JOGL10 = {}
package.loaded["org.allbinary.opengles.JOGL10"] = JOGL10

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

local GLU = java_lazy("com.jogamp.opengl.glu.GLU")
local GL = java_lazy("com.jogamp.opengl.GL")
local GL2 = java_lazy("com.jogamp.opengl.GL2")
-- local Buffer = require("java.nio.Buffer")
-- local FloatBuffer = require("java.nio.FloatBuffer")
-- local IntBuffer = require("java.nio.IntBuffer")
local GL10 = java_lazy("javax.microedition.khronos.opengles.GL10")

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

--JOGLEToKhronosGL10
-- class table JOGL10 is declared before the requires
JOGL10.__index = JOGL10
JOGL10.className = "JOGL10"
JOGL10.javaClassName = "org.allbinary.opengles.JOGL10"
JOGL10.java_implements = " GL10 "
JOGL10.java_interfaces = function() return {GL10} end

function JOGL10:_init_fields()
    self.RED = "red: "
    self.GREEN = " green: "
    self.BLUE = " blue: "
    self.ALPHA = " alpha: "
    self.PNAME = "pname: "
    self._PNAME = " pname: "
    self.PARAM = " param: "
    self.PARAMS = " params: "
    self.LIGHT = "light: "
    self.FACE = "face: "
    self.TARGET = "target: "
    if self.gl10 == nil then self.gl10 = nil end
    if self.glu == nil then self.glu = nil end
    if self.GL_LINE == nil then self.GL_LINE = 0 end
    if self.GL_QUAD_STRIP == nil then self.GL_QUAD_STRIP = 0 end
end


function JOGL10._jinit(self, gl, gl2)
    JOGL10._init_fields(self)
        self.gl10 = gl2
        self.glu = GLU.createGLU(self.gl10)
        self.GL_LINE = GL2.GL_LINE
        self.GL_QUAD_STRIP = GL2.GL_QUAD_STRIP
    return self
end

function JOGL10.new(...)
    local self = setmetatable({}, JOGL10)
    JOGL10._jinit(self, ...)
    return self
end


function JOGL10:getJOGLGL()
        return self.gl10
end


function JOGL10:glActiveTexture(texture)
        self.gl10:glActiveTexture(texture)
end


function JOGL10:glAlphaFunc(func, ref)
        self.gl10:glAlphaFunc(func, ref)
end


function JOGL10:glBindTexture(target, texture)
        self.gl10:glBindTexture(target, texture)
end


function JOGL10:glBlendFunc(sfactor, dfactor)
        self.gl10:glBlendFunc(sfactor, dfactor)
end


function JOGL10:glClear(mask)
        self.gl10:glClear(mask)
end


function JOGL10:glClearColor(red, green, blue, alpha)
        self.gl10:glClearColor(red, green, blue, alpha)
end


function JOGL10:glClearDepthf(depth)
        self.gl10:glClearDepthf(depth)
end


function JOGL10:glClearStencil(s)
        self.gl10:glClearStencil(s)
end


function JOGL10:glClientActiveTexture(texture)
        self.gl10:glClientActiveTexture(texture)
end


function JOGL10:glColor4f(red, green, blue, alpha)
        self.gl10:glColor4f(red, green, blue, alpha)
end


function JOGL10:glColorMask(red, green, blue, alpha)
        self.gl10:glColorMask(red, green, blue, alpha)
end


function JOGL10:glColorPointer(size, type, stride, pointer)
        self.gl10:glColorPointer(size, type, stride, pointer)
end


function JOGL10:glCompressedTexImage2D(target, level, internalformat, width, height, border, imageSize, data)
        self.gl10:glCompressedTexImage2D(target, level, internalformat, width, height, border, imageSize, data)
end


function JOGL10:glCompressedTexSubImage2D(target, level, xoffset, yoffset, width, height, format, imageSize, data)
        self.gl10:glCompressedTexSubImage2D(target, level, xoffset, yoffset, width, height, format, imageSize, data)
end


function JOGL10:glCopyTexImage2D(target, level, internalformat, x, y, width, height, border)
        self.gl10:glCopyTexImage2D(target, level, internalformat, x, y, width, height, border)
end


function JOGL10:glCopyTexSubImage2D(target, level, xoffset, yoffset, x, y, width, height)
        self.gl10:glCopyTexSubImage2D(target, level, xoffset, yoffset, x, y, width, height)
end


function JOGL10:glCullFace(mode)
        self.gl10:glCullFace(mode)
end


function JOGL10:glDeleteTextures_j3(n, textures, offset)
        self.gl10:glDeleteTextures(n, textures, offset)
end


function JOGL10:glDeleteTextures_j2(n, textures)
        self.gl10:glDeleteTextures(n, textures)
end
function JOGL10:glDeleteTextures(...)
    local count = select("#", ...)
    if count == 3 then return self:glDeleteTextures_j3(...) end
    if count == 2 then return self:glDeleteTextures_j2(...) end
    error("No method glDeleteTextures takes " .. count .. " arguments")
end
JOGL10.glDeleteTextures__jdispatcher = JOGL10.glDeleteTextures


function JOGL10:glDepthFunc(func)
        self.gl10:glDepthFunc(func)
end


function JOGL10:glDepthMask(flag)
        self.gl10:glDepthMask(flag)
end


function JOGL10:glDepthRangef(zNear, zFar)
        self.gl10:glDepthRangef(zNear, zFar)
end


function JOGL10:glDisable(cap)
        self.gl10:glDisable(cap)
end


function JOGL10:glDisableClientState(array)
        self.gl10:glDisableClientState(array)
end


function JOGL10:glDrawArrays(mode, first, count)
        self.gl10:glDrawArrays(mode, first, count)
end


function JOGL10:glDrawElements(mode, count, type, indices)
        self.gl10:glDrawElements(mode, count, type, indices)
end


function JOGL10:glEnable(cap)
        self.gl10:glEnable(cap)
end


function JOGL10:glEnableClientState(array)
        self.gl10:glEnableClientState(array)
end


function JOGL10:glFinish()
        self.gl10:glFinish()
end


function JOGL10:glFlush()
        self.gl10:glFlush()
end


function JOGL10:glFogf(pname, param)
        self.gl10:glFogf(pname, param)
end


function JOGL10:glFogfv_j3(pname, params, offset)
        self.gl10:glFogfv(pname, params, offset)
end


function JOGL10:glFogfv_j2(pname, params)
        self.gl10:glFogfv(pname, params)
end
function JOGL10:glFogfv(...)
    local count = select("#", ...)
    if count == 3 then return self:glFogfv_j3(...) end
    if count == 2 then return self:glFogfv_j2(...) end
    error("No method glFogfv takes " .. count .. " arguments")
end
JOGL10.glFogfv__jdispatcher = JOGL10.glFogfv


function JOGL10:glFrontFace(mode)
        self.gl10:glFrontFace(mode)
end


function JOGL10:glFrustumf(left, right, bottom, top, zNear, zFar)
        self.gl10:glFrustumf(left, right, bottom, top, zNear, zFar)
end


function JOGL10:glGenTextures_j3(n, textures, offset)
        self.gl10:glGenTextures(n, textures, offset)
end


function JOGL10:glGenTextures_j2(n, textures)
        self.gl10:glGenTextures(n, textures)
end
function JOGL10:glGenTextures(...)
    local count = select("#", ...)
    if count == 3 then return self:glGenTextures_j3(...) end
    if count == 2 then return self:glGenTextures_j2(...) end
    error("No method glGenTextures takes " .. count .. " arguments")
end
JOGL10.glGenTextures__jdispatcher = JOGL10.glGenTextures


function JOGL10:glGetError()
        return self.gl10:glGetError()
end


function JOGL10:glGetIntegerv_j3(pname, params, offset)
        self.gl10:glGetIntegerv(pname, params, offset)
end


function JOGL10:glGetIntegerv_j2(pname, params)
        self.gl10:glGetIntegerv(pname, params)
end
function JOGL10:glGetIntegerv(...)
    local count = select("#", ...)
    if count == 3 then return self:glGetIntegerv_j3(...) end
    if count == 2 then return self:glGetIntegerv_j2(...) end
    error("No method glGetIntegerv takes " .. count .. " arguments")
end
JOGL10.glGetIntegerv__jdispatcher = JOGL10.glGetIntegerv


function JOGL10:glGetString(name)
        return self.gl10:glGetString(name)
end


function JOGL10:glHint(target, mode)
        self.gl10:glHint(target, mode)
end


function JOGL10:glLightModelf(pname, param)
        self.gl10:glLightModelf(pname, param)
end


function JOGL10:glLightModelfv_j3(pname, params, offset)
        self.gl10:glLightModelfv(pname, params, offset)
end


function JOGL10:glLightModelfv_j2(pname, params)
        self.gl10:glLightModelfv(pname, params)
end
function JOGL10:glLightModelfv(...)
    local count = select("#", ...)
    if count == 3 then return self:glLightModelfv_j3(...) end
    if count == 2 then return self:glLightModelfv_j2(...) end
    error("No method glLightModelfv takes " .. count .. " arguments")
end
JOGL10.glLightModelfv__jdispatcher = JOGL10.glLightModelfv


function JOGL10:glLightf(light, pname, param)
        self.gl10:glLightf(light, pname, param)
end


function JOGL10:glLightfv_j4(light, pname, params, offset)
        self.gl10:glLightfv(light, pname, params, offset)
end


function JOGL10:glLightfv_j3(light, pname, params)
        self.gl10:glLightfv(light, pname, params)
end
function JOGL10:glLightfv(...)
    local count = select("#", ...)
    if count == 4 then return self:glLightfv_j4(...) end
    if count == 3 then return self:glLightfv_j3(...) end
    error("No method glLightfv takes " .. count .. " arguments")
end
JOGL10.glLightfv__jdispatcher = JOGL10.glLightfv


function JOGL10:glLineWidth(width)
        self.gl10:glLineWidth(width)
end


function JOGL10:glLoadIdentity()
        self.gl10:glLoadIdentity()
end


function JOGL10:glLoadMatrixf_j2(m, offset)
        self.gl10:glLoadMatrixf(m, offset)
end


function JOGL10:glLoadMatrixf_j1(m)
        self.gl10:glLoadMatrixf(m)
end
function JOGL10:glLoadMatrixf(...)
    local count = select("#", ...)
    if count == 2 then return self:glLoadMatrixf_j2(...) end
    if count == 1 then return self:glLoadMatrixf_j1(...) end
    error("No method glLoadMatrixf takes " .. count .. " arguments")
end
JOGL10.glLoadMatrixf__jdispatcher = JOGL10.glLoadMatrixf


function JOGL10:glLogicOp(opcode)
        self.gl10:glLogicOp(opcode)
end


function JOGL10:glMaterialf(face, pname, param)
        self.gl10:glMaterialf(face, pname, param)
end


function JOGL10:glMaterialfv_j4(face, pname, params, offset)
        self.gl10:glMaterialfv(face, pname, params, offset)
end


function JOGL10:glMaterialfv_j3(face, pname, params)
        self.gl10:glMaterialfv(face, pname, params)
end
function JOGL10:glMaterialfv(...)
    local count = select("#", ...)
    if count == 4 then return self:glMaterialfv_j4(...) end
    if count == 3 then return self:glMaterialfv_j3(...) end
    error("No method glMaterialfv takes " .. count .. " arguments")
end
JOGL10.glMaterialfv__jdispatcher = JOGL10.glMaterialfv


function JOGL10:glMatrixMode(mode)
        self.gl10:glMatrixMode(mode)
end


function JOGL10:glMultMatrixf_j2(m, offset)
        self.gl10:glMultMatrixf(m, offset)
end


function JOGL10:glMultMatrixf_j1(m)
        self.gl10:glMultMatrixf(m)
end
function JOGL10:glMultMatrixf(...)
    local count = select("#", ...)
    if count == 2 then return self:glMultMatrixf_j2(...) end
    if count == 1 then return self:glMultMatrixf_j1(...) end
    error("No method glMultMatrixf takes " .. count .. " arguments")
end
JOGL10.glMultMatrixf__jdispatcher = JOGL10.glMultMatrixf


function JOGL10:glMultiTexCoord4f(target, s, t, r, q)
        self.gl10:glMultiTexCoord4f(target, s, t, r, q)
end


function JOGL10:glNormal3f(nx, ny, nz)
        self.gl10:glNormal3f(nx, ny, nz)
end


function JOGL10:glNormalPointer(type, stride, pointer)
        self.gl10:glNormalPointer(type, stride, pointer)
end


function JOGL10:glOrthof(left, right, bottom, top, zNear, zFar)
        self.gl10:glOrthof(left, right, bottom, top, zNear, zFar)
end


function JOGL10:glPixelStorei(pname, param)
        self.gl10:glPixelStorei(pname, param)
end


function JOGL10:glPointSize(size)
        self.gl10:glPointSize(size)
end


function JOGL10:glPolygonOffset(factor, units)
        self.gl10:glPolygonOffset(factor, units)
end


function JOGL10:glPopMatrix()
        self.gl10:glPopMatrix()
end


function JOGL10:glPushMatrix()
        self.gl10:glPushMatrix()
end


function JOGL10:glReadPixels(x, y, width, height, format, type, pixels)
        self.gl10:glReadPixels(x, y, width, height, format, type, pixels)
end


function JOGL10:glRotatef(angle, x, y, z)
        self.gl10:glRotatef(angle, x, y, z)
end


function JOGL10:glRotatex(angle, x, y, z)
        self.gl10:glRotatef(angle, x, y, z)
end


function JOGL10:glSampleCoverage(value, invert)
        self.gl10:glSampleCoverage(value, invert)
end


function JOGL10:glScalef(x, y, z)
        self.gl10:glScalef(x, y, z)
end


function JOGL10:glScalex(x, y, z)
        self.gl10:glScalef(x, y, z)
end


function JOGL10:glScissor(x, y, width, height)
        self.gl10:glScissor(x, y, width, height)
end


function JOGL10:glShadeModel(mode)
        self.gl10:glShadeModel(mode)
end


function JOGL10:glStencilFunc(func, ref, mask)
        self.gl10:glStencilFunc(func, ref, mask)
end


function JOGL10:glStencilMask(mask)
        self.gl10:glStencilMask(mask)
end


function JOGL10:glStencilOp(fail, zfail, zpass)
        self.gl10:glStencilOp(fail, zfail, zpass)
end


function JOGL10:glTexCoordPointer(size, type, stride, pointer)
        self.gl10:glTexCoordPointer(size, type, stride, pointer)
end


function JOGL10:glTexEnvf(target, pname, param)
        self.gl10:glTexEnvf(target, pname, param)
end


function JOGL10:glTexEnvfv_j4(target, pname, params, offset)
        self.gl10:glTexEnvfv(target, pname, params, offset)
end


function JOGL10:glTexEnvfv_j3(target, pname, params)
        self.gl10:glTexEnvfv(target, pname, params)
end
function JOGL10:glTexEnvfv(...)
    local count = select("#", ...)
    if count == 4 then return self:glTexEnvfv_j4(...) end
    if count == 3 then return self:glTexEnvfv_j3(...) end
    error("No method glTexEnvfv takes " .. count .. " arguments")
end
JOGL10.glTexEnvfv__jdispatcher = JOGL10.glTexEnvfv


function JOGL10:glTexImage2D(target, level, internalformat, width, height, border, format, type, pixels)
        self.gl10:glTexImage2D(target, level, internalformat, width, height, border, format, type, pixels)
end


function JOGL10:glTexParameterf(target, pname, param)
        self.gl10:glTexParameterf(target, pname, param)
end


function JOGL10:glTexParameteri(target, pname, param)
        self.gl10:glTexParameteri(target, pname, param)
end


function JOGL10:glTexSubImage2D(target, level, xoffset, yoffset, width, height, format, type, pixels)
        self.gl10:glTexSubImage2D(target, level, xoffset, yoffset, width, height, format, type, pixels)
end


function JOGL10:glTranslatef(x, y, z)
        self.gl10:glTranslatef(x, y, z)
end


function JOGL10:glVertexPointer(size, type, stride, pointer)
        self.gl10:glVertexPointer(size, type, stride, pointer)
end


function JOGL10:glViewport(x, y, width, height)
        self.gl10:glViewport(x, y, width, height)
end


function JOGL10:glBegin(i)
        self.gl10:glBegin(i)
end


function JOGL10:glEnd()
        self.gl10:glEnd()
end


function JOGL10:glVertex3f(f, f2, f3)
        self.gl10:glVertex3f(f, f2, f3)
end


function JOGL10:glPolygonMode(i, i1)
        self.gl10:glPolygonMode(i, i1)
end

return JOGL10

