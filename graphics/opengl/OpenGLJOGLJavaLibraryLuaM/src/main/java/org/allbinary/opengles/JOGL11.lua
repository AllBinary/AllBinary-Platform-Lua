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

local GL = require("com.jogamp.opengl.GL")
local GL2 = require("com.jogamp.opengl.GL2")
local JOGL10 = require("org.allbinary.opengles.JOGL10")
local GL11 = require("org.allbinary.opengles.GL11")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--JOGLEToKhronosGL11
local JOGL11 = {}
JOGL11.__index = JOGL11
JOGL11.className = "JOGL11"
setmetatable(JOGL11, {__index = JOGL10})

function JOGL11:_init_fields()
    self.gl11 = nil
end

function JOGL11.new(...)
    local count = select("#", ...)
    if count == 1 then return JOGL11._new1(...)
    elseif count == 2 then return JOGL11._new2(...)
    end
end


function JOGL11._new1(gl)
    local self = JOGL11._new2(gl, gl)
        -- this(...) made self above
    return self
end


function JOGL11._new2(gl, gl2)
    local self = setmetatable(JOGL10.new(gl, gl2), JOGL11)
    self:_init_fields()
        -- super(...) made self above
        self.gl11 = self:getJOGLGL()
    return self
end


function JOGL11:glBindBuffer(target, buffer)
        self.gl11:glBindBuffer(target, buffer)
end


function JOGL11:glBufferData(target, size, data, usage)
        self.gl11:glBufferData(target, size, data, usage)
end


function JOGL11:glBufferSubData(target, offset, size, data)
        self.gl11:glBufferSubData(target, offset, size, data)
end


function JOGL11:glClipPlanef(plane, equation, offset)
        self.gl11:glClipPlanef(plane, equation, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL11:glClipPlanef(plane, equation)
        self.gl11:glClipPlanef(plane, equation)
end


function JOGL11:glColor4ub(red, green, blue, alpha)
        self.gl11:glColor4ub(red, green, blue, alpha)
end


function JOGL11:glColorPointer(size, type, stride, offset)
        self.gl11:glColorPointer(size, type, stride, offset)
end


function JOGL11:glDeleteBuffers(n, buffers, offset)
        self.gl11:glDeleteBuffers(n, buffers, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL11:glDeleteBuffers(n, buffers)
        self.gl11:glDeleteBuffers(n, buffers)
end


function JOGL11:glDrawElements(mode, count, type, offset)
        self.gl11:glDrawElements(mode, count, type, offset)
end


function JOGL11:glGenBuffers(n, buffers, offset)
        self.gl11:glGenBuffers(n, buffers, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL11:glGenBuffers(n, buffers)
        self.gl11:glGenBuffers(n, buffers)
end


function JOGL11:glGetBufferParameteriv(target, pname, params, offset)
        self.gl11:glGetBufferParameteriv(target, pname, params, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL11:glGetBufferParameteriv(target, pname, params)
        self.gl11:glGetBufferParameteriv(target, pname, params)
end


function JOGL11:glGetClipPlanef(pname, eqn, offset)
        self.gl11:glGetClipPlanef(pname, eqn, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL11:glGetClipPlanef(pname, eqn)
        self.gl11:glGetClipPlanef(pname, eqn)
end


function JOGL11:glGetFloatv(pname, params, offset)
        self.gl11:glGetFloatv(pname, params, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL11:glGetFloatv(pname, params)
        self.gl11:glGetFloatv(pname, params)
end


function JOGL11:glGetLightfv(light, pname, params, offset)
        self.gl11:glGetLightfv(light, pname, params, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL11:glGetLightfv(light, pname, params)
        self.gl11:glGetLightfv(light, pname, params)
end


function JOGL11:glGetMaterialfv(face, pname, params, offset)
        self.gl11:glGetMaterialfv(face, pname, params, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL11:glGetMaterialfv(face, pname, params)
        self.gl11:glGetMaterialfv(face, pname, params)
end


function JOGL11:glGetTexEnviv(env, pname, params, offset)
        self.gl11:glGetTexEnviv(env, pname, params, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL11:glGetTexEnviv(env, pname, params)
        self.gl11:glGetTexEnviv(env, pname, params)
end


function JOGL11:glGetTexParameterfv(target, pname, params, offset)
        self.gl11:glGetTexParameterfv(target, pname, params, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL11:glGetTexParameterfv(target, pname, params)
        self.gl11:glGetTexParameterfv(target, pname, params)
end


function JOGL11:glGetTexParameteriv(target, pname, params, offset)
        self.gl11:glGetTexParameteriv(target, pname, params, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL11:glGetTexParameteriv(target, pname, params)
        self.gl11:glGetTexParameteriv(target, pname, params)
end


function JOGL11:glIsBuffer(buffer)
        return self.gl11:glIsBuffer(buffer)
end


function JOGL11:glIsEnabled(cap)
        return self.gl11:glIsEnabled(cap)
end


function JOGL11:glIsTexture(texture)
        return self.gl11:glIsTexture(texture)
end


function JOGL11:glNormalPointer(type, stride, offset)
        self.gl11:glNormalPointer(type, stride, offset)
end


function JOGL11:glPointParameterf(pname, param)
        self.gl11:glPointParameterf(pname, param)
end


function JOGL11:glPointParameterfv(pname, params, offset)
        self.gl11:glPointParameterfv(pname, params, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL11:glPointParameterfv(pname, params)
        self.gl11:glPointParameterfv(pname, params)
end


function JOGL11:glTexCoordPointer(size, type, stride, offset)
        self.gl11:glTexCoordPointer(size, type, stride, offset)
end


function JOGL11:glTexEnvi(target, pname, param)
        self.gl11:glTexEnvi(target, pname, param)
end


function JOGL11:glTexEnviv(target, pname, params, offset)
        self.gl11:glTexEnviv(target, pname, params, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL11:glTexEnviv(target, pname, params)
        self.gl11:glTexEnviv(target, pname, params)
end


function JOGL11:glTexParameterfv(target, pname, params, offset)
        self.gl11:glTexParameterfv(target, pname, params, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL11:glTexParameterfv(target, pname, params)
        self.gl11:glTexParameterfv(target, pname, params)
end


function JOGL11:glTexParameteri(target, pname, param)
        self.gl11:glTexParameteri(target, pname, param)
end


function JOGL11:glTexParameteriv(target, pname, params, offset)
        self.gl11:glTexParameteriv(target, pname, params, offset)
end


-- Java overloaded method: Lua keeps the last definition
function JOGL11:glTexParameteriv(target, pname, params)
        self.gl11:glTexParameteriv(target, pname, params)
end


function JOGL11:glTexParameterxv(target, pname, params, offset)
        self.gl11:glTexParameteriv(target, pname, params, offset)
end


function JOGL11:glVertexPointer(size, type, stride, offset)
        self.gl11:glVertexPointer(size, type, stride, offset)
end

return JOGL11

