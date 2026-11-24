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

local FeaturedResourceFactory = {}
package.loaded["org.allbinary.game.resource.FeaturedResourceFactory"] = FeaturedResourceFactory

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
local GameFeatureControlledInterface = java_lazy("org.allbinary.game.configuration.feature.GameFeatureControlledInterface")
local GraphicsFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.GraphicsFeatureFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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

-- class table FeaturedResourceFactory is declared before the requires
FeaturedResourceFactory.__index = FeaturedResourceFactory
FeaturedResourceFactory.className = "FeaturedResourceFactory"
FeaturedResourceFactory.javaClassName = "org.allbinary.game.resource.FeaturedResourceFactory"

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


function FeaturedResourceFactory._jinit(self)
    FeaturedResourceFactory._init_fields(self)
    return self
end

function FeaturedResourceFactory.new(...)
    local self = setmetatable({}, FeaturedResourceFactory)
    FeaturedResourceFactory._jinit(self, ...)
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

