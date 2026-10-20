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

local GLU = require("com.jogamp.opengl.glu.GLU")
local GL10 = require("org.allbinary.opengles.GL10")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--JOGLEToKhronosGL10
local JOGL10 = {}
JOGL10.__index = JOGL10
JOGL10.className = "JOGL10"

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
    self.gl10 = nil
    self.glu = nil
    self.GL_LINE = nil
    self.GL_QUAD_STRIP = nil
end


function JOGL10.new(gl, gl2)
    local self = setmetatable({}, JOGL10)
    self:_init_fields()
        self.gl10 = gl2
        self.glu = GLU.createGLU(self.gl10)
        self.GL_LINE = com.jogamp.opengl.GL2.GL_LINE
        self.GL_QUAD_STRIP = com.jogamp.opengl.GL2.GL_QUAD_STRIP
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


function JOGL10:glDeleteTextures(n, textures, offset)
        self.gl10:glDeleteTextures(n, textures, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL10:glDeleteTextures(n, textures)
        self.gl10:glDeleteTextures(n, textures)
end


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


function JOGL10:glFogfv(pname, params, offset)
        self.gl10:glFogfv(pname, params, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL10:glFogfv(pname, params)
        self.gl10:glFogfv(pname, params)
end


function JOGL10:glFrontFace(mode)
        self.gl10:glFrontFace(mode)
end


function JOGL10:glFrustumf(left, right, bottom, top, zNear, zFar)
        self.gl10:glFrustumf(left, right, bottom, top, zNear, zFar)
end


function JOGL10:glGenTextures(n, textures, offset)
        self.gl10:glGenTextures(n, textures, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL10:glGenTextures(n, textures)
        self.gl10:glGenTextures(n, textures)
end


function JOGL10:glGetError()
        return self.gl10:glGetError()
end


function JOGL10:glGetIntegerv(pname, params, offset)
        self.gl10:glGetIntegerv(pname, params, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL10:glGetIntegerv(pname, params)
        self.gl10:glGetIntegerv(pname, params)
end


function JOGL10:glGetString(name)
        return self.gl10:glGetString(name)
end


function JOGL10:glHint(target, mode)
        self.gl10:glHint(target, mode)
end


function JOGL10:glLightModelf(pname, param)
        self.gl10:glLightModelf(pname, param)
end


function JOGL10:glLightModelfv(pname, params, offset)
        self.gl10:glLightModelfv(pname, params, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL10:glLightModelfv(pname, params)
        self.gl10:glLightModelfv(pname, params)
end


function JOGL10:glLightf(light, pname, param)
        self.gl10:glLightf(light, pname, param)
end


function JOGL10:glLightfv(light, pname, params, offset)
        self.gl10:glLightfv(light, pname, params, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL10:glLightfv(light, pname, params)
        self.gl10:glLightfv(light, pname, params)
end


function JOGL10:glLineWidth(width)
        self.gl10:glLineWidth(width)
end


function JOGL10:glLoadIdentity()
        self.gl10:glLoadIdentity()
end


function JOGL10:glLoadMatrixf(m, offset)
        self.gl10:glLoadMatrixf(m, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL10:glLoadMatrixf(m)
        self.gl10:glLoadMatrixf(m)
end


function JOGL10:glLogicOp(opcode)
        self.gl10:glLogicOp(opcode)
end


function JOGL10:glMaterialf(face, pname, param)
        self.gl10:glMaterialf(face, pname, param)
end


function JOGL10:glMaterialfv(face, pname, params, offset)
        self.gl10:glMaterialfv(face, pname, params, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL10:glMaterialfv(face, pname, params)
        self.gl10:glMaterialfv(face, pname, params)
end


function JOGL10:glMatrixMode(mode)
        self.gl10:glMatrixMode(mode)
end


function JOGL10:glMultMatrixf(m, offset)
        self.gl10:glMultMatrixf(m, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL10:glMultMatrixf(m)
        self.gl10:glMultMatrixf(m)
end


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


function JOGL10:glTexEnvfv(target, pname, params, offset)
        self.gl10:glTexEnvfv(target, pname, params, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL10:glTexEnvfv(target, pname, params)
        self.gl10:glTexEnvfv(target, pname, params)
end


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

