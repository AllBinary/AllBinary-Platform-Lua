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
-- package org.allbinary.game.collision

local LayerCollisionUtil = {}
package.loaded["org.allbinary.game.collision.LayerCollisionUtil"] = LayerCollisionUtil

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

local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local GameFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.GameFeatureFactory")
local OpenGLFeatureUtil = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureUtil")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local Collision2DProcessor = java_lazy("org.allbinary.game.collision.Collision2DProcessor")
local CollisionProcessor = java_lazy("org.allbinary.game.collision.CollisionProcessor")
local CollisionThreedProcessor = java_lazy("org.allbinary.game.collision.CollisionThreedProcessor")

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

-- class table LayerCollisionUtil is declared before the requires
LayerCollisionUtil.__index = LayerCollisionUtil
LayerCollisionUtil.className = "LayerCollisionUtil"
LayerCollisionUtil.javaClassName = "org.allbinary.game.collision.LayerCollisionUtil"

function LayerCollisionUtil:_init_fields()
    if self.collisionProcessor == nil then self.collisionProcessor = nil end
end


function LayerCollisionUtil.getInstance()
        return LayerCollisionUtil.instance_f
end


function LayerCollisionUtil._jinit(self)
    LayerCollisionUtil._init_fields(self)
        local features = Features.getInstance()
        local gameFeatureFactory = GameFeatureFactory.getInstance()
        if OpenGLFeatureUtil.getInstance():isAnyThreed() and not (features:isFeature(gameFeatureFactory.COLLISIONS_FORCED_TWO_DIMENSIONAL)) then
            self.collisionProcessor = CollisionThreedProcessor.new()
        else
            self.collisionProcessor = Collision2DProcessor.new()
        end
    return self
end

function LayerCollisionUtil.new(...)
    local self = setmetatable({}, LayerCollisionUtil)
    LayerCollisionUtil._jinit(self, ...)
    return self
end


function LayerCollisionUtil:isCollision(myLayer, myLayer2)
        return self.collisionProcessor:isCollision(myLayer, myLayer2)
end

LayerCollisionUtil.instance_f = LayerCollisionUtil.new()

return LayerCollisionUtil

