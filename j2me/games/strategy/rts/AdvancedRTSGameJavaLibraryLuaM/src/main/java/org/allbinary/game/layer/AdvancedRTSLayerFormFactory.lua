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
-- package org.allbinary.game.layer

local RTSLayerFormFactory = require("org.allbinary.game.input.RTSLayerFormFactory")
local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ScrollSelectionForm = require("org.allbinary.graphics.form.ScrollSelectionForm")
local ItemArraySingletonFactoryInterface = require("org.allbinary.graphics.form.item.ItemArraySingletonFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdvancedRTSLayerFormFactory = {}
AdvancedRTSLayerFormFactory.__index = AdvancedRTSLayerFormFactory
AdvancedRTSLayerFormFactory.className = "AdvancedRTSLayerFormFactory"
setmetatable(AdvancedRTSLayerFormFactory, {__index = RTSLayerFormFactory})

function AdvancedRTSLayerFormFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.scrollSelectionForm = nil
end


function AdvancedRTSLayerFormFactory.new(label, itemArrayFactoryInterface)
    local self = setmetatable(RTSLayerFormFactory.new(), AdvancedRTSLayerFormFactory)
    self:_init_fields()
        local scrollSelectionForm = ScrollSelectionForm.getNullScrollSelectionForm()
        local try_ok, try_error = pcall(function()
            local items = itemArrayFactoryInterface:getItems()
            scrollSelectionForm = RTSScrollSelectionFormFactory.getInstance(label, items)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.CONSTRUCTOR, e)
        end
        self.scrollSelectionForm = scrollSelectionForm
    return self
end


function AdvancedRTSLayerFormFactory:getInstance(rtsLayer)
        return self.scrollSelectionForm
end

return AdvancedRTSLayerFormFactory

