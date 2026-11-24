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
-- package org.allbinary.game.physics.acceleration

local GravityUtil = {}
package.loaded["org.allbinary.game.physics.acceleration.GravityUtil"] = GravityUtil

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

local BasicVelocityProperties = java_lazy("org.allbinary.game.physics.velocity.BasicVelocityProperties")

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

-- class table GravityUtil is declared before the requires
GravityUtil.__index = GravityUtil
GravityUtil.className = "GravityUtil"
GravityUtil.javaClassName = "org.allbinary.game.physics.acceleration.GravityUtil"

function GravityUtil:_init_fields()
    self.GAME_GRAVITY_VELOCITY = 1800
    self.MAX_GAME_VELOCITY = 18000
end

function GravityUtil._jinit(self)
    GravityUtil._init_fields(self)
    return self
end

function GravityUtil.new()
    return GravityUtil._jinit(setmetatable({}, GravityUtil))
end


function GravityUtil.getInstance()
        return GravityUtil.instance_f
end


function GravityUtil:process(velocityProperties, customGravity)
        velocityProperties:getVelocityYBasicDecimalP():addint(customGravity)
end

GravityUtil.instance_f = GravityUtil.new()

return GravityUtil

