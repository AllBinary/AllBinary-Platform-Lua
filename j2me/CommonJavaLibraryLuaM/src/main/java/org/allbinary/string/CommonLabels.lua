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
-- package org.allbinary.string

local JsType = require("jsinterop.annotations.JsType")
local JsMethod = require("jsinterop.annotations.JsMethod")
local JsProperty = require("jsinterop.annotations.JsProperty")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CommonLabels = {}
CommonLabels.__index = CommonLabels
CommonLabels.className = "CommonLabels"

function CommonLabels:_init_fields()
    self.WIDTH_LABEL = " Width: "
    self.HEIGHT_LABEL = " Height: "
    self.END_LABEL = "End: "
    self.TOTAL_LABEL = "Total: "
    self.INDEX_LABEL = "index: "
    self.START_LABEL = "Start: "
    self.COMMAND_LABEL = "Command: "
    self.NAME_LABEL = "Name: "
    self.START = self.START_LABEL
    self.ELAPSED = " Elapsed: "
    self.CURRENT = " Current: "
    self.NEXT = "Next"
    self.ITEM_LABEL = "Item: "
    self.RESULT_ = "Result: "
    self.COLON_SEP = ": "
end

function CommonLabels.new()
    local self = setmetatable({}, CommonLabels)
    self:_init_fields()
    return self
end


function CommonLabels.getInstance()
        return CommonLabels.instance
end

CommonLabels.instance = CommonLabels.new()

return CommonLabels

