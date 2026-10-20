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
-- package org.allbinary.layer

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicGroupFactory = require("org.allbinary.game.identification.BasicGroupFactory")
local Group = require("org.allbinary.game.identification.Group")
local GPoint = require("org.allbinary.graphics.GPoint")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local RectangleFactory = require("org.allbinary.graphics.RectangleFactory")
local OpenGLFeatureUtil = require("org.allbinary.graphics.opengles.OpenGLFeatureUtil")
local TsUtil = require("org.allbinary.TsUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local PositionStrings = require("org.allbinary.math.PositionStrings")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local ViewPositionBase = require("org.allbinary.view.ViewPositionBase")
local ViewPositionEvent = require("org.allbinary.view.event.ViewPositionEvent")
local Layer = require("org.allbinary.layer.Layer")
local LayerInterface = require("org.allbinary.layer.LayerInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinaryLayer = {}
AllBinaryLayer.__index = AllBinaryLayer
AllBinaryLayer.className = "AllBinaryLayer"
setmetatable(AllBinaryLayer, {__index = Layer})

function AllBinaryLayer:_init_fields()
    self.viewPositionEvent = ViewPositionEvent.new(self)
    self.halfWidth = 0
    self.halfHeight = 0
    self.name = nil
    self.viewPosition = ViewPositionBase.NULL_VIEW_POSITION
end


function AllBinaryLayer.new(name, rectangle, viewPosition)
    local self = setmetatable(Layer.new(rectangle:getWidth(), rectangle:getHeight()), AllBinaryLayer)
    self:_init_fields()
        -- super(...) made self above
        local localName = nil
        if name == nil then
            localName = getmetatable(self).className
        else
            localName = tostring(StringMaker.new():append(name):append(CommonSeps.getInstance().COLON):append(string.format("%x", TsUtil.getInstance():hashCode(self))))
        end
        self.name = localName
        local point = rectangle:getPoint()
        self:setPosition(point:getX(), point:getY(), point:getZ())
        self:setHalfWidth((((self:getWidth()) // (1 << (1)))))
        self:setHalfHeight((((self:getHeight()) // (1 << (1)))))
        self.viewPosition = viewPosition
        self.viewPosition:setAllbinaryLayer(self)
    return self
end


-- throws Exception
function AllBinaryLayer:onChangeEvent(layerManagerEvent)
end


function AllBinaryLayer:paintThreed(graphics)
end


function AllBinaryLayer:getX2()
        return self:getXP() + self:getWidth()
end


function AllBinaryLayer:getY2()
        return self:getYP() + self:getHeight()
end


function AllBinaryLayer:getZ2()
        return java_int((self:getZP() + self:getDepth()))
end


function AllBinaryLayer:getName()
        return self.name
end


function AllBinaryLayer:setHalfWidth(halfWidth)
        self.halfWidth = halfWidth
end


function AllBinaryLayer:getHalfWidth()
        return self.halfWidth
end


function AllBinaryLayer:setHalfHeight(halfHeight)
        self.halfHeight = halfHeight
end


function AllBinaryLayer:getHalfHeight()
        return self.halfHeight
end


function AllBinaryLayer:getHalfDepth()
        return java_idiv(java_int(self:getDepth()), 2)
end


function AllBinaryLayer:getViewPosition()
        return self.viewPosition
end


function AllBinaryLayer:setViewPosition(viewPosition)
        self.viewPosition = viewPosition
end


function AllBinaryLayer:getGroupInterface()
        return BasicGroupFactory.getInstance().NONE_ARRAY
end


function AllBinaryLayer:implmentsTickableInterface()
        return false
end


function AllBinaryLayer:implmentsGameInputInterface()
        return false
end


function AllBinaryLayer:implmentsArtificialIntelligenceCompositeInterface()
        return false
end


function AllBinaryLayer:implmentsCollidableInterface()
        return false
end


function AllBinaryLayer:implementsThreedInterface()
        return OpenGLFeatureUtil.getInstance():isAnyThreed()
end


function AllBinaryLayer:getType()
        return -1
end


function AllBinaryLayer:getMultiPlayerType()
        return -1
end


function AllBinaryLayer:toStringAppend(stringBuffer)
        local commonSeps = CommonSeps.getInstance()
        local positionStrings = PositionStrings.getInstance()
        local commonLabels = CommonLabels.getInstance()
        stringBuffer:append(self:getName())
        stringBuffer:append(commonSeps.COLON)
        stringBuffer:append(AllBinaryLayer.TYPE)
        stringBuffer:appendint(self:getType())
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(positionStrings.X_LABEL)
        stringBuffer:appendint(java_int(self:getXP()))
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(positionStrings.Y_LABEL)
        stringBuffer:appendint(java_int(self:getYP()))
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(positionStrings.Z_LABEL)
        stringBuffer:appendint(java_int(self:getZP()))
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(commonLabels.WIDTH_LABEL)
        stringBuffer:appendint(java_int(self:getWidth()))
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(commonLabels.HEIGHT_LABEL)
        stringBuffer:appendint(java_int(self:getHeight()))
end


function AllBinaryLayer:toString()
        local stringBuffer = StringMaker.new()
        self:toStringAppend(stringBuffer)
        return tostring(stringBuffer)
end
AllBinaryLayer.__tostring = function(self) return self:toString() end

AllBinaryLayer.NULL_ALLBINARY_LAYER = AllBinaryLayer.new(StringUtil.getInstance().EMPTY_STRING, RectangleFactory.SINGLETON, ViewPositionBase.NULL_VIEW_POSITION)
AllBinaryLayer.TYPE = "Type: "

return AllBinaryLayer

