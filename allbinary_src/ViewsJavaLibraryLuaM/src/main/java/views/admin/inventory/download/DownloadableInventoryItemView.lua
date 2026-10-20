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

-- local ByteArrayInputStream = require("java.io.ByteArrayInputStream")
-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local BasicItemData = require("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local BasicItemView = require("org.allbinary.business.user.commerce.inventory.item.BasicItemView")
local ItemInterface = require("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local DownloadableItem = require("org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem")
local DownloadableItemView = require("org.allbinary.business.user.commerce.inventory.item.download.DownloadableItemView")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local StdUtil = require("org.allbinary.logic.StdUtil")
local MultipartRequestParams = require("org.allbinary.logic.communication.http.request.MultipartRequestParams")
local RequestMapInterface = require("org.allbinary.logic.communication.http.request.RequestMapInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local FilePathData = require("org.allbinary.logic.io.file.FilePathData")
local FileUtil = require("org.allbinary.logic.io.file.FileUtil")
local ZipFileUtil = require("org.allbinary.logic.io.file.zip.ZipFileUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
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

local DownloadableInventoryItemView = {}
DownloadableInventoryItemView.__index = DownloadableInventoryItemView
DownloadableInventoryItemView.className = "DownloadableInventoryItemView"
setmetatable(DownloadableInventoryItemView, {__index = HttpStoreComponentView})

function DownloadableInventoryItemView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    self.request = nil
    self.id = nil
    self.itemInterface = nil
    self.downloadableItem = nil
    self.requestHashMap = nil
end

function DownloadableInventoryItemView.new(...)
    local count = select("#", ...)
    if count == 1 then return DownloadableInventoryItemView._new1(...)
    elseif count == 2 then return DownloadableInventoryItemView._new2(...)
    end
end


function DownloadableInventoryItemView._new1(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), DownloadableInventoryItemView)
    self:_init_fields()
        -- super(...) made self above
        self.request = self:getPageContext():getRequest()
        self:getFormData()
    return self
end


function DownloadableInventoryItemView._new2(transformInfoInterface, empty)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), DownloadableInventoryItemView)
    self:_init_fields()
        -- super(...) made self above
        self.request = self:getPageContext():getRequest()
    return self
end


function DownloadableInventoryItemView:getTypeId()
        return DownloadableInventoryItemView.TYPE_ID
end


-- throws Exception
function DownloadableInventoryItemView:getFormData()
        self:setRequestHashMap(MultipartRequestParams.new(self.request):toHashMap())
        self.id = self:getRequestHashMap():get(self.basicItemData.ID)
end


function DownloadableInventoryItemView:addDomNodeInterfaces()
        local vector = BasicArrayListD.new()
        if self.downloadableItem ~= nil then
            vector:add(DownloadableItemView.new(self.downloadableItem))
        end
        self:addDomNodeInterface(BasicItemView.new(self.itemInterface, vector))
end


-- throws Exception
function DownloadableInventoryItemView:view()
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
function DownloadableInventoryItemView:processFile(fileItem)
        local fileName = fileItem:getName()
        local fullPath = self:getItemFilePath()
        local itemResourceFile = AbFile.createAbFile(fullPath)
        itemResourceFile:mkdir()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(fullPath)
        stringBuffer:append(fileName)
        self.logUtil:putF("FileName: " .. fileName, self, "processFile()")
        local file = AbFile.createAbFile(tostring(stringBuffer))
        self.logUtil:putF(file:getPath(), self, "processFiles()")
        file:createNewFile()
        local byteArray = fileItem:get()
        FileUtil.getInstance():write(ByteArrayInputStream.new(byteArray), file)
end


-- throws Exception
function DownloadableInventoryItemView:unzip(fileItem)
        local fileName = fileItem:getName()
        local fullPath = self:getItemFilePath()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(fullPath)
        stringBuffer:append(fileName)
        self.logUtil:putF("FileName: " .. fileName, self, "unzip()")
        local file = AbFile.createAbFile(tostring(stringBuffer))
        self.logUtil:putF(file:getPath(), self, "unzip()")
        ZipFileUtil.getInstance():unzip(fullPath, file, fileName)
end


function DownloadableInventoryItemView:getItemFilePath()
        local storeFrontInterface = StoreFrontFactory.getInstance(self:getWeblisketSession():getStoreName())
        local filePathData = FilePathData.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.URLGLOBALS:getWebappPath())
        stringBuffer:append(storeFrontInterface:getCurrentHostNamePath())
        stringBuffer:append(self.itemInterface:getCategory())
        stringBuffer:appendchar(filePathData.SEPARATORCHAR)
        stringBuffer:append(self.itemInterface:getId())
        stringBuffer:appendchar(filePathData.SEPARATORCHAR)
        stringBuffer:append(self.downloadableItem:getId())
        stringBuffer:appendchar(filePathData.SEPARATORCHAR)
        return tostring(stringBuffer)
end


function DownloadableInventoryItemView:setRequestHashMap(requestHashMap)
        self.requestHashMap = requestHashMap
end


function DownloadableInventoryItemView:getRequestHashMap()
        return self.requestHashMap
end


function DownloadableInventoryItemView:getDownloadableItem()
        return self.downloadableItem
end

DownloadableInventoryItemView.TYPE_ID = 11

return DownloadableInventoryItemView

