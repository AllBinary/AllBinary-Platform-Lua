-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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

-- local Image = require("javax.microedition.lcdui.Image")
-- local Sprite = require("javax.microedition.lcdui.game.Sprite")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SpriteFactoryInterface = require("org.allbinary.game.layer.SpriteFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SpriteFactory = {}
SpriteFactory.__index = SpriteFactory
SpriteFactory.className = "SpriteFactory"

function SpriteFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function SpriteFactory.new()
    local self = setmetatable({}, SpriteFactory)
    self:_init_fields()
    return self
end


function SpriteFactory.getInstance()
        return SpriteFactory.instance
end


function SpriteFactory:createSprite(image, frameWidth, frameHeight)
        return Sprite.new(image, frameWidth, frameHeight, image:getWidth() / frameWidth, image:getHeight() / frameHeight)
end

SpriteFactory.instance = SpriteFactory.new()

return SpriteFactory

