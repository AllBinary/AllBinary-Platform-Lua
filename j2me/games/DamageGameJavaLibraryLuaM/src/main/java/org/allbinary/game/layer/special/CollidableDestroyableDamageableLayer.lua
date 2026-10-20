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
-- package org.allbinary.game.layer.special

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local CollidableNeverCollideBehaviorFactory = require("org.allbinary.game.collision.CollidableNeverCollideBehaviorFactory")
local DamageableInterface = require("org.allbinary.game.combat.damage.DamageableInterface")
local DestroyableInterface = require("org.allbinary.game.combat.destroy.DestroyableInterface")
local DestroyedEvent = require("org.allbinary.game.combat.destroy.event.DestroyedEvent")
local BasicGroupFactory = require("org.allbinary.game.identification.BasicGroupFactory")
local Group = require("org.allbinary.game.identification.Group")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local CollidableCompositeLayer = require("org.allbinary.game.layer.CollidableCompositeLayer")
local PickedUpLayerInterfaceFactoryInterface = require("org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface")
local PickupBehavior = require("org.allbinary.game.layer.pickup.PickupBehavior")
local PickupCompositeInterface = require("org.allbinary.game.layer.pickup.PickupCompositeInterface")
local PartInterface = require("org.allbinary.game.part.PartInterface")
local PartInterfaceUtil = require("org.allbinary.game.part.PartInterfaceUtil")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local RectangleFactory = require("org.allbinary.graphics.RectangleFactory")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local NullUtil = require("org.allbinary.logic.NullUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local PositionStrings = require("org.allbinary.math.PositionStrings")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local ViewPositionBase = require("org.allbinary.view.ViewPositionBase")
local SpecialGameInputInterface = require("org.allbinary.game.layer.special.SpecialGameInputInterface")

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

local CollidableDestroyableDamageableLayer = {}
CollidableDestroyableDamageableLayer.__index = CollidableDestroyableDamageableLayer
CollidableDestroyableDamageableLayer.className = "CollidableDestroyableDamageableLayer"
setmetatable(CollidableDestroyableDamageableLayer, {__index = CollidableCompositeLayer})

function CollidableDestroyableDamageableLayer:_init_fields()
    self.groupInterface = nil
    self.readyForExplosion = false
    self.initWidth = nil
    self.initHeight = nil
    self.initX = 0
    self.initY = 0
    self.initZ = 0
    self.partInterfaceArrayP = PartInterfaceUtil.getZeroArray()
    self.pickupBehavior = nil
    self.allBinaryGameLayerManagerP = AllBinaryGameLayerManager.getNullInstance()
    self.isDraggable = false
    self.isDragged = false
    self.isDropped = false
end


function CollidableDestroyableDamageableLayer.getNullInstance()
        if CollidableDestroyableDamageableLayer.NULL_COLLIDABLE_DESTROYABLE_DAMAGE_LAYER == NullUtil.getInstance().NULL_OBJECT then
            CollidableDestroyableDamageableLayer.NULL_COLLIDABLE_DESTROYABLE_DAMAGE_LAYER = CollidableDestroyableDamageableLayer.new(BasicGroupFactory.getInstance().NONE_ARRAY, StringUtil.getInstance().EMPTY_STRING, RectangleFactory.SINGLETON, ViewPositionBase.NULL_VIEW_POSITION)
        end
        return CollidableDestroyableDamageableLayer.NULL_COLLIDABLE_DESTROYABLE_DAMAGE_LAYER
end


function CollidableDestroyableDamageableLayer.new(groupInterface, name, layerInfo, viewPosition)
    local self = setmetatable(CollidableCompositeLayer.new(name, layerInfo, viewPosition, CollidableNeverCollideBehaviorFactory.getInstance()), CollidableDestroyableDamageableLayer)
    self:_init_fields()
        -- super(...) made self above
        self.initWidth = layerInfo:getWidth()
        self.initHeight = layerInfo:getHeight()
        self.groupInterface = groupInterface
        self.pickupBehavior = PickupBehavior.getNullInstance()
    return self
end


-- throws Exception
function CollidableDestroyableDamageableLayer:initPosition()
        self:setPosition(self.initX, self.initY, self.initZ)
end


-- throws Exception
function CollidableDestroyableDamageableLayer:initPositionXYZ(x, y, z)
        self.initX = x
        self.initY = y
        self.initZ = z
end


function CollidableDestroyableDamageableLayer:paint(graphics)
        CollidableCompositeLayer.paint(self, graphics)
end


-- throws Exception
function CollidableDestroyableDamageableLayer:damage(damage, damageType)
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


-- throws Exception
function CollidableDestroyableDamageableLayer:getDamage(damageType)
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


-- throws Exception
function CollidableDestroyableDamageableLayer:isDestroyed()
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


function CollidableDestroyableDamageableLayer:getGroupInterface()
        return self.groupInterface
end


function CollidableDestroyableDamageableLayer:setGroupInterface(teamInterface)
        self.groupInterface = teamInterface
end


-- throws Exception
function CollidableDestroyableDamageableLayer:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        self.allBinaryGameLayerManagerP = allBinaryGameLayerManager
        if self.allBinaryGameLayerManagerP == nil then
            error(java_exception("RuntimeException"), 0)
        end
end


function CollidableDestroyableDamageableLayer:isReadyForExplosion()
        return self.readyForExplosion
end


function CollidableDestroyableDamageableLayer:setReadyForExplosion(isReadyForExplosion)
        self.readyForExplosion = isReadyForExplosion
end


function CollidableDestroyableDamageableLayer:getInitWidth()
        return self.initWidth
end


function CollidableDestroyableDamageableLayer:getInitHeight()
        return self.initHeight
end


function CollidableDestroyableDamageableLayer:getInitX()
        return self.initX
end


function CollidableDestroyableDamageableLayer:getInitY()
        return self.initY
end


-- throws Exception
function CollidableDestroyableDamageableLayer:up()
end


-- throws Exception
function CollidableDestroyableDamageableLayer:down()
end


-- throws Exception
function CollidableDestroyableDamageableLayer:right()
end


-- throws Exception
function CollidableDestroyableDamageableLayer:left()
end


-- throws Exception
function CollidableDestroyableDamageableLayer:strafeLeft()
end


-- throws Exception
function CollidableDestroyableDamageableLayer:strafeRight()
end


-- throws Exception
function CollidableDestroyableDamageableLayer:fire(layerManager, gameKeyEvent)
end


-- throws Exception
function CollidableDestroyableDamageableLayer:special1(layerManager, gameKeyEvent)
end


-- throws Exception
function CollidableDestroyableDamageableLayer:special2(layerManager, gameKeyEvent)
end


-- throws Exception
function CollidableDestroyableDamageableLayer:special3(layerManager, gameKeyEvent)
end


-- throws Exception
function CollidableDestroyableDamageableLayer:special4(layerManager, gameKeyEvent)
end


-- throws Exception
function CollidableDestroyableDamageableLayer:special5(layerManager, gameKeyEvent)
end


-- throws Exception
function CollidableDestroyableDamageableLayer:upAnalog(yAnalogValue)
end


-- throws Exception
function CollidableDestroyableDamageableLayer:downAnalog(yAnalogValue)
end


-- throws Exception
function CollidableDestroyableDamageableLayer:rightAnalog(xAnalogValue)
end


-- throws Exception
function CollidableDestroyableDamageableLayer:leftAnalog(xAnalogValue)
end


-- throws Exception
function CollidableDestroyableDamageableLayer:rightTrigger(layerManager, gameKeyEvent, xAnalogValue)
end


-- throws Exception
function CollidableDestroyableDamageableLayer:leftTrigger(layerManager, gameKeyEvent, xAnalogValue)
end


function CollidableDestroyableDamageableLayer:onDestroyed(destroyedEvent)
end


function CollidableDestroyableDamageableLayer:getPickupBehavior()
        return self.pickupBehavior
end


function CollidableDestroyableDamageableLayer:setPickupBehavior(pickupBehavior)
        self.pickupBehavior = pickupBehavior
end


-- throws Exception
function CollidableDestroyableDamageableLayer:addPart(pickedUpLayerInterfaceFactoryInterface)
end


function CollidableDestroyableDamageableLayer:setPartInterfaceArray(partInterfaceArray)
        self.partInterfaceArrayP = partInterfaceArray
end


function CollidableDestroyableDamageableLayer:getPartInterfaceArray()
        return self.partInterfaceArrayP
end


function CollidableDestroyableDamageableLayer:toStringAppend(stringBuffer)
        local commonSeps = CommonSeps.getInstance()
        local positionStrings = PositionStrings.getInstance()
        CollidableCompositeLayer.toStringAppend(self, stringBuffer)
        stringBuffer:append(commonSeps.NEW_LINE)
        local groupInterfaceArray = self:getGroupInterface()
        local size = (groupInterfaceArray.n or #groupInterfaceArray)
        for index = 0, size - 1 do
            stringBuffer:append(tostring(groupInterfaceArray[index + 1]))
            stringBuffer:append(commonSeps.COMMA)
        end
        local pickupBehavior = self:getPickupBehavior()
        if pickupBehavior ~= nil then
            stringBuffer:append(commonSeps.NEW_LINE)
            stringBuffer:append(tostring(pickupBehavior))
        end
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append(CollidableDestroyableDamageableLayer.READYFOREXPLOSION)
        stringBuffer:appendboolean(self.readyForExplosion)
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append(self.commonStrings.INIT)
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(positionStrings.X_LABEL)
        stringBuffer:appendint(self.initX)
        stringBuffer:append(positionStrings.Y_LABEL)
        stringBuffer:appendint(self.initX)
        stringBuffer:append(positionStrings.Z_LABEL)
        stringBuffer:appendint(self.initZ)
end


function CollidableDestroyableDamageableLayer:toString()
        local stringBuffer = StringMaker.new()
        self:toStringAppend(stringBuffer)
        return tostring(stringBuffer)
end
CollidableDestroyableDamageableLayer.__tostring = function(self) return self:toString() end

CollidableDestroyableDamageableLayer.NULL_COLLIDABLE_DESTROYABLE_DAMAGE_LAYER = NullUtil.getInstance().NULL_OBJECT
CollidableDestroyableDamageableLayer.READYFOREXPLOSION = "ReadyForExplosion: "

return CollidableDestroyableDamageableLayer

