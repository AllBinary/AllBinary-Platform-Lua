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

local InventoryUploadMediaUtil = {}
package.loaded["views.admin.inventory.InventoryUploadMediaUtil"] = InventoryUploadMediaUtil

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local ByteArrayInputStream = java_lazy("java.io.ByteArrayInputStream")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local ItemInterface = java_lazy("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local UploadMediaSingleton = java_lazy("org.allbinary.logic.communication.http.file.upload.media.UploadMediaSingleton")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local FileUtil = java_lazy("org.allbinary.logic.io.file.FileUtil")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local MediaData = java_lazy("org.allbinary.logic.visual.media.MediaData")
local MediaTypeData = java_lazy("org.allbinary.logic.visual.media.MediaTypeData")
local MediaUtil = java_lazy("org.allbinary.logic.visual.media.MediaUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table InventoryUploadMediaUtil is declared before the requires
InventoryUploadMediaUtil.__index = InventoryUploadMediaUtil
InventoryUploadMediaUtil.className = "InventoryUploadMediaUtil"
InventoryUploadMediaUtil.javaClassName = "views.admin.inventory.InventoryUploadMediaUtil"

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
    if self.storeFrontInterface == nil then self.storeFrontInterface = nil end
    if self.itemInterface == nil then self.itemInterface = nil end
end


function InventoryUploadMediaUtil._jinit(self, storeFrontInterface, itemInterface)
    InventoryUploadMediaUtil._init_fields(self)
        self.storeFrontInterface = storeFrontInterface
        self.itemInterface = itemInterface
    return self
end

function InventoryUploadMediaUtil.new(...)
    local self = setmetatable({}, InventoryUploadMediaUtil)
    InventoryUploadMediaUtil._jinit(self, ...)
    return self
end


-- throws Exception
function InventoryUploadMediaUtil:saveFiles(byteArray, fileName, mediaData)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().CATEGORY) then
            self.logUtil:putF(require("allbinary_java").to_string("Start FileName: ") .. require("allbinary_java").to_string(fileName), self, "saveFiles()")
        end
        if StringValidationUtil.getInstance():isEmpty(fileName) then
            error(require("java.lang.Exception").new("Image File Name Was Null"), 0)
        end
        local fileUtil = FileUtil.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(URLGLOBALS.getWebappPath())
        stringBuffer:append(self.storeFrontInterface:getCurrentHostNamePath())
        stringBuffer:append(self.itemInterface:getCategory())
        local fullPath = tostring(stringBuffer)
        local imageDirectoryFile = AbFile.createAbFile(fullPath)
        if not (imageDirectoryFile:isDirectory()) then
            error(require("java.lang.Exception").new("Unable to save file to non existant directory"), 0)
        end
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(fullPath)
        stringBuffer:append(fileName)
        stringBuffer:append(AbPathData.getInstance().EXTENSION_SEP)
        stringBuffer:append(mediaData:getName())
        local originalImageFile = AbFile.createAbFile(tostring(stringBuffer))
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().CATEGORY) then
            self.logUtil:putF(require("allbinary_java").to_string("Saving Original Image: ") .. require("allbinary_java").to_string(originalImageFile), self, "saveFiles()")
        end
        originalImageFile:createNewFile()
        fileUtil:write(ByteArrayInputStream.new(byteArray), originalImageFile)
        local uploadMedia = UploadMediaSingleton.getInstance()
        local isMediaSupported = uploadMedia:isWriterSupported(mediaData:getName()) or uploadMedia:isReaderSupported(mediaData:getName())
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().CATEGORY) then
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
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().CATEGORY) then
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
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().CATEGORY) then
                    self.logUtil:putF(require("allbinary_java").to_string("Saving Small Image: ") .. require("allbinary_java").to_string(self.itemInterface:getSmallImage()), self, "saveFiles()")
                end
                self.mediaUtil:saveImageFile(originalImageFile, self.itemInterface:getSmallImage(), fullPath, mediaData, self.SMALLWIDTH, self.SMALLHEIGHT)
                self.mediaUtil:saveImageFile(originalImageFile, self.itemInterface:getMediumImage(), fullPath, mediaData, self.MEDIUMWIDTH, self.MEDIUMHEIGHT)
                self.mediaUtil:saveImageFile(originalImageFile, self.itemInterface:getLargeImage(), fullPath, mediaData, self.LARGEWIDTH, self.LARGEHEIGHT)
            else
                local isConvertable = mediaData:isConvertableTo(defaultMediaData)
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().CATEGORY) then
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
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().CATEGORY) then
                        self.logUtil:putF(require("allbinary_java").to_string("Saving Small Image: ") .. require("allbinary_java").to_string(self.itemInterface:getSmallImage()), self, "saveFiles()")
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
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().CATEGORY) then
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

