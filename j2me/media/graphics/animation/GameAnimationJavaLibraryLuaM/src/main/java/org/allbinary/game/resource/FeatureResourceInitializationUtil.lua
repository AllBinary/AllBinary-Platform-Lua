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

local FeaturedAnimationInterfaceFactoryInterfaceFactory = require("org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FeatureResourceInitializationUtil = {}
FeatureResourceInitializationUtil.__index = FeatureResourceInitializationUtil
FeatureResourceInitializationUtil.className = "FeatureResourceInitializationUtil"

function FeatureResourceInitializationUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function FeatureResourceInitializationUtil.new()
    local self = setmetatable({}, FeatureResourceInitializationUtil)
    self:_init_fields()
    return self
end


function FeatureResourceInitializationUtil.getInstance()
        return FeatureResourceInitializationUtil.instance
end


-- throws Exception
function FeatureResourceInitializationUtil:init(level)
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF(commonStrings.START, self, commonStrings.INIT)
        local featuredResourceFactory = FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance()
        featuredResourceFactory:init(level)
        FeaturedResourceRelativeRelationshipFactory.getInstance():init(level)
end

FeatureResourceInitializationUtil.instance = FeatureResourceInitializationUtil.new()

return FeatureResourceInitializationUtil

