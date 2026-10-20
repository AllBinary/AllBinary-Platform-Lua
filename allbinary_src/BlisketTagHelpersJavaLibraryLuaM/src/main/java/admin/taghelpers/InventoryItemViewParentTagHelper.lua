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
-- package admin.taghelpers

local RequestMapInterface = require("org.allbinary.logic.communication.http.request.RequestMapInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TransformInterface = require("org.allbinary.logic.visual.transform.TransformInterface")
local ValidationViewHelper = require("taghelpers.ValidationViewHelper")
local HelperTag = require("tags.HelperTag")
local InventoryItemView = require("views.admin.inventory.InventoryItemView")
local DownloadableInventoryItemView = require("views.admin.inventory.download.DownloadableInventoryItemView")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_instanceof(object, class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
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

local InventoryItemViewParentTagHelper = {}
InventoryItemViewParentTagHelper.__index = InventoryItemViewParentTagHelper
InventoryItemViewParentTagHelper.className = "InventoryItemViewParentTagHelper"

function InventoryItemViewParentTagHelper.new()
    local self = setmetatable({}, InventoryItemViewParentTagHelper)
    return self
end


function InventoryItemViewParentTagHelper.getInstance()
        return InventoryItemViewParentTagHelper.instance
end


-- throws Exception
function InventoryItemViewParentTagHelper:getInventoryItemView(inventoryTag)
        if inventoryTag ~= nil then
            self:checkForValidationViewHelper(inventoryTag:getHelper())
            local validationViewHelper = inventoryTag:getHelper()
            local viewObject = validationViewHelper:getViewObject()
            if viewObject:getTypeId() ~= InventoryItemView.TYPE_ID then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Must have ")
                stringBuffer:append("InventoryItemView and not: ")
                stringBuffer:append(getmetatable(inventoryTag:getHelper()).className)
                error(java_exception("Exception", tostring(stringBuffer)), 0)
            end
            return viewObject
        else
            error(java_exception("Exception", "Must have parent tag."), 0)
        end
end


-- throws Exception
function InventoryItemViewParentTagHelper:getDownloadableInventoryItemView(inventoryTag)
        if inventoryTag ~= nil then
            self:checkForValidationViewHelper(inventoryTag:getHelper())
            local validationViewHelper = inventoryTag:getHelper()
            local viewObject = validationViewHelper:getViewObject()
            if viewObject:getTypeId() ~= DownloadableInventoryItemView.TYPE_ID then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Must have ")
                stringBuffer:append("DownloadableInventoryItemView and not: ")
                stringBuffer:append(getmetatable(inventoryTag:getHelper()).className)
                error(java_exception("Exception", tostring(stringBuffer)), 0)
            end
            return viewObject
        else
            error(java_exception("Exception", "Must have parent tag."), 0)
        end
end


-- throws Exception
function InventoryItemViewParentTagHelper:getRequestMapInterface(inventoryTag)
        if inventoryTag ~= nil then
            self:checkForValidationViewHelper(inventoryTag:getHelper())
            local validationViewHelper = inventoryTag:getHelper()
            local viewObject = validationViewHelper:getViewObject()
            if viewObject:getTypeId() ~= InventoryItemView.TYPE_ID and viewObject:getTypeId() ~= DownloadableInventoryItemView.TYPE_ID then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Must have ")
                stringBuffer:append("specific TYPE_ID and not: ")
                stringBuffer:append(getmetatable(inventoryTag:getHelper()).className)
                error(java_exception("Exception", tostring(stringBuffer)), 0)
            end
            return viewObject
        else
            error(java_exception("Exception", "Must have parent tag."), 0)
        end
end


-- throws Exception
function InventoryItemViewParentTagHelper:checkForValidationViewHelper(helperObject)
        if not (java_instanceof(helperObject, ValidationViewHelper)) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Must have ")
            stringBuffer:append("ValidationViewHelper")
            stringBuffer:append("and not: ")
            stringBuffer:append(getmetatable(helperObject).className)
            error(java_exception("Exception", tostring(stringBuffer)), 0)
        end
end

InventoryItemViewParentTagHelper.instance = InventoryItemViewParentTagHelper.new()

return InventoryItemViewParentTagHelper

