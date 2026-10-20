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
-- package views.admin.inventory

-- local HashMap = require("java.util.HashMap")
-- local Set = require("java.util.Set")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local BasicItem = require("org.allbinary.business.user.commerce.inventory.item.BasicItem")
local BasicItemData = require("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local BasicItemView = require("org.allbinary.business.user.commerce.inventory.item.BasicItemView")
local ItemInterface = require("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local DownloadableItem = require("org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem")
local DownloadableItemView = require("org.allbinary.business.user.commerce.inventory.item.download.DownloadableItemView")
local StdUtil = require("org.allbinary.logic.StdUtil")
local HttpFileUploadUtil = require("org.allbinary.logic.communication.http.file.upload.HttpFileUploadUtil")
local HttpRequestUtil = require("org.allbinary.logic.communication.http.request.HttpRequestUtil")
local MultipartRequestParams = require("org.allbinary.logic.communication.http.request.MultipartRequestParams")
local RequestMapInterface = require("org.allbinary.logic.communication.http.request.RequestMapInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local PathUtil = require("org.allbinary.logic.io.path.PathUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local MediaData = require("org.allbinary.logic.visual.media.MediaData")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local FileItem = require("org.apache.commons.fileupload.FileItem")
local HttpStoreComponentView = require("views.business.context.modules.storefront.HttpStoreComponentView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InventoryItemView = {}
InventoryItemView.__index = InventoryItemView
InventoryItemView.className = "InventoryItemView"
setmetatable(InventoryItemView, {__index = HttpStoreComponentView})

function InventoryItemView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    self.request = nil
    self.imageFileName = nil
    self.mediaData = nil
    self.itemInterface = nil
    self.downloadableItemVector = nil
    self.requestHashMap = nil
end

function InventoryItemView.new(...)
    local count = select("#", ...)
    if count == 1 then return InventoryItemView._new1(...)
    elseif count == 2 then return InventoryItemView._new2(...)
    end
end


function InventoryItemView._new1(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), InventoryItemView)
    self:_init_fields()
        -- super(...) made self above
        self.request = self:getPageContext():getRequest()
        self:getFormData()
    return self
end


function InventoryItemView._new2(transformInfoInterface, empty)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), InventoryItemView)
    self:_init_fields()
        -- super(...) made self above
        self.request = self:getPageContext():getRequest()
    return self
end


function InventoryItemView:getTypeId()
        return InventoryItemView.TYPE_ID
end


-- throws Exception
function InventoryItemView:getFormData()
        self:setRequestHashMap(MultipartRequestParams.new(self.request):toHashMap())
        local imageFileItemObject = self:getRequestHashMap():get(self.basicItemData.IMAGE)
        if HttpFileUploadUtil.getInstance():isValid(imageFileItemObject) then
            local fileItem = imageFileItemObject
            if fileItem ~= nil and fileItem:getSize() > 1 then
                self.imageFileName = HttpRequestUtil.getInstance():generateFileName(fileItem:getName())
                local pathData = AbPathData.getInstance()
                local pathUtil = PathUtil.getInstance()
                self.mediaData = MediaData.get(pathData:getExtension(self.imageFileName))
                self.imageFileName = pathUtil:getWithoutExtension(self.imageFileName)
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append("Uploaded File Data: ")
                    stringBuffer:append(self.imageFileName)
                    stringBuffer:append(" Extension: ")
                    stringBuffer:append(self.mediaData:getName())
                    self.logUtil:putF(tostring(stringBuffer), self, "getFormData()")
                end
            end
        end
        self.itemInterface = BasicItem.new(self:getRequestHashMap())
end


function InventoryItemView:addDomNodeInterfaces()
        local vector = BasicArrayListD.new()
        local downloadableItem = nil
        local size = self.downloadableItemVector:size()
        for index = 0, size - 1 do
            downloadableItem = self.downloadableItemVector:get(index)
            vector:add(DownloadableItemView.new(downloadableItem))
        end
        self:addDomNodeInterface(BasicItemView.new(self.itemInterface, vector))
end


function InventoryItemView:getItemInterface()
        return self.itemInterface
end


-- throws Exception
function InventoryItemView:view()
        local try_ok, try_error = pcall(function()
            self:addDomNodeInterfaces()
            return HttpStoreComponentView.view(self)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end


-- throws Exception
function InventoryItemView:processImageFiles()
        local set = self:getRequestHashMap():keySet()
        local fieldNameArray = set:toArray()
        local size = (fieldNameArray.n or #fieldNameArray)
        for index = 0, size - 1 do
            local fieldName = fieldNameArray[index + 1]
            if ((fieldName < self.basicItemData.IMAGE and -1) or (fieldName > self.basicItemData.IMAGE and 1) or 0) == 0 then
                local storeFrontInterface = StoreFrontFactory.getInstance(self:getWeblisketSession():getStoreName())
                local inventoryUploadMediaUtil = InventoryUploadMediaUtil.new(storeFrontInterface, self.itemInterface)
                local fileItem = self:getRequestHashMap():get(self.basicItemData.IMAGE)
                self.itemInterface = inventoryUploadMediaUtil:saveFiles(fileItem:get(), self.imageFileName, self.mediaData)
            end
        end
end


function InventoryItemView:setRequestHashMap(requestHashMap)
        self.requestHashMap = requestHashMap
end


function InventoryItemView:getRequestHashMap()
        return self.requestHashMap
end

InventoryItemView.TYPE_ID = 10

return InventoryItemView

