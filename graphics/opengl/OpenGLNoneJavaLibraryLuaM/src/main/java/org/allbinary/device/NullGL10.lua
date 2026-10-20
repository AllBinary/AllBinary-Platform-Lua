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

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
-- local Buffer = require("java.nio.Buffer")
-- local FloatBuffer = require("java.nio.FloatBuffer")
-- local IntBuffer = require("java.nio.IntBuffer")
local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullGL10 = {}
NullGL10.__index = NullGL10
NullGL10.className = "NullGL10"

function NullGL10.new()
    local self = setmetatable({}, NullGL10)
    return self
end


function NullGL10:glActiveTexture(texture)
        return
end


function NullGL10:glAlphaFunc(func, ref)
        return
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


function NullGL10:glClearDepthf(depth)
        return
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


function NullGL10:glDeleteTextures(n, textures, offset)
        return
end


-- Java overloaded method: Lua keeps the last definition
function NullGL10:glDeleteTextures(n, textures)
        return
end


function NullGL10:glDepthFunc(func)
        return
end


function NullGL10:glDepthMask(flag)
        return
end


function NullGL10:glDepthRangef(zNear, zFar)
        return
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


function NullGL10:glFogfv(pname, params, offset)
        return
end


-- Java overloaded method: Lua keeps the last definition
function NullGL10:glFogfv(pname, params)
        return
end


function NullGL10:glFrontFace(mode)
        return
end


function NullGL10:glFrustumf(left, right, bottom, top, zNear, zFar)
        return
end


function NullGL10:glGenTextures(n, textures, offset)
        return
end


-- Java overloaded method: Lua keeps the last definition
function NullGL10:glGenTextures(n, textures)
        return
end


function NullGL10:glGetError()
        return 0
end


function NullGL10:glGetIntegerv(pname, params, offset)
        return
end


-- Java overloaded method: Lua keeps the last definition
function NullGL10:glGetIntegerv(pname, params)
        return
end


function NullGL10:glGetString(name)
        return StringUtil.getInstance().EMPTY_STRING
end


function NullGL10:glHint(target, mode)
        return
end


function NullGL10:glLightModelf(pname, param)
        return
end


function NullGL10:glLightModelfv(pname, params, offset)
        return
end


-- Java overloaded method: Lua keeps the last definition
function NullGL10:glLightModelfv(pname, params)
        return
end


function NullGL10:glLightf(light, pname, param)
        return
end


function NullGL10:glLightfv(light, pname, params, offset)
        return
end


-- Java overloaded method: Lua keeps the last definition
function NullGL10:glLightfv(light, pname, params)
        return
end


function NullGL10:glLineWidth(width)
        return
end


function NullGL10:glLoadIdentity()
        return
end


function NullGL10:glLoadMatrixf(m, offset)
        return
end


-- Java overloaded method: Lua keeps the last definition
function NullGL10:glLoadMatrixf(m)
        return
end


function NullGL10:glLogicOp(opcode)
        return
end


function NullGL10:glMaterialf(face, pname, param)
        return
end


function NullGL10:glMaterialfv(face, pname, params, offset)
        return
end


-- Java overloaded method: Lua keeps the last definition
function NullGL10:glMaterialfv(face, pname, params)
        return
end


function NullGL10:glMatrixMode(mode)
        return
end


function NullGL10:glMultMatrixf(m, offset)
        return
end


-- Java overloaded method: Lua keeps the last definition
function NullGL10:glMultMatrixf(m)
        return
end


function NullGL10:glMultiTexCoord4f(target, s, t, r, q)
        return
end


function NullGL10:glNormal3f(nx, ny, nz)
        return
end


function NullGL10:glNormalPointer(type, stride, pointer)
        return
end


function NullGL10:glOrthof(left, right, bottom, top, zNear, zFar)
        return
end


function NullGL10:glPixelStorei(pname, param)
        return
end


function NullGL10:glPointSize(size)
        return
end


function NullGL10:glPolygonOffset(factor, units)
        return
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


function NullGL10:glTexEnvfv(target, pname, params, offset)
        return
end


-- Java overloaded method: Lua keeps the last definition
function NullGL10:glTexEnvfv(target, pname, params)
        return
end


function NullGL10:glTexImage2D(target, level, internalformat, width, height, border, format, type, pixels)
        return
end


function NullGL10:glTexParameterf(target, pname, param)
        return
end


function NullGL10:glTexParameteri(target, pname, param)
        return
end


function NullGL10:glTexSubImage2D(target, level, xoffset, yoffset, width, height, format, type, pixels)
        return
end


function NullGL10:glTranslatef(x, y, z)
        return
end


function NullGL10:glVertexPointer(size, type, stride, pointer)
        return
end


function NullGL10:glViewport(x, y, width, height)
        return
end


function NullGL10:glBegin(i)
        return
end


function NullGL10:glEnd()
        return
end


function NullGL10:glVertex3f(f, f2, f3)
        return
end


function NullGL10:glPolygonMode(i, i1)
        return
end

NullGL10.NULL_GL10 = NullGL10.new()

return NullGL10

