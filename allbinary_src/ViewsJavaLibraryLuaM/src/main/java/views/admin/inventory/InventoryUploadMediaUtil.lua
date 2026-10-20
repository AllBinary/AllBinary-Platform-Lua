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

-- local ByteArrayInputStream = require("java.io.ByteArrayInputStream")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local ItemInterface = require("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local UploadMediaSingleton = require("org.allbinary.logic.communication.http.file.upload.media.UploadMediaSingleton")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local FileUtil = require("org.allbinary.logic.io.file.FileUtil")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local MediaData = require("org.allbinary.logic.visual.media.MediaData")
local MediaTypeData = require("org.allbinary.logic.visual.media.MediaTypeData")
local MediaUtil = require("org.allbinary.logic.visual.media.MediaUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

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

local InventoryUploadMediaUtil = {}
InventoryUploadMediaUtil.__index = InventoryUploadMediaUtil
InventoryUploadMediaUtil.className = "InventoryUploadMediaUtil"

function InventoryUploadMediaUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.mediaUtil = MediaUtil.getInstance()
    self.LARGEWIDTH = 1024
    self.LARGEHEIGHT = 1024
    self.MEDIUMWIDTH = 256
    self.MEDIUMHEIGHT = 256
    self.SMALLWIDTH = 128
    self.SMALLHEIGHT = 128
    self.SMALL = "Small"
    self.MEDIUM = "Medium"
    self.LARGE = "Large"
    self.storeFrontInterface = nil
    self.itemInterface = nil
end


function InventoryUploadMediaUtil.new(storeFrontInterface, itemInterface)
    local self = setmetatable({}, InventoryUploadMediaUtil)
    self:_init_fields()
        self.storeFrontInterface = storeFrontInterface
        self.itemInterface = itemInterface
    return self
end


-- throws Exception
function InventoryUploadMediaUtil:saveFiles(byteArray, fileName, mediaData)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
            self.logUtil:putF("Start FileName: " .. fileName, self, "saveFiles()")
        end
        if StringValidationUtil.getInstance():isEmpty(fileName) then
            error(java_exception("Exception", "Image File Name Was Null"), 0)
        end
        local fileUtil = FileUtil.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.URLGLOBALS:getWebappPath())
        stringBuffer:append(self.storeFrontInterface:getCurrentHostNamePath())
        stringBuffer:append(self.itemInterface:getCategory())
        local fullPath = tostring(stringBuffer)
        local imageDirectoryFile = AbFile.createAbFile(fullPath)
        if not imageDirectoryFile:isDirectory() then
            error(java_exception("Exception", "Unable to save file to non existant directory"), 0)
        end
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(fullPath)
        stringBuffer:append(fileName)
        stringBuffer:append(AbPathData.getInstance().EXTENSION_SEP)
        stringBuffer:append(mediaData:getName())
        local originalImageFile = AbFile.createAbFile(tostring(stringBuffer))
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
            self.logUtil:putF("Saving Original Image: " .. tostring(originalImageFile), self, "saveFiles()")
        end
        originalImageFile:createNewFile()
        fileUtil:write(ByteArrayInputStream.new(byteArray), originalImageFile)
        local uploadMedia = UploadMediaSingleton.getInstance()
        local isMediaSupported = uploadMedia:isWriterSupported(mediaData:getName()) or uploadMedia:isReaderSupported(mediaData:getName())
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append("Is Image Type: ")
            stringBuffer:append(mediaData:getName())
            stringBuffer:append(" supported: ")
            stringBuffer:appendboolean(isMediaSupported)
            self.logUtil:putF(tostring(stringBuffer), self, "saveFiles()")
        end
        local defaultMediaData = MediaData.getDefault()
        self:setFileNames(fileName)
        if isMediaSupported then
            local isMediaResizable = uploadMedia:isWriterMedia(mediaData:getName(), MediaTypeData.getInstance().RESIZABLE_MEDIA)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append("Is ")
                stringBuffer:append(tostring(mediaData))
                stringBuffer:append(" Image Resize Supported:")
                stringBuffer:appendboolean(uploadMedia:isSupported(mediaData:getName()))
                stringBuffer:append(" WriterMedia: ")
                stringBuffer:appendboolean(isMediaResizable)
                self.logUtil:putF(tostring(stringBuffer), self, "saveFiles()")
            end
            if isMediaResizable then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
                    self.logUtil:putF("Saving Small Image: " .. tostring(self.itemInterface:getSmallImage()), self, "saveFiles()")
                end
                self.mediaUtil:saveImageFile(originalImageFile, self.itemInterface:getSmallImage(), fullPath, mediaData, self.SMALLWIDTH, self.SMALLHEIGHT)
                self.mediaUtil:saveImageFile(originalImageFile, self.itemInterface:getMediumImage(), fullPath, mediaData, self.MEDIUMWIDTH, self.MEDIUMHEIGHT)
                self.mediaUtil:saveImageFile(originalImageFile, self.itemInterface:getLargeImage(), fullPath, mediaData, self.LARGEWIDTH, self.LARGEHEIGHT)
            else
                local isConvertable = mediaData:isConvertableTo(defaultMediaData)
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
                    stringBuffer:delete(0, stringBuffer:length())
                    stringBuffer:append("Converting: ")
                    stringBuffer:append(defaultMediaData:getName())
                    stringBuffer:append(" into ")
                    stringBuffer:append(mediaData:getName())
                    stringBuffer:append(" if Convertable is it: ")
                    stringBuffer:appendboolean(isConvertable)
                    self.logUtil:putF(tostring(stringBuffer), self, "saveFiles()")
                end
                if isConvertable then
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
                        self.logUtil:putF("Saving Small Image: " .. tostring(self.itemInterface:getSmallImage()), self, "saveFiles()")
                    end
                    self.mediaUtil:saveImageFile(originalImageFile, self.itemInterface:getSmallImage(), fullPath, defaultMediaData, self.SMALLWIDTH, self.SMALLHEIGHT)
                    self.mediaUtil:saveImageFile(originalImageFile, self.itemInterface:getMediumImage(), fullPath, defaultMediaData, self.MEDIUMWIDTH, self.MEDIUMHEIGHT)
                    self.mediaUtil:saveImageFile(originalImageFile, self.itemInterface:getLargeImage(), fullPath, defaultMediaData, self.LARGEWIDTH, self.LARGEHEIGHT)
                else
                    local smallImageFile = AbFile.createAbFile(self.itemInterface:getSmallImage())
                    smallImageFile:createNewFile()
                    fileUtil:write(ByteArrayInputStream.new(byteArray), smallImageFile)
                    local mediumImageFile = AbFile.createAbFile(self.itemInterface:getMediumImage())
                    smallImageFile:createNewFile()
                    fileUtil:write(ByteArrayInputStream.new(byteArray), mediumImageFile)
                    local largeImageFile = AbFile.createAbFile(self.itemInterface:getSmallImage())
                    largeImageFile:createNewFile()
                    fileUtil:write(ByteArrayInputStream.new(byteArray), largeImageFile)
                end
            end
        end
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF(commonStrings.END, self, "saveFiles()")
        end
        return self.itemInterface
end


function InventoryUploadMediaUtil:setFileNames(fileName)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.itemInterface:getId())
        stringBuffer:append(AbPathData.getInstance().EXTENSION_SEP)
        stringBuffer:append(MediaData.getDefault():getName())
        local END = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(fileName)
        stringBuffer:append(self.SMALL)
        stringBuffer:append(END)
        local newImageFileName = tostring(stringBuffer)
        self.itemInterface:setSmallImage(newImageFileName)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(fileName)
        stringBuffer:append(self.MEDIUM)
        stringBuffer:append(END)
        newImageFileName = tostring(stringBuffer)
        self.itemInterface:setMediumImage(newImageFileName)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(fileName)
        stringBuffer:append(self.LARGE)
        stringBuffer:append(END)
        newImageFileName = tostring(stringBuffer)
        self.itemInterface:setLargeImage(newImageFileName)
end

return InventoryUploadMediaUtil

