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
-- package views.admin.inventory.download

local BasicItem = require("org.allbinary.business.user.commerce.inventory.item.BasicItem")
local ItemInterface = require("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local DownloadableItem = require("org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local DownloadableInventoryItemView = require("views.admin.inventory.download.DownloadableInventoryItemView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NewValidationView = {}
NewValidationView.__index = NewValidationView
NewValidationView.className = "NewValidationView"
setmetatable(NewValidationView, {__index = DownloadableInventoryItemView})


function NewValidationView.new(transformInfoInterface)
    local self = setmetatable(DownloadableInventoryItemView.new(transformInfoInterface, StringUtil.getInstance().EMPTY_STRING), NewValidationView)
        -- super(...) made self above
        self.itemInterface = BasicItem.new()
        self.downloadableItem = DownloadableItem.new(self.itemInterface:getId())
    return self
end


function NewValidationView:isValid()
        local try_ok, try_error = pcall(function()
            return true
        end)
        if not try_ok then
            local e = try_error
            return false
        end
end


function NewValidationView:toValidationInfoDoc()
        return nil
end


function NewValidationView:toValidationInfoNode(document)
        return nil
end


function NewValidationView:validationInfo()
        return "Error Creating New Downloadable Item"
end

return NewValidationView

