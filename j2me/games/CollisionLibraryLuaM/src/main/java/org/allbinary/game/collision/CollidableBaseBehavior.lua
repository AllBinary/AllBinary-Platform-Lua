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

local CollidableBaseBehavior = {}
package.loaded["org.allbinary.game.collision.CollidableBaseBehavior"] = CollidableBaseBehavior

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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local CollidableCompositeLayer = java_lazy("org.allbinary.game.layer.CollidableCompositeLayer")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local CollidableInterface = require("org.allbinary.game.collision.CollidableInterface")
local CollidableInterfaceCompositeInterface = java_lazy("org.allbinary.game.collision.CollidableInterfaceCompositeInterface")
local CollisionType = java_lazy("org.allbinary.game.collision.CollisionType")
local CollisionTypeFactory = java_lazy("org.allbinary.game.collision.CollisionTypeFactory")
local LayerCollisionUtil = java_lazy("org.allbinary.game.collision.LayerCollisionUtil")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

-- class table CollidableBaseBehavior is declared before the requires
CollidableBaseBehavior.__index = CollidableBaseBehavior
CollidableBaseBehavior.className = "CollidableBaseBehavior"
CollidableBaseBehavior.javaClassName = "org.allbinary.game.collision.CollidableBaseBehavior"
CollidableBaseBehavior.java_implements = " CollidableInterface "
CollidableBaseBehavior.java_interfaces = function() return {CollidableInterface} end

function CollidableBaseBehavior:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.layerCollisionUtil = LayerCollisionUtil.getInstance()
    self.collidable = true
end


function CollidableBaseBehavior._jinit(self, collidable)
    CollidableBaseBehavior._init_fields(self)
        self.collidable = collidable
    return self
end

function CollidableBaseBehavior.new(...)
    local self = setmetatable({}, CollidableBaseBehavior)
    CollidableBaseBehavior._jinit(self, ...)
    return self
end


function CollidableBaseBehavior:update()
end


function CollidableBaseBehavior:getName()
        return (getmetatable(self).javaClassName or getmetatable(self).className)
end


function CollidableBaseBehavior:setCollidable(collidable)
        self.collidable = collidable
end


function CollidableBaseBehavior:isCollidable(ownerLayer)
        return self.collidable
end


-- throws Exception
function CollidableBaseBehavior:collide(ownerLayer, allbinaryCollidableLayer)
        error(require("java.lang.Exception").new(tostring(StringMaker.new():append(self.commonStrings.NOT_IMPLEMENTED):append(CommonLabels.getInstance().COLON_SEP):append((getmetatable(self).javaClassName or getmetatable(self).className)))), 0)
end


function CollidableBaseBehavior:isCollision(ownerLayer, collisionLayer)
        return self.layerCollisionUtil:isCollision(ownerLayer, collisionLayer)
end


function CollidableBaseBehavior:isCollisionInterface(ownerLayer, collidableInterfaceCompositeInterface)
        return self.layerCollisionUtil:isCollision(ownerLayer, collidableInterfaceCompositeInterface)
end


-- throws Exception
function CollidableBaseBehavior:collideInterface(ownerLayer, collidableInterfaceCompositeInterface)
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end


function CollidableBaseBehavior:paint(ownerLayer, graphics)
end


function CollidableBaseBehavior:getCollisionTypeWith(layerInterface)
        return CollisionTypeFactory.getInstance().NONE
end

return CollidableBaseBehavior

