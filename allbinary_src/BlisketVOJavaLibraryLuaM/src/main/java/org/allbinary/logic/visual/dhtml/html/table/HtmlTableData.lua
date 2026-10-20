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
-- package org.allbinary.logic.visual.dhtml.html.table

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

local HtmlTableData = {}
HtmlTableData.__index = HtmlTableData
HtmlTableData.className = "HtmlTableData"

function HtmlTableData:_init_fields()
    self.LEFT = CommonStrings.getInstance().LEFT
    self.RIGHT = CommonStrings.getInstance().RIGHT
    self.NONE = "none"
    self.TOP = "top"
    self.BOTTOM = "bottom"
    self.TOPBOT = "topbot"
    self.SIDES = "sides"
    self.ALL = "all"
    self.BORDERED = "border"
    self.BASIC = "basic"
    self.ROWS = "rows"
    self.FRAMES = {self.NONE, self.TOP, self.BOTTOM, self.TOPBOT, self.SIDES, self.ALL, self.BORDERED}
end

function HtmlTableData.new()
    local self = setmetatable({}, HtmlTableData)
    self:_init_fields()
    return self
end


function HtmlTableData.getInstance()
        return HtmlTableData.instance
end

HtmlTableData.instance = HtmlTableData.new()

return HtmlTableData

