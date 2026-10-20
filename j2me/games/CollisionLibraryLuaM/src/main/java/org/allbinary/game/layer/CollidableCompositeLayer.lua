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
-- package org.allbinary.game.layer

local ArtificialIntelligence = require("org.allbinary.ai.ArtificialIntelligence")
local ArtificialIntelligenceInterface = require("org.allbinary.ai.ArtificialIntelligenceInterface")
local CollidableBaseBehavior = require("org.allbinary.game.collision.CollidableBaseBehavior")
local CollidableBaseBehaviorFactory = require("org.allbinary.game.collision.CollidableBaseBehaviorFactory")
local CollidableInterfaceCompositeInterface = require("org.allbinary.game.collision.CollidableInterfaceCompositeInterface")
local CollidableNeverCollideBehaviorFactory = require("org.allbinary.game.collision.CollidableNeverCollideBehaviorFactory")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local RectangleFactory = require("org.allbinary.graphics.RectangleFactory")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local ViewPositionBase = require("org.allbinary.view.ViewPositionBase")
local NullUtil = require("org.allbinary.logic.NullUtil")
local AllBinaryGameLayer = require("org.allbinary.game.layer.AllBinaryGameLayer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CollidableCompositeLayer = {}
CollidableCompositeLayer.__index = CollidableCompositeLayer
CollidableCompositeLayer.className = "CollidableCompositeLayer"
setmetatable(CollidableCompositeLayer, {__index = AllBinaryGameLayer})

function CollidableCompositeLayer:_init_fields()
    self.collidableInferface = CollidableNeverCollideBehaviorFactory.getInstance():createBehavior()
end


function CollidableCompositeLayer.getNullInstance()
        if CollidableCompositeLayer.NULL_COLLIDABLE_COMPOSITE_LAYER == NullUtil.getInstance().NULL_OBJECT then
            CollidableCompositeLayer.NULL_COLLIDABLE_COMPOSITE_LAYER = CollidableCompositeLayer.new(StringUtil.getInstance().EMPTY_STRING, RectangleFactory.SINGLETON, ViewPositionBase.NULL_VIEW_POSITION, CollidableNeverCollideBehaviorFactory.getInstance())
        end
        return CollidableCompositeLayer.NULL_COLLIDABLE_COMPOSITE_LAYER
end


function CollidableCompositeLayer.new(name, layerInfo, viewPosition, collidableBaseBehaviorFactory)
    local self = setmetatable(AllBinaryGameLayer.new(name, layerInfo, viewPosition), CollidableCompositeLayer)
    self:_init_fields()
        -- super(...) made self above
        if collidableBaseBehaviorFactory ~= CollidableNeverCollideBehaviorFactory.getInstance() then
            self:setCollidableInferface(collidableBaseBehaviorFactory:createBehavior())
        end
    return self
end


function CollidableCompositeLayer:getArtificialIntelligenceInterface()
        ForcedLogUtil.log(self.commonStrings.NOT_IMPLEMENTED, self)
        return ArtificialIntelligence.getInstance()
end


function CollidableCompositeLayer:getCollidableInferface()
        return self.collidableInferface
end


function CollidableCompositeLayer:setCollidableInferface(collidableInferface)
        self.collidableInferface = collidableInferface
end


function CollidableCompositeLayer:implmentsCollidableInterface()
        return true
end


function CollidableCompositeLayer:toStringAppend(stringBuffer)
        local commonSeps = CommonSeps.getInstance()
        AllBinaryGameLayer.toStringAppend(self, stringBuffer)
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append(tostring(self:getCollidableInferface()))
end


function CollidableCompositeLayer:toString()
        local stringBuffer = StringMaker.new()
        self:toStringAppend(stringBuffer)
        return tostring(stringBuffer)
end
CollidableCompositeLayer.__tostring = function(self) return self:toString() end

CollidableCompositeLayer.NULL_COLLIDABLE_COMPOSITE_LAYER = NullUtil.getInstance().NULL_OBJECT

return CollidableCompositeLayer

