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

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicItemData = require("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local DownloadItemData = require("org.allbinary.business.user.commerce.inventory.item.download.DownloadItemData")
local DownloadableItem = require("org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem")
local MoneyException = require("org.allbinary.business.user.commerce.money.MoneyException")
local InventoryEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory")
local DownloadItemsEntity = require("org.allbinary.data.tables.user.commerce.inventory.item.downloads.DownloadItemsEntity")
local DownloadItemsEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.item.downloads.DownloadItemsEntityFactory")
local RequestParams = require("org.allbinary.logic.communication.http.request.RequestParams")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local EditValidationView = {}
EditValidationView.__index = EditValidationView
EditValidationView.className = "EditValidationView"
setmetatable(EditValidationView, {__index = DownloadableInventoryItemView})

function EditValidationView:_init_fields()
    self.downloadItemId = nil
end


function EditValidationView.new(transformInfoInterface)
    local self = setmetatable(DownloadableInventoryItemView.new(transformInfoInterface, StringUtil.getInstance().EMPTY_STRING), EditValidationView)
    self:_init_fields()
        -- super(...) made self above
        self:getFormData()
    return self
end


-- throws Exception
function EditValidationView:getFormData()
        local hashMap = RequestParams.new(self.request):toHashMap()
        if hashMap == nil then
            error(java_exception("Exception", "No Request Params Found"), 0)
        end
        self.id = hashMap:get(self.basicItemData.ID)
        self.downloadItemId = hashMap:get(DownloadItemData.ID)
end


-- throws Exception
function EditValidationView:isValid()
        if self.id == nil or not StringValidationUtil.getInstance():isNumber(self.id) then
            return false
        end
        self.itemInterface = InventoryEntityFactory.getInstance():getInventoryEntityInstance():getItem(self.id)
        if self.itemInterface == nil then
            return false
        end
        local downloadable = math.tointeger(tonumber(self.itemInterface:getDownloads()))
        if downloadable ~= 0 then
            local downloadItemsEntity = DownloadItemsEntityFactory.getInstance():getDownloadItemsEntityInstance()
            local vector = downloadItemsEntity:getForItem(self.id, self.downloadItemId)
            if vector:size() ~= 1 then
                return false
            end
            self.downloadableItem = vector:get(0)
        else
            return false
        end
        return true
end


function EditValidationView:toValidationInfoDoc()
        return nil
end


function EditValidationView:toValidationInfoNode(document)
        return nil
end


-- throws MoneyException
function EditValidationView:validationInfo()
        local stringBuffer = StringMaker.new()
        if self.id == nil or not StringValidationUtil.getInstance():isNumber(self.id) then
            stringBuffer:append("Id is not valid.<br />")
        end
        if InventoryEntityFactory.getInstance():getInventoryEntityInstance():getItem(self.id) == nil then
            stringBuffer:append("Item does not exist.<br />")
        end
        local downloadable = math.tointeger(tonumber(self.itemInterface:getDownloads()))
        if downloadable ~= 0 then
            if self.downloadableItem == nil then
                stringBuffer:append("DownloadableItem does not exist for item.<br />")
            end
        else
            stringBuffer:append("Item should not have DownloadableItem.<br />")
        end
        return tostring(stringBuffer)
end

return EditValidationView

