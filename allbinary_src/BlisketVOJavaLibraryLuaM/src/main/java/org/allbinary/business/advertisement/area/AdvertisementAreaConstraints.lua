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
-- package org.allbinary.business.advertisement.area

local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local DisplayInBrowserContraints = require("org.allbinary.logic.control.contraints.display.browser.DisplayInBrowserContraints")
local DisplayInBrowserContraintsInterface = require("org.allbinary.logic.control.contraints.display.browser.DisplayInBrowserContraintsInterface")
local TwoDimensionalConstraint = require("org.allbinary.logic.control.contraints.size.TwoDimensionalConstraint")
local TwoDimensionalConstraintInterface = require("org.allbinary.logic.control.contraints.size.TwoDimensionalConstraintInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local AdvertisementAreaConstraintsInterface = require("org.allbinary.business.advertisement.area.AdvertisementAreaConstraintsInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdvertisementAreaConstraints = {}
AdvertisementAreaConstraints.__index = AdvertisementAreaConstraints
AdvertisementAreaConstraints.className = "AdvertisementAreaConstraints"

function AdvertisementAreaConstraints:_init_fields()
    self.displayInBrowserContraintsInterface = nil
    self.twoDimensionConstraintsInterface = nil
end


function AdvertisementAreaConstraints.new(document)
    local self = setmetatable({}, AdvertisementAreaConstraints)
    self:_init_fields()
        local node = DomSearchHelper.getNode(AdvertisementAreaData.getInstance().NAME, document:getChildNodes())
        self.displayInBrowserContraintsInterface = DisplayInBrowserContraints.new(node)
        self.twoDimensionConstraintsInterface = TwoDimensionalConstraint.new(node)
    return self
end


function AdvertisementAreaConstraints:setDisplayInBrowserContraints(displayInBrowserContraintsInterface)
        self.displayInBrowserContraintsInterface = displayInBrowserContraintsInterface
end


function AdvertisementAreaConstraints:getTwoDimensionContraints(twoDimensionConstraintsInterface)
        self.twoDimensionConstraintsInterface = twoDimensionConstraintsInterface
end


function AdvertisementAreaConstraints:getDisplayInBrowserContraints()
        return self.displayInBrowserContraintsInterface
end


-- Java overloaded method: Lua keeps the last definition
function AdvertisementAreaConstraints:getTwoDimensionContraints()
        return self.twoDimensionConstraintsInterface
end

return AdvertisementAreaConstraints

