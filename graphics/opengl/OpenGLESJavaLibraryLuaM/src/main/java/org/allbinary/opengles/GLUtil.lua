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

local GLUtil = {}
package.loaded["org.allbinary.opengles.GLUtil"] = GLUtil

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
-- local ByteBuffer = require("java.nio.ByteBuffer")
-- local ByteOrder = require("java.nio.ByteOrder")
-- local FloatBuffer = require("java.nio.FloatBuffer")

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

-- class table GLUtil is declared before the requires
GLUtil.__index = GLUtil
GLUtil.className = "GLUtil"
GLUtil.javaClassName = "org.allbinary.opengles.GLUtil"

function GLUtil:_init_fields()
    self.BYTES_PER_FLOAT = 4
    self.NULL_FLOAT_BUFFER = ByteBuffer.allocateDirect(0):asFloatBuffer()
end

function GLUtil._jinit(self)
    GLUtil._init_fields(self)
    return self
end

function GLUtil.new()
    return GLUtil._jinit(setmetatable({}, GLUtil))
end


function GLUtil.getInstance()
        return GLUtil.instance_f
end


function GLUtil:makeFloatBuffer3(p_a, p_b, p_c)
        local b = ByteBuffer.allocateDirect(3 * self.BYTES_PER_FLOAT)
        b:order(ByteOrder.nativeOrder())
        local buffer = b:asFloatBuffer()
        buffer:put(p_a)
        buffer:put(p_b)
        buffer:put(p_c)
        self:position(buffer, 0)
        return buffer
end


function GLUtil:makeFloatBuffer4(p_a, p_b, p_c, p_d)
        local b = ByteBuffer.allocateDirect(4 * self.BYTES_PER_FLOAT)
        b:order(ByteOrder.nativeOrder())
        local buffer = b:asFloatBuffer()
        buffer:put(p_a)
        buffer:put(p_b)
        buffer:put(p_c)
        buffer:put(p_d)
        self:position(buffer, 0)
        return buffer
end


function GLUtil:makeFloatBuffer(byteBuffer)
        local b = ByteBuffer.allocateDirect(byteBuffer:limit() * self.BYTES_PER_FLOAT)
        b:order(ByteOrder.nativeOrder())
        local buffer = b:asFloatBuffer()
        local unsigned = 0
        local v = 0.0
        while byteBuffer:hasRemaining() do
            unsigned = (java_int(byteBuffer:get())) & 0xFF
            v = ((unsigned + 0.0)) / 255.0
            buffer:put(v)
        end
        self:position(buffer, 0)
        return buffer
end


function GLUtil:position(buffer, newPosition)
        return buffer:position(newPosition)
end


function GLUtil:rotateUVs(uvs, angleDegrees, pivotU, pivotV)
        local angleRad = math.rad(angleDegrees)
        local cosA = math.cos(angleRad)
        local sinA = math.sin(angleRad)
        for i = 0, (uvs.n or #uvs) - 1, 2 do
            local u = uvs[i + 1]
            local v = uvs[i + 1 + 1]
            local du = u - pivotU
            local dv = v - pivotV
            local ru = (du * cosA - dv * sinA) + pivotU
            local rv = (du * sinA + dv * cosA) + pivotV
            uvs[i + 1] = ru
            uvs[i + 1 + 1] = rv
        end
end

GLUtil.instance_f = GLUtil.new()

return GLUtil

