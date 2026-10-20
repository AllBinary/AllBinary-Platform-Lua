-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.layer.building

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local NumberStringHud = require("org.allbinary.game.ag.layer.hud.basic.NumberStringHud")
local NumberStringHudFactory = require("org.allbinary.game.ag.layer.hud.basic.NumberStringHudFactory")
local SelectionHudPaintable = require("org.allbinary.game.layer.SelectionHudPaintable")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BasicHudFactory = require("org.allbinary.game.graphics.hud.BasicHudFactory")
local NullPathFindingLayer = require("org.allbinary.game.layer.NullPathFindingLayer")
local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local MathUtil = require("org.allbinary.logic.math.MathUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BuildingInfoHudPaintable = {}
BuildingInfoHudPaintable.__index = BuildingInfoHudPaintable
BuildingInfoHudPaintable.className = "BuildingInfoHudPaintable"
setmetatable(BuildingInfoHudPaintable, {__index = SelectionHudPaintable})

function BuildingInfoHudPaintable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.HEALTH = "Health:"
    self.productivityHud = nil
    self.efficiencyHud = nil
    self.healthHud = nil
    self.maxHealthHud = nil
    self.rtsLayer = NullPathFindingLayer.NULL_PATH_FINDING_LAYER
    self.currentHealth = 0
end


function BuildingInfoHudPaintable.getInstance()
        return BuildingInfoHudPaintable.instance
end


function BuildingInfoHudPaintable.new()
    local self = setmetatable(SelectionHudPaintable.new(), BuildingInfoHudPaintable)
    self:_init_fields()
        local numberStringHudFactory = NumberStringHudFactory.getInstance()
        local productivityHud = numberStringHudFactory.NULL_NUMBER_STRING_HUD
        local efficiencyHud = numberStringHudFactory.NULL_NUMBER_STRING_HUD
        local healthHud = numberStringHudFactory.NULL_NUMBER_STRING_HUD
        local maxHealthHud = numberStringHudFactory.NULL_NUMBER_STRING_HUD
        local try_ok, try_error = pcall(function()
            local index = 0
            local basicHudFactory = BasicHudFactory.getInstance()
            local basicColor = self:getBasicColorP()
            local textX = self.textX
            local y = self.y
            local firstIndex = index
            local ProductivityNumberStringHud = {}
            ProductivityNumberStringHud.__index = ProductivityNumberStringHud
            ProductivityNumberStringHud.className = "ProductivityNumberStringHud"
            setmetatable(ProductivityNumberStringHud, {__index = NumberStringHud})
            

            function BuildingInfoHudPaintable.new()
                local self = setmetatable(NumberStringHud.new("Productivity:", 999, self.basicHudFactory.ABSOLUTE, self.basicHudFactory.HORIZONTAL, 0, self.basicColor), BuildingInfoHudPaintable)
                    -- super(...) made self above
                return self
            end
            

            function BuildingInfoHudPaintable:updateMeasurement(graphics)
                    local font = graphics:getFont()
                    self.updateMaxWidth = self.textX
                    self.updateMaxHeight = self.y + ((self.firstIndex + 1) * font:getHeight())
                    SelectionHudPaintable.updateMeasurement(self, graphics)
            end

            productivityHud = ProductivityNumberStringHud.new()
            index = index + 1
            local secondIndex = index
            local EfficiencyNumberStringHud = {}
            EfficiencyNumberStringHud.__index = EfficiencyNumberStringHud
            EfficiencyNumberStringHud.className = "EfficiencyNumberStringHud"
            setmetatable(EfficiencyNumberStringHud, {__index = NumberStringHud})
            

            function BuildingInfoHudPaintable.new()
                local self = setmetatable(NumberStringHud.new("Efficiency:", 999, self.basicHudFactory.ABSOLUTE, self.basicHudFactory.HORIZONTAL, 0, self.basicColor), BuildingInfoHudPaintable)
                    -- super(...) made self above
                return self
            end
            

            function BuildingInfoHudPaintable:updateMeasurement(graphics)
                    SelectionHudPaintable.updateMeasurement(self, graphics)
                    local font = graphics:getFont()
                    self.updateMaxWidth = self.textX
                    self.updateMaxHeight = self.y + ((self.secondIndex + 1) * font:getHeight())
            end

            efficiencyHud = EfficiencyNumberStringHud.new()
            index = index + 1
            local HEALTH = self.HEALTH
            local thirdIndex = index
            local HealthNumberStringHud = {}
            HealthNumberStringHud.__index = HealthNumberStringHud
            HealthNumberStringHud.className = "HealthNumberStringHud"
            setmetatable(HealthNumberStringHud, {__index = NumberStringHud})
            

            function BuildingInfoHudPaintable.new()
                local self = setmetatable(NumberStringHud.new(self.HEALTH, 99999, self.basicHudFactory.ABSOLUTE, self.basicHudFactory.HORIZONTAL, 0, self.basicColor), BuildingInfoHudPaintable)
                    -- super(...) made self above
                return self
            end
            

            function BuildingInfoHudPaintable:updateMeasurement(graphics)
                    local font = graphics:getFont()
                    self.updateMaxWidth = self.textX
                    self.updateMaxHeight = self.y + ((self.thirdIndex + 1) * font:getHeight())
                    SelectionHudPaintable.updateMeasurement(self, graphics)
            end

            local totalLength = #HEALTH + 1
            healthHud = HealthNumberStringHud.new()
            local fourthIndex = index
            local MaxHealthNumberStringHud = {}
            MaxHealthNumberStringHud.__index = MaxHealthNumberStringHud
            MaxHealthNumberStringHud.className = "MaxHealthNumberStringHud"
            setmetatable(MaxHealthNumberStringHud, {__index = NumberStringHud})
            

            function BuildingInfoHudPaintable.new()
                local self = setmetatable(NumberStringHud.new("/ ", 99999, self.basicHudFactory.ABSOLUTE, self.basicHudFactory.HORIZONTAL, 0, self.basicColor), BuildingInfoHudPaintable)
                    -- super(...) made self above
                return self
            end
            

            function BuildingInfoHudPaintable:updateMeasurement(graphics)
                    SelectionHudPaintable.updateMeasurement(self, graphics)
                    local font = graphics:getFont()
                    self.updateMaxWidth = self.textX + (self.totalLength * font:getHeight())
                    self.updateMaxHeight = self.y + ((self.fourthIndex + 1) * font:getHeight())
            end

            maxHealthHud = MaxHealthNumberStringHud.new()
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.CONSTRUCTOR, e)
        end
        self.productivityHud = productivityHud
        self.efficiencyHud = efficiencyHud
        self.healthHud = healthHud
        self.maxHealthHud = maxHealthHud
    return self
end


function BuildingInfoHudPaintable:updateMeasurement(graphics)
        local font = graphics:getFont()
        local totalLength = #self.HEALTH + MathUtil.getInstance():getTotalDigits(self.currentHealth)
        self.maxHealthHud:setX(self.textX + MyFontProcessor.defaultStringWidth(font, totalLength))
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function BuildingInfoHudPaintable:setBasicColorP(basicColor)
        SelectionHudPaintable.setBasicColorP(self, basicColor)
        self.productivityHud:setBasicColorP(basicColor)
        self.efficiencyHud:setBasicColorP(basicColor)
        self.healthHud:setBasicColorP(basicColor)
        self.maxHealthHud:setBasicColorP(basicColor)
end


function BuildingInfoHudPaintable:paint(graphics)
        SelectionHudPaintable.paint(self, graphics)
        self.myFontProcessor:process(graphics)
        self.productivityHud:paint(graphics)
        self.efficiencyHud:paint(graphics)
        self.healthHud:paint(graphics)
        self.maxHealthHud:paint(graphics)
        self:getAnimationInterface():paintXY(graphics, self.imageX, self.y)
end


function BuildingInfoHudPaintable:updateSelectionInfo()
        local buildingLayer = self.rtsLayer
        self:setName(buildingLayer:getName())
        self:setAnimationInterface(buildingLayer:getVerticleBuildAnimationInterface())
        self.productivityHud:set(buildingLayer:getProductivity())
        self.efficiencyHud:set(buildingLayer:getEfficiency() / 100)
        self.currentHealth = buildingLayer:getHealthInterface():getHealth()
        self.healthHud:set(self.currentHealth)
        self.myFontProcessor = self.updateMyFontProcessor
        self.maxHealthHud:set(buildingLayer:getHealthInterface():getMaxHealth())
end


function BuildingInfoHudPaintable:setRtsLayer(rtsLayer)
        self.rtsLayer = rtsLayer
end

BuildingInfoHudPaintable.instance = BuildingInfoHudPaintable.new()

return BuildingInfoHudPaintable

