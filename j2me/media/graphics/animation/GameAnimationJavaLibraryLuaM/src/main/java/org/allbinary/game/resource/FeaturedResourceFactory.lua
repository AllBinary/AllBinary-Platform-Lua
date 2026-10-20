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
-- package org.allbinary.game.resource

local Features = require("org.allbinary.game.configuration.feature.Features")
local GameFeatureControlledInterface = require("org.allbinary.game.configuration.feature.GameFeatureControlledInterface")
local GraphicsFeatureFactory = require("org.allbinary.game.configuration.feature.GraphicsFeatureFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FeaturedResourceFactory = {}
FeaturedResourceFactory.__index = FeaturedResourceFactory
FeaturedResourceFactory.className = "FeaturedResourceFactory"

function FeaturedResourceFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.list = BasicArrayListD.new()
    self.commonStrings = CommonStrings.getInstance()
    self.ANIMATION_FEATURES = "Animation Features: Vector: "
    self.IMAGE_LABEL = " Image: "
    self.IMAGE_GRAPHICS_ARRAY = "Image Array: "
    self.IMAGE_GRAPHICS_ROTATION = "Image Rotate: "
    self.SPRITE_QUARTER = " Sprite Quarter: "
    self.SPRITE_FULL = " Sprite Full: "
    self.IS_LOADING_LEVEL_LABEL = " isLoadingLevel "
    self.IS_FEATURE = " isFeature: "
    self.GAME_FEATURE_CONTROLLED = "GameFeatureControlledInterface: "
end


function FeaturedResourceFactory.new()
    local self = setmetatable({}, FeaturedResourceFactory)
    self:_init_fields()
    return self
end


-- throws Exception
function FeaturedResourceFactory:init(level)
        local size = self.list:size()
        for index = 0, size - 1 do
            local featureInterface = self.list.objectArray[index + 1]
            local isLoadingLevel = featureInterface:isLoadingLevel(level)
            local isFeature = featureInterface:isFeature()
            self.logUtil:putF(tostring(StringMaker.new():append(self.GAME_FEATURE_CONTROLLED):append(tostring(featureInterface)):append(self.IS_LOADING_LEVEL_LABEL):append(ResourceLoadingLevelFactory.getInstance():getLevelString(level)):append(CommonSeps.getInstance().COLON_SEP):appendboolean(isLoadingLevel):append(self.IS_FEATURE):appendboolean(isFeature)), self, self.commonStrings.INIT)
            if isLoadingLevel and isFeature then
                featureInterface:init(level)
            end
        end
        local features = Features.getInstance()
        local graphicsFeatureFactory = GraphicsFeatureFactory.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.ANIMATION_FEATURES)
        stringBuffer:appendboolean(features:isFeature(graphicsFeatureFactory.VECTOR_GRAPHICS))
        stringBuffer:append(self.IMAGE_LABEL)
        stringBuffer:appendboolean(features:isFeature(graphicsFeatureFactory.IMAGE_GRAPHICS))
        self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.INIT)
        if features:isFeature(graphicsFeatureFactory.IMAGE_GRAPHICS) then
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append(self.IMAGE_GRAPHICS_ARRAY)
            stringBuffer:appendboolean(features:isFeature(graphicsFeatureFactory.IMAGE_TO_ARRAY_GRAPHICS))
            stringBuffer:append(self.IMAGE_GRAPHICS_ROTATION)
            stringBuffer:appendboolean(features:isFeature(graphicsFeatureFactory.IMAGE_TO_ARRAY_GRAPHICS))
            stringBuffer:append(self.SPRITE_QUARTER)
            stringBuffer:appendboolean(features:isFeature(graphicsFeatureFactory.SPRITE_QUARTER_ROTATION_GRAPHICS))
            stringBuffer:append(self.SPRITE_FULL)
            stringBuffer:appendboolean(features:isFeature(graphicsFeatureFactory.SPRITE_FULL_GRAPHICS))
            self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.INIT)
        end
end


function FeaturedResourceFactory:clear()
        self.list:clear()
end


function FeaturedResourceFactory:add(featureInterface)
        self.logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().START_LABEL):append(StringUtil.getInstance():toString(featureInterface))), self, self.commonStrings.ADD)
        self.list:add(featureInterface)
end


function FeaturedResourceFactory:getList()
        return self.list
end

return FeaturedResourceFactory

