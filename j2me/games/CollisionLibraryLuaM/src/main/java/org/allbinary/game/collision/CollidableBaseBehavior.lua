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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local CollidableCompositeLayer = require("org.allbinary.game.layer.CollidableCompositeLayer")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local CollidableInterface = require("org.allbinary.game.collision.CollidableInterface")

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
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CollidableBaseBehavior = {}
CollidableBaseBehavior.__index = CollidableBaseBehavior
CollidableBaseBehavior.className = "CollidableBaseBehavior"

function CollidableBaseBehavior:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.layerCollisionUtil = LayerCollisionUtil.getInstance()
    self.collidable = true
end


function CollidableBaseBehavior.new(collidable)
    local self = setmetatable({}, CollidableBaseBehavior)
    self:_init_fields()
        self.collidable = collidable
    return self
end


function CollidableBaseBehavior:update()
end


function CollidableBaseBehavior:getName()
        return getmetatable(self).className
end


function CollidableBaseBehavior:setCollidable(collidable)
        self.collidable = collidable
end


function CollidableBaseBehavior:isCollidable(ownerLayer)
        return self.collidable
end


-- throws Exception
function CollidableBaseBehavior:collide(ownerLayer, allbinaryCollidableLayer)
        error(java_exception("Exception", tostring(StringMaker.new():append(self.commonStrings.NOT_IMPLEMENTED):append(CommonLabels.getInstance().COLON_SEP):append(getmetatable(self).className))), 0)
end


function CollidableBaseBehavior:isCollision(ownerLayer, collisionLayer)
        return self.layerCollisionUtil:isCollision(ownerLayer, collisionLayer)
end


function CollidableBaseBehavior:isCollisionInterface(ownerLayer, collidableInterfaceCompositeInterface)
        return self.layerCollisionUtil:isCollision(ownerLayer, collidableInterfaceCompositeInterface)
end


-- throws Exception
function CollidableBaseBehavior:collideInterface(ownerLayer, collidableInterfaceCompositeInterface)
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


function CollidableBaseBehavior:paint(ownerLayer, graphics)
end


function CollidableBaseBehavior:getCollisionTypeWith(layerInterface)
        return CollisionTypeFactory.getInstance().NONE
end

return CollidableBaseBehavior

