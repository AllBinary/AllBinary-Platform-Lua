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
-- package org.allbinary.graphics.displayable.screen

local AboutPaintable = require("org.allbinary.game.paint.AboutPaintable")
local NullPaintable = require("org.allbinary.graphics.paint.NullPaintable")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local AboutPaintableFactory = {}
AboutPaintableFactory.__index = AboutPaintableFactory
AboutPaintableFactory.className = "AboutPaintableFactory"

function AboutPaintableFactory:_init_fields()
    self.paintableArray = {NullPaintable.getInstance()}
end


function AboutPaintableFactory.getInstance()
        return AboutPaintableFactory.instance
end


function AboutPaintableFactory.new()
    local self = setmetatable({}, AboutPaintableFactory)
    self:_init_fields()
        local INFO = {"Built with the", "AllBinary Platform", StringUtil.getInstance().EMPTY_STRING, "Comments or Questions:", "support@allbinary.com"}
        local DEVELOPERS = {"Developed By:", "Travis Berthelot"}
        self.paintableArray = AboutPaintable.getInstance(INFO, DEVELOPERS):getPaintableArrayInstance()
    return self
end

AboutPaintableFactory.instance = AboutPaintableFactory.new()

return AboutPaintableFactory

